using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputMEETING_EQUIPMENT_ID="-1";
string inputMEETING_SERVICE_ID="-1";
string inputMEETING_MEMBER_ID="-1";
string inputAGENDA_SUB_ID="-1";
string inputAGENDA_SUB_DOC="-1";
string inputAGENDA_SUB_URL_ID="-1";
string inputAGENDA_DETAIL_DOC="-1";
string inputAGENDA_DETAIL_URL_ID="-1";
	string inputMainMEETING_ID="-1";
	string key="MEETING_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_RMM_MEETING_EQUIPMENT_ListView 
dsRMSM_RMM_MEETING_EQUIPMENT_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_EQUIPMENT_ID"] != null && Request.QueryString["MEETING_EQUIPMENT_ID"] != "-1")
        {
            inputMEETING_EQUIPMENT_ID = Request.QueryString["MEETING_EQUIPMENT_ID"];
        }
dsRMSM_RMM_MEETING_EQUIPMENT_ListView.SelectParameters.Add("MEETING_EQUIPMENT_ID", System.Data.DbType.Int32, inputMEETING_EQUIPMENT_ID);
//Grid RMSM_RMM_MEETING_SERVICE_ListView 
dsRMSM_RMM_MEETING_SERVICE_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_SERVICE_ID"] != null && Request.QueryString["MEETING_SERVICE_ID"] != "-1")
        {
            inputMEETING_SERVICE_ID = Request.QueryString["MEETING_SERVICE_ID"];
        }
dsRMSM_RMM_MEETING_SERVICE_ListView.SelectParameters.Add("MEETING_SERVICE_ID", System.Data.DbType.Int32, inputMEETING_SERVICE_ID);
//Grid RMSM_RMM_MEETING_MEMBER_MANAGER_ListView 
dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_MEMBER_ID"] != null && Request.QueryString["MEETING_MEMBER_ID"] != "-1")
        {
            inputMEETING_MEMBER_ID = Request.QueryString["MEETING_MEMBER_ID"];
        }
dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView.SelectParameters.Add("MEETING_MEMBER_ID", System.Data.DbType.Int32, inputMEETING_MEMBER_ID);
//Grid RMSM_RMM_MEETING_SUB_ListView 
dsRMSM_RMM_MEETING_SUB_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_ID"] != null && Request.QueryString["AGENDA_SUB_ID"] != "-1")
        {
            inputAGENDA_SUB_ID = Request.QueryString["AGENDA_SUB_ID"];
        }
dsRMSM_RMM_MEETING_SUB_ListView.SelectParameters.Add("AGENDA_SUB_ID", System.Data.DbType.Int32, inputAGENDA_SUB_ID);
//Grid RMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView 
dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_DOC"] != null && Request.QueryString["AGENDA_SUB_DOC"] != "-1")
        {
            inputAGENDA_SUB_DOC = Request.QueryString["AGENDA_SUB_DOC"];
        }
dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView.SelectParameters.Add("AGENDA_SUB_DOC", System.Data.DbType.Int32, inputAGENDA_SUB_DOC);
//Grid RMSM_RMM_MEETING_AGENDA_SUB_URL_ListView 
dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_URL_ID"] != null && Request.QueryString["AGENDA_SUB_URL_ID"] != "-1")
        {
            inputAGENDA_SUB_URL_ID = Request.QueryString["AGENDA_SUB_URL_ID"];
        }
dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView.SelectParameters.Add("AGENDA_SUB_URL_ID", System.Data.DbType.Int32, inputAGENDA_SUB_URL_ID);
//Grid RMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView 
dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_DETAIL_DOC"] != null && Request.QueryString["AGENDA_DETAIL_DOC"] != "-1")
        {
            inputAGENDA_DETAIL_DOC = Request.QueryString["AGENDA_DETAIL_DOC"];
        }
dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView.SelectParameters.Add("AGENDA_DETAIL_DOC", System.Data.DbType.Int32, inputAGENDA_DETAIL_DOC);
//Grid RMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView 
dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_DETAIL_URL_ID"] != null && Request.QueryString["AGENDA_DETAIL_URL_ID"] != "-1")
        {
            inputAGENDA_DETAIL_URL_ID = Request.QueryString["AGENDA_DETAIL_URL_ID"];
        }
dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView.SelectParameters.Add("AGENDA_DETAIL_URL_ID", System.Data.DbType.Int32, inputAGENDA_DETAIL_URL_ID);
		dsRMSM_RMM_MEETING_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_ID"] != null && Request.QueryString["MEETING_ID"] != "-1")
        {
            inputMainMEETING_ID = Request.QueryString["MEETING_ID"];
        }
		dsRMSM_RMM_MEETING_DetailView.SelectParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMainMEETING_ID);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
		JS="";
        if (Request.QueryString[key] != null && Request.QueryString[key] != "-1")
        {
            mode = "e";
        }
        if (!IsPostBack)
        {
            ctlMEETING_RESERVE_DATE.Text = DateTime.Now.ToString("dd/MM/yyyy");
            if (mode == "e")
                PopulateEditData();
            else if (mode == "n")
                PopulateNewData();
            
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (mode == "e")
            Update();
        else if (mode == "n")
            Insert();

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {

    }

    void PopulateEditData()
    {
        //

		//RMSM_RMM_MEETING_DetailView
		Title = "บันทึกการจองห้องประชุม(RMS_UT0102)"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMEETING_RESERVE_DATE.Value = drv["MEETING_RESERVE_DATE"].ToString();
        ctlMEETING_RESERVE_DATE.Attributes.Add("disabled","disabled");

        if (drv["MEETING_REQUEST_START_DATE"] != null && drv["MEETING_REQUEST_START_DATE"] != DBNull.Value)
            ctlMEETING_REQUEST_START_DATE.Date = (DateTime)drv["MEETING_REQUEST_START_DATE"];

        ctlMEETING_REQUEST_START_TIME.Value = drv["MEETING_REQUEST_START_TIME"].ToString();

        ctlMEETING_REQUEST_END_TIME.Value = drv["MEETING_REQUEST_END_TIME"].ToString();

        ctlROOM_ID.Value = drv["ROOM_ID"].ToString();

        ctlMEETING_CODE.Value = drv["MEETING_CODE"].ToString();
        ctlMEETING_CODE.Attributes.Add("disabled","disabled");

        ctlMEETING_SUBJECT.Text = drv["MEETING_SUBJECT"].ToString();

        ctlOFFICER_ID.Value = drv["OFFICER_ID"].ToString();
        ctlOFFICER_ID_label.Text = drv["NAME"].ToString();

        ctlMEETING_AMOUNT.Value = drv["MEETING_AMOUNT"].ToString();

        ctlMEETING_REQUEST_OFFICER.Value = drv["MEETING_REQUEST_OFFICER"].ToString();
        //ctlMEETING_REQUEST_OFFICER_label.Text = drv[""].ToString();

        ctlOFFICER_OPSITION_NAME.Value = drv["OFFICER_OPSITION_NAME"].ToString();
        ctlOFFICER_OPSITION_NAME.Attributes.Add("disabled","disabled");

        ctlMEETING_REQUEST_OFFICER_TEL.Value = drv["MEETING_REQUEST_OFFICER_TEL"].ToString();

        ctlORG.Value = drv["ORG"].ToString();
        ctlORG.Attributes.Add("disabled","disabled");

        ctlMEETING_ADMIN.Value = drv["MEETING_ADMIN"].ToString();
        ctlMEETING_ADMIN.Attributes.Add("disabled","disabled");

        ctlMEETING_NOTE.Text = drv["MEETING_NOTE"].ToString();

        ctlAGENDA_SUB_SEQ.Value = drv["AGENDA_SUB_SEQ"].ToString();

        ctlAGENDA_SUB_TOPIC.Value = drv["AGENDA_SUB_TOPIC"].ToString();

        ctlAGENDA_SUB_DESC.Text = drv["AGENDA_SUB_DESC"].ToString();

        ctlAGENDA_SUB_BOARD.Text = drv["AGENDA_SUB_BOARD"].ToString();

        ctlAGENDA_DETAIL_ID.Value = drv["AGENDA_DETAIL_ID"].ToString();
       // ctlAGENDA_DETAIL_ID_label.Text = drv[""].ToString();

        ctlAGENDA_DETAIL_SEQ.Value = drv["AGENDA_DETAIL_SEQ"].ToString();

        ctlAGENDA_DETAIL_TOPIC.Value = drv["AGENDA_DETAIL_TOPIC"].ToString();

        ctlAGENDA_DETAIL_DESC.Text = drv["AGENDA_DETAIL_DESC"].ToString();

        ctlAGENDA_DETAIL_BOARD.Text = drv["AGENDA_DETAIL_BOARD"].ToString();


        SetValidation();
        SetFormatting();
    }

    void PopulateNewData()
    {
        //

        SetValidation();
        SetFormatting();
    }

    void SetValidation()
    {
        //


    }

    void SetFormatting()
    {
        //
		ctlAGENDA_SUB_SEQ.DisplayFormatString = "n0";


    }

    void Insert()
    {
        //
		dsRMSM_RMM_MEETING_DetailView.InsertParameters.Clear();
        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_RESERVE_DATE", System.Data.DbType.String, ctlMEETING_RESERVE_DATE.Text);

        if (ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_REQUEST_START_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "MEETING_REQUEST_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add(p);
        }

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_REQUEST_START_TIME", System.Data.DbType.String, ctlMEETING_REQUEST_START_TIME.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_REQUEST_END_TIME", System.Data.DbType.String, ctlMEETING_REQUEST_END_TIME.Text);

        if (ctlROOM_ID.Value != null)
            dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_CODE", System.Data.DbType.String, ctlMEETING_CODE.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_SUBJECT", System.Data.DbType.String, ctlMEETING_SUBJECT.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("OFFICER_ID", System.Data.DbType.String, ctlOFFICER_ID.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_AMOUNT", System.Data.DbType.Int32, ctlMEETING_AMOUNT.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_REQUEST_OFFICER", System.Data.DbType.String, ctlMEETING_REQUEST_OFFICER.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("OFFICER_OPSITION_NAME", System.Data.DbType.String, ctlOFFICER_OPSITION_NAME.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_REQUEST_OFFICER_TEL", System.Data.DbType.String, ctlMEETING_REQUEST_OFFICER_TEL.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("ORG", System.Data.DbType.String, ctlORG.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_ADMIN", System.Data.DbType.String, ctlMEETING_ADMIN.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("MEETING_NOTE", System.Data.DbType.String, ctlMEETING_NOTE.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_SUB_SEQ", System.Data.DbType.Int32, ctlAGENDA_SUB_SEQ.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_SUB_TOPIC", System.Data.DbType.String, ctlAGENDA_SUB_TOPIC.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_SUB_DESC", System.Data.DbType.String, ctlAGENDA_SUB_DESC.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_SUB_BOARD", System.Data.DbType.String, ctlAGENDA_SUB_BOARD.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_DETAIL_ID", System.Data.DbType.String, ctlAGENDA_DETAIL_ID.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_DETAIL_SEQ", System.Data.DbType.Int32, ctlAGENDA_DETAIL_SEQ.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_DETAIL_TOPIC", System.Data.DbType.String, ctlAGENDA_DETAIL_TOPIC.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_DETAIL_DESC", System.Data.DbType.String, ctlAGENDA_DETAIL_DESC.Text);

        dsRMSM_RMM_MEETING_DetailView.InsertParameters.Add("AGENDA_DETAIL_BOARD", System.Data.DbType.String, ctlAGENDA_DETAIL_BOARD.Text);

		int i = dsRMSM_RMM_MEETING_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_RESERVE_DATE", System.Data.DbType.String, ctlMEETING_RESERVE_DATE.Text);
        if (ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_REQUEST_START_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "MEETING_REQUEST_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add(p);
        }
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_REQUEST_START_TIME", System.Data.DbType.String, ctlMEETING_REQUEST_START_TIME.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_REQUEST_END_TIME", System.Data.DbType.String, ctlMEETING_REQUEST_END_TIME.Text);
        if (ctlROOM_ID.Value != null)
            dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_CODE", System.Data.DbType.String, ctlMEETING_CODE.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_SUBJECT", System.Data.DbType.String, ctlMEETING_SUBJECT.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("OFFICER_ID", System.Data.DbType.String, ctlOFFICER_ID.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_AMOUNT", System.Data.DbType.Int32, ctlMEETING_AMOUNT.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_REQUEST_OFFICER", System.Data.DbType.String, ctlMEETING_REQUEST_OFFICER.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("OFFICER_OPSITION_NAME", System.Data.DbType.String, ctlOFFICER_OPSITION_NAME.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_REQUEST_OFFICER_TEL", System.Data.DbType.String, ctlMEETING_REQUEST_OFFICER_TEL.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("ORG", System.Data.DbType.String, ctlORG.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_ADMIN", System.Data.DbType.String, ctlMEETING_ADMIN.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_NOTE", System.Data.DbType.String, ctlMEETING_NOTE.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_SUB_SEQ", System.Data.DbType.Int32, ctlAGENDA_SUB_SEQ.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_SUB_TOPIC", System.Data.DbType.String, ctlAGENDA_SUB_TOPIC.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_SUB_DESC", System.Data.DbType.String, ctlAGENDA_SUB_DESC.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_SUB_BOARD", System.Data.DbType.String, ctlAGENDA_SUB_BOARD.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_DETAIL_ID", System.Data.DbType.String, ctlAGENDA_DETAIL_ID.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_DETAIL_SEQ", System.Data.DbType.Int32, ctlAGENDA_DETAIL_SEQ.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_DETAIL_TOPIC", System.Data.DbType.String, ctlAGENDA_DETAIL_TOPIC.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_DETAIL_DESC", System.Data.DbType.String, ctlAGENDA_DETAIL_DESC.Text);
        dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("AGENDA_DETAIL_BOARD", System.Data.DbType.String, ctlAGENDA_DETAIL_BOARD.Text);
		dsRMSM_RMM_MEETING_DetailView.UpdateParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMainMEETING_ID);
		int i = dsRMSM_RMM_MEETING_DetailView.Update();


		JS="alert('Updated');";
    }


}