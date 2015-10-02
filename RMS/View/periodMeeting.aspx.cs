using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class view_periodMeeting : System.Web.UI.Page
{
    private User user;

    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["user"];

        if (!IsPostBack)
        {
            InitialParameter();
            PopulateDataSet();
        }
    }

    private void InitialParameter()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            ViewState.Add("id", Request.QueryString["id"]);
           // ViewState.Add("perid", Request.QueryString["perid"]);
        }
        else
        {
            ViewState.Add("id", "0");
        }

        if (!string.IsNullOrEmpty(Request.QueryString["m"]))
        {
            ViewState.Add("mode", Request.QueryString["m"]);
        }
        else
        {
            ViewState.Add("mode", "");
        }

        if (!string.IsNullOrEmpty(Request.QueryString["perid"]))
        {
            ViewState.Add("perid", Request.QueryString["perid"]);
          //  ViewState.Add("perperid", Request.QueryString["perperid"]);
        }
        else
        {
            ViewState.Add("perid", "0");
        }

       
        txtMeetingId.Value = ViewState["id"].ToString();

        mainClass cls = new mainClass();

        //cls.LoadLookUpToRadioButtonList(this.rblMEETING_TYPE_ID, "SELECT MEETING_TYPE_ID, MEETING_TYPE_NAME FROM MT_MEETING_TYPE WHERE DEL_FLAG = 'N'", "");
        //cls.LoadLookUpToDropDownList(ddlORG, "SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM COMMON_DATA..COMMON_PERSONAL_DEPARTMENT ORDER BY DEPARTMENT_NAME", "กรุณาเลือก");
        cls.LoadLookUpToDropDownList(ddlORG, "SELECT ORG_ID, ORG_TXT + ' ' + UORG_TXT UORG_TXT FROM ZMHRTR07 WHERE UORG_TXT <> '' and [MGRP] <= '40' and [MANDT]=900 and org_id<>'00003525' ORDER BY MGRP, ORG_TXT, UORG_TXT", "กรุณาเลือก");
        //SELECT ORG_ID, ORG_TXT FROM [SAPPRD].[dbo].[ZMHRTR07]
        //cls.LoadLookUpToDropDownList(ddlService, "SELECT SERVICE_ID, SERVICE_NAME FROM MT_SERVICE WHERE DEL_FLAG = 'N'", "กรุณาเลือก");

        txtRequestBy.Value = user.PERSONAL_FNAME_THA + " " + user.PERSONAL_LNAME_THA;
        txtRequestId.Value = user.PERSONAL_ID;

        txtMeetingDate.Value = cls.ExecuteSql("SELECT GETDATE()");

        string sql = string.Format("DELETE FROM TR_MEETING_PERIOD_TEMP WHERE SESSION_ID = '{0}'", user.SESSION_ID);
        cls.ExecNonQuery(sql);
    }

    private void PopulateDataSet()
    {
        mainClass cls = new mainClass();

        string sql = string.Format(@"SELECT MEETING_ID, MEETING_TITLE, PROVINCE_CODE, ORG_SEQ, WORK_GROUP_ID, 
                                        MEETING_DATE, MEETING_NAME, MEETING_TYPE_ID, SEQ_NO, PER_SEQ, DEL_FLAG, STATUS, MEETING_NOTE_CENCEL, 
                                        MEETING_ID_REF, PATH_FILE, USER_MEETING_ID, USER_CREATE, CREATE_DATE, USER_UPDATE, UPDATE_DATE, 
                                        USER_DELETE, DELETE_DATE, ORG_STR_SEQ_BOOK, PER_OTH_SEQ_BOOK, USER_TYPE_BOOK, ORG_ID_BOOK, NUMBER_OF_PEOPLES,
                                        ORG_STR_SEQ_MEETING_HEADER, ORG_STR_SEQ_BOOK_RESERVE, ISNULL(SERVICE_ID, '0') SERVICE_ID,
                                        (SELECT PERIOD_DATE_EN FROM [dbo].[getMeetingAll]() WHERE MEETING_ID = TR_MEETING.MEETING_ID) PERIOD_DATE_EN
                                    FROM TR_MEETING 
                                    WHERE DEL_FLAG = 'N' AND MEETING_ID = {1}", user.USER_NAME, ViewState["id"].ToString());

        sql = string.Format(@"SELECT TR_MEETING.MEETING_ID,PERIOD_ID, TR_MEETING.MEETING_NO, TR_MEETING.MEETING_TITLE,TR_MEETING.SERVICE_NOTE, TR_MEETING.MEETING_TYPE_ID, TR_MEETING.[STATUS], TR_MEETING.USER_CREATE, 
                                    ORG_STR_SEQ_BOOK, ORG_ID_BOOK, A.NUMBER_OF_PEOPLES, TR_MEETING.ORG_STR_SEQ_MEETING_HEADER, TR_MEETING.MEETING_DATE,
	                                ORG_STR_SEQ_BOOK_RESERVE, ISNULL(SERVICE_ID, '0') SERVICE_ID,
	                                A.PERIOD_DATE, A.PERIOD_DATE_EN, PERIOD_START, PERIOD_STOP, ROOM_NAME, ROOM_ID
                                FROM TR_MEETING 
	                                LEFT JOIN [dbo].[getMeetingAll]() A ON TR_MEETING.MEETING_ID = A.MEETING_ID
                                WHERE DEL_FLAG = 'N' AND TR_MEETING.MEETING_ID = {1} and PERIOD_ID='"+ViewState["perid"].ToString()+"'", user.USER_NAME, ViewState["id"].ToString());

        DataSet ds = cls.GetDataSet(sql, "TR_MEETING");
        SetMain(ds);
        CheckFormatDate();

        sql = @"SELECT MEETING_EQUIP_ID ,MEETING_ID, TR_MEETING_EQUIPMENT.EQUIP_ID, MT_EQUIPMENT.EQUIP_NAME, 
                    MEETING_EQUIP_QUANTITY, MT_EQUIPMENT.EQUIP_UNIT, TR_MEETING_EQUIPMENT.USER_CREATE
                FROM TR_MEETING_EQUIPMENT  
                    INNER JOIN MT_EQUIPMENT ON TR_MEETING_EQUIPMENT.EQUIP_ID = MT_EQUIPMENT.EQUIP_ID
                WHERE TR_MEETING_EQUIPMENT.DEL_FLAG = 'N' AND MEETING_ID = " + ViewState["id"];

        ds = cls.GetDataSet(sql, "TR_MEETING_EQUIPMENT");
        SetTableEquip(ds);

        ds.Dispose();
        cls.Dispose();
        ds = null;
        cls = null;
    }

    private void CheckFormatDate()
    {
        if (txtMeetingDate.Value.Contains('/'))
        {
            string[] arrDate = txtMeetingDate.Value.Split('/');
            if (arrDate.Length == 3)
            {
                int year = int.Parse(arrDate[2].Split(' ')[0]);

                if (year > 2500)
                {
                    year -= 543;
                    txtMeetingDate.Value = string.Format("{0}/{1}/{2}", arrDate[1], arrDate[0], year.ToString());
                }
            }
        }
    }

    private void SetPermission(string user_create)
    {
        if (ViewState["mode"].ToString() == "view")
        {
            ddlORG.Enabled = false;
            ddlService.Enabled = false;
            btnSave.Visible = false;
            txtPermission.Value = "false";
        }
        else if (ViewState["mode"].ToString() == "edit" && user.USER_NAME == user_create)
        {
            txtPermission.Value = "true";
        }
        else
        {
            ddlORG.Enabled = false;
            ddlService.Enabled = false;
            btnSave.Visible = false;
            txtPermission.Value = "false";
        }
    }

    private void SetMain(DataSet ds)
    {
        if (ds.Tables["TR_MEETING"].Rows.Count >0)
        {
            if (DateTime.Now > ((DateTime)ds.Tables["TR_MEETING"].Rows[0]["MEETING_DATE"]))  //if meeting started
                grpSelectWorkgroup.Visible = false;

            taMeetingTitle.Value = ds.Tables["TR_MEETING"].Rows[0]["MEETING_TITLE"].ToString();

            string _name = string.Empty, _pos = string.Empty, _tel = string.Empty;
            GetUserNameById(ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_MEETING_HEADER"].ToString(), ref _name, ref _pos, ref _tel);
            txtHeaderId.Value = ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_MEETING_HEADER"].ToString();
            txtHeader.Value = _name;

            txtMeetingNo.Value =  ds.Tables["TR_MEETING"].Rows[0]["MEETING_NO"].ToString();

            GetUserNameById(ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_BOOK"].ToString(), ref _name, ref _pos, ref _tel);
            txtRequestId.Value = ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_BOOK"].ToString();
            txtRequestBy.Value = _name;
            txtRequestByPosition.Value = _pos;
            txtRequestByTelephone.Value = _tel;

            GetUserNameById(ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_BOOK_RESERVE"].ToString(), ref _name, ref _pos, ref _tel);
            txtReserveId.Value = ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_BOOK_RESERVE"].ToString();
            txtReserveBy.Value = _name;
            txtReserveByPosition.Value = _pos;
            txtReserveByTelephone.Value = _tel;

            txtMeetingCapacity.Value = ds.Tables["TR_MEETING"].Rows[0]["NUMBER_OF_PEOPLES"].ToString();
            ddlORG.SelectedValue = ds.Tables["TR_MEETING"].Rows[0]["ORG_ID_BOOK"].ToString();
            ddlService.SelectedValue = ds.Tables["TR_MEETING"].Rows[0]["SERVICE_ID"].ToString();

            if (ds.Tables["TR_MEETING"].Rows[0]["PERIOD_DATE_EN"].ToString() != "")
            {
                txtMeetingStartDate.Value = string.Format("{0} {1}-{2}",
                                                        ds.Tables["TR_MEETING"].Rows[0]["PERIOD_DATE"].ToString(),
                                                        ds.Tables["TR_MEETING"].Rows[0]["PERIOD_START"].ToString(),
                                                        ds.Tables["TR_MEETING"].Rows[0]["PERIOD_STOP"].ToString());
                txtMeetingEndDate.Value = txtMeetingStartDate.Value;

                txtRoom.Value = ds.Tables["TR_MEETING"].Rows[0]["ROOM_NAME"].ToString();

                txtMeetingDate.Value = ds.Tables["TR_MEETING"].Rows[0]["PERIOD_DATE_EN"].ToString();
            }

            SetPermission(ds.Tables["TR_MEETING"].Rows[0]["USER_CREATE"].ToString());

            txtRoomId.Value = ds.Tables["TR_MEETING"].Rows[0]["ROOM_ID"].ToString();
            DataSet dsService = (new mainClass()).GetDataSet("SELECT SERVICE_ID, [SERVICE_NAME], ROOM_ID FROM MT_SERVICE WHERE DEL_FLAG = 'N' AND ROOM_ID IS NOT NULL", "MT_SERVICE");
            ddlService.Items.Add(new ListItem("กรุณาเลือก", "0"));
            foreach (DataRow dr in dsService.Tables["MT_SERVICE"].Rows)
            {
                string[] arrService = dr["ROOM_ID"].ToString().Split(',');

                foreach (string s in arrService)
                {
                    if (s == txtRoomId.Value)
                    {
                        ddlService.Items.Add(new ListItem(dr["SERVICE_NAME"].ToString(), dr["SERVICE_ID"].ToString()));
                    }
                }
            }

            txtServiceNote.Value = ds.Tables["TR_MEETING"].Rows[0]["SERVICE_NOTE"].ToString();

            ddlService.SelectedValue = ds.Tables["TR_MEETING"].Rows[0]["SERVICE_ID"].ToString();
       }
    }

    private void SetTableEquip(DataSet ds)
    {
        if (txtPermission.Value == "true")
        {
            string html = "<table id='tableEquip' class='table table-bordered table-hover' style='margin-bottom: 0;'>";
            html += @"<thead>
           	 			    <tr>
                                <th style='width: 20px'> </th>
                                <th>ชื่ออุปกรณ์</th>
              				    <th style='width: 120px'>จำนวน</th>
                                <th style='width: 80px'>หน่วย</th>
                                <th style='display: none;'>EQUIP_ID</th>
                                <th style='display: none;'>MEETING_EQUIP_ID</th>
            			    </tr>
          			    </thead>";
            html += "<tbody>";

            foreach (DataRow dr in ds.Tables["TR_MEETING_EQUIPMENT"].Rows)
            {
                html += "<tr>";
                html += string.Format("<td><a href='javascript:void(0)' onclick='DeleteItem(\"{0}\", \"{1}\")'><span class='glyphicon glyphicon-remove'></span></a></td>",
                                        dr["MEETING_EQUIP_ID"].ToString(), dr["EQUIP_ID"].ToString());
                html += string.Format("<td>{0}</td>", dr["EQUIP_NAME"].ToString());
                html += string.Format("<td><input type='text' id='txtEquipQuantity_{0}' value='{1}' class='form-control' /></td>",
                                        dr["EQUIP_ID"].ToString(),
                                        dr["MEETING_EQUIP_QUANTITY"].ToString());
                html += string.Format("<td>{0}</td>", dr["EQUIP_UNIT"].ToString());
                html += string.Format("<td style='display: none;'>{0}</td>", dr["EQUIP_ID"].ToString());
                html += string.Format("<td style='display: none;'>{0}</td>", dr["MEETING_EQUIP_ID"].ToString());
                html += "</tr>";
            }

            html += "</tbody>";
            html += "</table>";

            divTableEquip.InnerHtml = html;
        }
        else
        {
            string html = "<table id='tableEquip' class='table table-bordered table-hover' style='margin-bottom: 0;'>";
            html += @"<thead>
           	 			    <tr>
                                
                                <th>ชื่ออุปกรณ์</th>
              				    <th style='width: 120px'>จำนวน</th>
                                <th style='width: 80px'>หน่วย</th>
                                <th style='display: none;'>EQUIP_ID</th>
                                <th style='display: none;'>MEETING_EQUIP_ID</th>
            			    </tr>
          			    </thead>";
            html += "<tbody>";

            foreach (DataRow dr in ds.Tables["TR_MEETING_EQUIPMENT"].Rows)
            {
                html += "<tr>";
                html += string.Format("<td>{0}</td>", dr["EQUIP_NAME"].ToString());
                html += string.Format("<td style='text-align: center;'>{0}</td>", dr["MEETING_EQUIP_QUANTITY"].ToString());
                html += string.Format("<td>{0}</td>", dr["EQUIP_UNIT"].ToString());
                html += string.Format("<td style='display: none;'>{0}</td>", dr["EQUIP_ID"].ToString());
                html += string.Format("<td style='display: none;'>{0}</td>", dr["MEETING_EQUIP_ID"].ToString());
                html += "</tr>";
            }

            html += "</tbody>";
            html += "</table>";

            divTableEquip.InnerHtml = html;
        }
    }

    private void GetUserNameById(string id, ref string name, ref string position, ref string telephone)
    {
        name = string.Empty;
        position = string.Empty;
        telephone = string.Empty;

        try
        {
            string sql = @"SELECT ISNULL(PREFIX_NAME_THA, '') + PERSONAL_FNAME_THA + ' ' + ISNULL(PERSONAL_LNAME_THA, '') FULLNAME, POSITION_NAME_THA, PERSONAL_MOBILE
                            FROM [dbo].[VIEW_USER_AD]
                            WHERE PERSONAL_ID = " + id;
            DataSet ds = (new mainClass()).GetDataSet(sql, "VIEW_USER_AD");

            if (ds.Tables["VIEW_USER_AD"].Rows.Count == 1)
            {
                name = ds.Tables["VIEW_USER_AD"].Rows[0]["FULLNAME"].ToString();
                position = ds.Tables["VIEW_USER_AD"].Rows[0]["POSITION_NAME_THA"].ToString();
                telephone = ds.Tables["VIEW_USER_AD"].Rows[0]["PERSONAL_MOBILE"].ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }

    private bool SaveMeeting()
    {
        mainClass cls = new mainClass();
        string sql = "SELECT * FROM TR_MEETING WHERE MEETING_ID = " + ViewState["id"].ToString();
        string strDate = cls.ExecuteSql("SELECT GETDATE()");
        DataSet ds = cls.GetDataSet(sql, "TR_MEETING");

        if (ds.Tables["TR_MEETING"].Rows.Count == 0)
        {
            DataTable dt = new DataTable();
            dt = ds.Tables["TR_MEETING"];
            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            ds.Tables["TR_MEETING"].Rows[0]["USER_CREATE"] = user.USER_NAME;
            ds.Tables["TR_MEETING"].Rows[0]["CREATE_DATE"] = strDate;
        }
        
        ds.Tables["TR_MEETING"].Rows[0]["MEETING_TITLE"] = taMeetingTitle.Value;
        ds.Tables["TR_MEETING"].Rows[0]["MEETING_TYPE_ID"] = "1";
        ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_BOOK"] = (string.IsNullOrEmpty(txtRequestId.Value) ? "0" : txtRequestId.Value);
        ds.Tables["TR_MEETING"].Rows[0]["ORG_ID_BOOK"] = (ddlORG.SelectedIndex != 0 ? ddlORG.SelectedValue : "0");
        ds.Tables["TR_MEETING"].Rows[0]["NUMBER_OF_PEOPLES"] = txtMeetingCapacity.Value;
        ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_MEETING_HEADER"] = txtHeaderId.Value;
        ds.Tables["TR_MEETING"].Rows[0]["ORG_STR_SEQ_BOOK_RESERVE"] = (string.IsNullOrEmpty(txtReserveId.Value) ? "0" : txtReserveId.Value);
        ds.Tables["TR_MEETING"].Rows[0]["MEETING_DATE"] = strDate;
        ds.Tables["TR_MEETING"].Rows[0]["SERVICE_ID"] = (ddlService.SelectedIndex != 0) ? ddlService.SelectedValue : "0";
        ds.Tables["TR_MEETING"].Rows[0]["DEL_FLAG"] = "N";
        ds.Tables["TR_MEETING"].Rows[0]["MEETING_NO"] = txtMeetingNo.Value;
        ds.Tables["TR_MEETING"].Rows[0]["SERVICE_NOTE"] = txtServiceNote.Value;
        ds.Tables["TR_MEETING"].Rows[0]["USER_UPDATE"] = user.USER_NAME;
        ds.Tables["TR_MEETING"].Rows[0]["UPDATE_DATE"] = strDate;

        if (!string.IsNullOrEmpty(txtMeetingIdCont.Value))
        {
            ds.Tables["TR_MEETING"].Rows[0]["MEETING_ID_REF"] = txtMeetingIdCont.Value;
        }

        cls.Save(ds.Tables["TR_MEETING"], "TR_MEETING");
        
        if (ds.HasErrors)
        {
            ds.RejectChanges();
            return false;
        }
        else
        {
            if (ViewState["mode"].ToString() == "")
            {
                //sql = string.Format("SELECT MEETING_ID FROM TR_MEETING WHERE USER_CREATE = '{0}' AND CREATE_DATE = '{1}'", user.USER_NAME, strDate);
                sql = string.Format("SELECT TOP 1 MEETING_ID FROM TR_MEETING WHERE USER_CREATE = '{0}' ORDER BY MEETING_ID DESC", user.USER_NAME);
                string newMeetingId = cls.ExecuteSql(sql);
                
                ViewState["id"] = newMeetingId;
            }
            
            return true;
        }
    }

    private bool SaveMeetingPeriod()
    {
//        mainClass cls = new mainClass();

//        string sql = string.Format(@"INSERT INTO TR_MEETING_PERIOD(MEETING_ID, ROOM_ID, PERIOD_DATE, PERIOD_START, PERIOD_STOP, [STATUS], 
//	                                    DEL_FLAG, CREATE_DATE, CREATE_USER, UPDATE_DATE, UPDATE_USER)
//	                                    (SELECT {0}, ROOM_ID, PERIOD_DATE, PERIOD_START, PERIOD_STOP, [STATUS], DEL_FLAG, CREATE_DATE, CREATE_USER, UPDATE_DATE, UPDATE_USER
//	                                    FROM TR_MEETING_PERIOD_TEMP
//	                                    WHERE SESSION_ID = '{1}')", ViewState["id"].ToString(), user.SESSION_ID);
//        cls.ExecNonQuery(sql);

//        sql = string.Format("DELETE FROM TR_MEETING_PERIOD_TEMP WHERE SESSION_ID = '{0}'", user.SESSION_ID);
//        cls.ExecNonQuery(sql);

        string sql = string.Format("EXEC SP_SAVE_MEETING_PERIOD_SESSION {0}, '{1}', '{2}';",
                                    ViewState["id"].ToString(), user.SESSION_ID, user.USER_NAME);
        int result = (new mainClass()).ExecNonQuery(sql);

        return true;
    }

    private bool SaveEquiptment()
    {
        if (txtTableEquip.Value != "")
        {
            mainClass cls = new mainClass();
            string sql = "SELECT * FROM TR_MEETING_EQUIPMENT WHERE MEETING_ID = " + ViewState["id"].ToString();
            string strDate = cls.ExecuteSql("SELECT GETDATE()");
            DataSet ds = cls.GetDataSet(sql, "TR_MEETING_EQUIPMENT");

            string val = txtTableEquip.Value.Remove(txtTableEquip.Value.Length - 1, 1);
            string[] arr_val = val.Split('#');

            DataRow dr;
            DataRow[] arr_dr;
            foreach (var v in arr_val)
            {
                string[] arr_v = v.Split(',');
                if (!string.IsNullOrEmpty(arr_v[0]))
                {
                    arr_dr = cls.SelectDatarow(ds.Tables[0], "MEETING_EQUIP_ID = " + arr_v[0]);
                }
                else
                {
                    arr_dr = cls.SelectDatarow(ds.Tables[0], "MEETING_EQUIP_ID = -99");
                }

                if (arr_dr.Length == 0)
                {
                    dr = ds.Tables[0].NewRow();
                    dr["CREATE_DATE"] = strDate;
                    dr["USER_CREATE"] = user.USER_NAME;
                }
                else
                {
                    dr = arr_dr[0];
                }

                dr["MEETING_ID"] = ViewState["id"].ToString();
                dr["EQUIP_ID"] = arr_v[1];
                dr["MEETING_EQUIP_QUANTITY"] = arr_v[2];
                dr["DEL_FLAG"] = "N";
                dr["UPDATE_DATE"] = strDate;
                dr["USER_UPDATE"] = user.USER_NAME;

                if (arr_dr.Length == 0)
                {
                    ds.Tables[0].Rows.Add(dr);
                }
            }

            cls.Save(ds.Tables["TR_MEETING_EQUIPMENT"], "TR_MEETING_EQUIPMENT");

            if (ds.HasErrors)
            {
                ds.RejectChanges();
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return true;
        }
    }

    private int SaveAgenda()
    {
        mainClass cls = new mainClass();
        string sql = string.Format("EXEC SP_GENERATE_AGENDA {0}, '{1}';", ViewState["id"].ToString(), user.USER_NAME);
        int result = cls.ExecNonQuery(sql);

        if (!string.IsNullOrEmpty(txtMeetingIdCont.Value))
        {
            sql = string.Format(@"INSERT INTO TR_AGENDA(AGENDA_NO, PARENT_ID, AGENDA_NAME, AGENDA_DETAIL, AGENDA_PRESENTER_ID, MEETING_ID, LEVEL_NO, DESCRIPT, RESOLUTION, 
	                            ORG_STR_SEQ, DEL_FLAG, USER_CREATE, CREATE_DATE, USER_UPDATE, UPDATE_DATE)
                            (SELECT AGENDA_NO, (SELECT AGENDA_ID FROM TR_AGENDA WHERE MEETING_ID = {0} AND LEVEL_NO = 1 AND AGENDA_NO = 4), AGENDA_NAME, AGENDA_DETAIL, 
	                            AGENDA_PRESENTER_ID, {0}, LEVEL_NO, DESCRIPT, RESOLUTION, ORG_STR_SEQ, DEL_FLAG, '{2}', GETDATE(), '{2}', GETDATE()
                            FROM TR_AGENDA
                            WHERE MEETING_ID = {1} AND LEVEL_NO = 2)", ViewState["id"].ToString(), txtMeetingIdCont.Value, user.USER_NAME);

            cls.ExecNonQuery(sql);
        }
        
        return result;
    }

    private bool SaveMeetingHeader()
    {
        bool flag = false;
        string workGroupId = workgroupid.Value;
        if (workGroupId == null || workGroupId == "") return false;
        Response.Write("workGroupId=" + workGroupId + " ");
        mainClass cls = new mainClass();
        string strDate = cls.ExecuteSql("SELECT GETDATE()");
        string sql = string.Format("SELECT * FROM TR_MEETING_PERSON WHERE MEETING_ID = {0}  AND DEL_FLAG = 'N'", ViewState["id"].ToString());
        DataSet ds = cls.GetDataSet(sql, "TR_MEETING_PERSON");

        
        sql = string.Format(@"SELECT  u.PERSONAL_ID, g.POS_WORK_ID, p.POS_WORK_NAME ,ISNULL(PREFIX_NAME_THA, '') + PERSONAL_FNAME_THA + ' ' + ISNULL(PERSONAL_LNAME_THA, '') FULLNAME, 
	                                ISNULL(POSITION_NAME_THA, MANAGEMENT_NAME) POSITION_NAME_THA, PERSONAL_MOBILE, PERSONAL_EMAIL, ISNULL(DEPARTMENT_ID, 0) DEPARTMENT_ID, DEPARTMENT_NAME
                                FROM [dbo].[VIEW_USER_AD] u 
								inner join TR_WORK_GROUP_DETAIL g on u.PERSONAL_ID = g.PERSONAL_ID
								inner join MT_POSITION_WORK p on g.POS_WORK_ID = p.POS_WORK_ID
								WHERE g.DEL_FLAG = 'N' and p.DEL_FLAG = 'N' AND [WORK_GROUP_ID] = {0} 
								order by p.POS_WORK_ORDER", workGroupId);

        DataSet dsWG = cls.GetDataSet(sql, "TR_WG");

        if (ds.Tables["TR_MEETING_PERSON"].Rows.Count == 0)
        {
            for (int i = 0; i < dsWG.Tables["TR_WG"].Rows.Count; ++i)
            {
                string a =
                sql = string.Format(@"insert into TR_MEETING_PERSON
            ([MEETING_ID]
           ,[ORG_STR_SEQ]
           ,[POS_WORK_ID]
           ,[DEL_FLAG]
           ,[USER_CREATE]
           ,[CREATE_DATE]
           ,[USER_UPDATE]
           ,[UPDATE_DATE]) values({0},{1},{2},'N','{3}',getdate(),'{3}',getdate())"
              , ViewState["id"].ToString()
              , dsWG.Tables["TR_WG"].Rows[i]["PERSONAL_ID"].ToString()
              , dsWG.Tables["TR_WG"].Rows[i]["POS_WORK_ID"].ToString()
              , user.USER_NAME);
              //  Response.Write(sql + " | ");
              cls.ExecNonQuery(sql);
            }
        }

        

        if (ds.HasErrors)
        {
            ds.RejectChanges();
        }
        else
        {
            flag = true;
        }

        return flag;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool flag = false;

        try
        {
            if (SaveMeeting())
            {
                SaveEquiptment();
                SaveMeetingPeriod();
                SaveAgenda();
                SaveMeetingHeader();

                flag = true;
            }
        }
        catch (System.Data.OleDb.OleDbException exoledb)
        {
            Response.Write(exoledb.Message + "|" + exoledb.StackTrace);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "|" + ex.StackTrace);
        }

        if (flag)
        {
            (new mainClass()).CreateMessageAlertAndRedirect(this, "บันทึกข้อมูลเรียบร้อย", "periodList.aspx");
        }
        else
        {
            (new mainClass()).CreateMessageAlert(this, "เกิดข้อผิดพลาดระหว่างการบันทึกข้อมูล!");
        }
    }

    protected void btnLoadDDLService_Click(object sender, EventArgs e)
    {
        ddlService.Items.Clear();

        DataSet dsService = (new mainClass()).GetDataSet("SELECT SERVICE_ID, [SERVICE_NAME], ROOM_ID FROM MT_SERVICE WHERE DEL_FLAG = 'N' AND ROOM_ID IS NOT NULL", "MT_SERVICE");
        ddlService.Items.Add(new ListItem("กรุณาเลือก", "0"));
        foreach (DataRow dr in dsService.Tables["MT_SERVICE"].Rows)
        {
            string[] arrService = dr["ROOM_ID"].ToString().Split(',');

            foreach (string s in arrService)
            {
                if (s == txtRoomId.Value)
                {
                    ddlService.Items.Add(new ListItem(dr["SERVICE_NAME"].ToString(), dr["SERVICE_ID"].ToString()));
                }
            }
        }
    }

}