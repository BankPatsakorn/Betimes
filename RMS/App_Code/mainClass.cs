using System; 
using System.Web.UI; 
using System.Web.UI.WebControls; 
using Microsoft.VisualBasic; 
using System.Configuration; 
using System.Data; 
using System.Data.OleDb;
using System.Text; 
using System.Security.Cryptography;
using System.Web;
using System.Xml;

public enum gMode
{
    INSERT = 1,
    UPDATE = 2,
    DELETE = 3,
    VIEW = 4,
    POPUP = 5,
}

public class mainClass : System.Web.UI.Page 
{
    public string gPathDoc = System.Configuration.ConfigurationManager.AppSettings["ConStr"];
    public OleDbConnection ConX = new OleDbConnection(System.Configuration.ConfigurationManager.AppSettings["ConStr"]);
    public DataSet QueryData(string pstrSql, string pTableName)
    {
        DataSet dtsTmp = new DataSet();
        OleDbDataAdapter datTmp = new OleDbDataAdapter(pstrSql, ConX);
        dtsTmp.Clear();
        dtsTmp.EnforceConstraints = false;
        datTmp.Fill(dtsTmp, pTableName);
        return dtsTmp;
    }
    public DataSet GetDataSet(string pstrSql, string pTableName)
    {
        DataSet functionReturnValue = default(DataSet);
        DataSet dtsTmp = new DataSet();
        OleDbDataAdapter datTmp = new OleDbDataAdapter(pstrSql, ConX);
        dtsTmp.Clear();
        dtsTmp.EnforceConstraints = false;
        datTmp.Fill(dtsTmp, pTableName);
        functionReturnValue = dtsTmp;
        datTmp.Dispose();
        dtsTmp.Dispose();
        return functionReturnValue;
    } 
    public DataTable GetDataTable(string sql)
    {
        string connect = System.Configuration.ConfigurationManager.AppSettings["ConStr"];
        try
        {
            OleDbConnection con = new OleDbConnection(connect);
            if (con.State == ConnectionState.Closed) con.Open();

            String cmd = sql;

            OleDbDataAdapter adapter = new OleDbDataAdapter();
            adapter.SelectCommand = new OleDbCommand(cmd, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();

            return dt;
        }
        catch (Exception ex)
        {
            DataTable dt = new DataTable();
            return dt;
        }
    }

    public DataTable GetDataTable(string pstrSql, string pTableName)
    {
        DataTable functionReturnValue = default(DataTable);
        DataTable dtTmp = new DataTable();
        OleDbDataAdapter datTmp = new OleDbDataAdapter(pstrSql, ConX);
        dtTmp.Clear();
        datTmp.Fill(dtTmp);
        dtTmp.TableName = pTableName;
        functionReturnValue = dtTmp;
        datTmp.Dispose();
        dtTmp.Dispose();
        return functionReturnValue;
    }
    public void AddTable(DataSet DS, DataTable DT)
    {
        if (DS.Tables.Contains(DT.TableName))
        {
            DS.Tables.Remove(DT.TableName);
            DS.Tables.Add(DT);
        }
        else
        {
            DS.Tables.Add(DT);
        }
    }
    public string getMasterID(string pTableName)
    {
        string functionReturnValue = null;
        if (ConX.State == ConnectionState.Closed)
        {
            ConX.Open();
        }
        string pStrSql = "declare @xx as int,@cRows int " + " select @xx= ident_current('" + pTableName + "') " + " select @cRows=count(*) from " + pTableName + " " + " if @xx >1 begin select ident_current('" + pTableName + "')+1 as ID end " + " else begin if @cRows=0 begin select 1 as ID end else begin select 2 as ID end end";
        OleDbCommand Cmd = new OleDbCommand(pStrSql, ConX);
        functionReturnValue = Convert.ToString(Cmd.ExecuteScalar());
        Cmd.Dispose();
        return functionReturnValue;
    }
    public void ExecNonQuery(string pstrSql)
    {
        if (ConX.State == ConnectionState.Closed)
        {
            ConX.Open();
        }
        OleDbCommand Cmd = new OleDbCommand(pstrSql, ConX);
        Cmd.ExecuteNonQuery();
        Cmd.Dispose();
    }
    public void Initial_RowParentX(DataTable pdttMain)
    {
        DataRow dtrTemp = pdttMain.NewRow();
        pdttMain.Rows.Add(dtrTemp);
    }
    public void Save(DataTable DT, string BaseTableName)
    {
        OleDbDataAdapter DA = default(OleDbDataAdapter);
        OleDbCommandBuilder CB = default(OleDbCommandBuilder);
        string Sql = null;
        Sql = "select * from " + BaseTableName + " where 1=2";
        DA = new OleDbDataAdapter(Sql, ConX);
        CB = new OleDbCommandBuilder(DA);
        DA.Update(DT);
        CB.Dispose();
        DA.Dispose();
    } 
    public void SaveX(DataTable DT, string BaseTableName)
    {
        OleDbDataAdapter DA = default(OleDbDataAdapter);
        OleDbCommandBuilder CB = default(OleDbCommandBuilder);
        string Sql = null;
        Sql = "select * from " + BaseTableName + " where 1=2";
        DA = new OleDbDataAdapter(Sql, ConX);
        CB = new OleDbCommandBuilder(DA);
        DA.Update(DT);
        CB.Dispose();
        DA.Dispose();
    }
    public string getMasterIDX(string pTableName)
    {
        if (ConX.State == ConnectionState.Closed)
        {
            ConX.Open();
        }
        string pStrSql = "declare @xx as int,@cRows int " + " select @xx= ident_current('" + pTableName + "') " + " select @cRows=count(*) from " + pTableName + " " + " if @xx >1 begin select ident_current('" + pTableName + "')+1 as ID end " + " else begin if @cRows=0 begin select 1 as ID end else begin select 2 as ID end end";
        OleDbCommand Cmd = new OleDbCommand(pStrSql, ConX);
        return Convert.ToString(Cmd.ExecuteScalar());
    }

    public string date2ScreenO(System.DateTime pstrDate)
    {
        string strDay = (pstrDate.Day) < 10 ? "0" + (pstrDate.Day).ToString() : (pstrDate.Day).ToString();
        string strMonth = (pstrDate.Month) < 10 ? "0" + (pstrDate.Month).ToString() : (pstrDate.Month).ToString();
        string strYear = (pstrDate.Year + 543).ToString();
        return strDay + "-" + strMonth + "-" + strYear;
    }//end 
    public string date2Screen(System.DateTime pstrDate)
    {
        string strDay = (pstrDate.Day) < 10 ? "0" + (pstrDate.Day).ToString() : (pstrDate.Day).ToString();
        string strMonth = (pstrDate.Month) < 10 ? "0" + (pstrDate.Month).ToString() : (pstrDate.Month).ToString();
        string strYear = (pstrDate.Year + 543).ToString();
        return strDay + "-" + MThaiS(strMonth) + "-" + strYear;
    }//end

    public string MThaiS(string MCode) {
        string strRe="";
        switch (MCode) {
            case "01": strRe = "ม.ค."; break;
	        case "02": strRe = "ก.พ."; break;
	        case "03": strRe = "มี.ค."; break;
	        case "04": strRe = "เม.ย."; break;
	        case "05": strRe = "พ.ค."; break;
	        case "06": strRe = "มิ.ย."; break;
	        case "07": strRe = "ก.ค."; break;
	        case "08": strRe = "ส.ค."; break;
	        case "09": strRe = "ก.ย."; break;
	        case "10": strRe = "ต.ค."; break;
	        case "11": strRe = "พ.ย."; break;
	        case "12": strRe = "ธ.ค."; break;        
        }//end switch
        return strRe;
    }//end

    public string SThaiM(string MName)
    {
        string strRe = "";
        switch (MName)
        {
            case "ม.ค.": strRe = "01"; break;
            case "ก.พ.": strRe = "02"; break;
            case "มี.ค.": strRe = "03"; break;
            case "เม.ย.": strRe = "04"; break;
            case "พ.ค.": strRe = "05"; break;
            case "มิ.ย.": strRe = "06"; break;
            case "ก.ค.": strRe = "07"; break;
            case "ส.ค.": strRe = "08"; break;
            case "ก.ย.": strRe = "09"; break;
            case "ต.ค.": strRe = "10"; break;
            case "พ.ย.": strRe = "11"; break;
            case "ธ.ค.": strRe = "12"; break;
        }//end switch
        return strRe;
    }//end

    public string date2DBO(string pstrDate)
    {
        if (!string.IsNullOrEmpty(pstrDate))
        {
            string[] arrDate = pstrDate.Split('-');
            return Convert.ToInt32(arrDate[2]) + "-" + arrDate[1] + "-" + arrDate[0];
        }else{
            return "";
        }
    }//end

    public string date2DB(string pstrDate)
    {
        if (!string.IsNullOrEmpty(pstrDate))
        {
            string[] arrDate = pstrDate.Split('-');
            return Convert.ToInt32(arrDate[2]) + "-" + SThaiM(arrDate[1]) + "-" + arrDate[0];
        }
        else
        {
            return "";
        }
    }//end

    public string ExecuteSql(string pStrSql)
    {
        if (ConX.State == ConnectionState.Closed)
        {
            ConX.Open();
        }
        OleDbCommand Cmd = new OleDbCommand(pStrSql, ConX);
        return Convert.ToString(Cmd.ExecuteScalar());
    }

    public DataSet AjxgetDMember(int pType, string pCondi)
    {
        OleDbCommand cmdTmp = new OleDbCommand("getDMember", ConX);
        cmdTmp.CommandType = CommandType.StoredProcedure;
        cmdTmp.Parameters.Add("@pType", OleDbType.Integer);
        cmdTmp.Parameters["@pType"].Value = pType;
        cmdTmp.Parameters.Add("@pCondi", OleDbType.VarChar, 50);
        cmdTmp.Parameters["@pCondi"].Value = pCondi;
        DataSet dtsTmp = new DataSet();
        OleDbDataAdapter datTmp = new OleDbDataAdapter(cmdTmp);
        datTmp.Fill(dtsTmp, "getDMember");
        return dtsTmp;
    }//end
    public void CreateMessageAlertAndRedirect(System.Web.UI.Page paspxPage, string pstrMessage, string pLocation)
    {
        string strScript = "<script language=JavaScript>alert('" + pstrMessage + "');location='" + pLocation + "'; </script>";
        if (!paspxPage.IsStartupScriptRegistered("AlertMessage"))
        {
            paspxPage.RegisterStartupScript("AlertMessage", strScript);
        }
    }
   
    public void CreateMessageAlertAndClose(System.Web.UI.Page paspxPage, string pstrMessage)
    {
        string strScript = "<script language=JavaScript>alert('" + pstrMessage + "');windows.close();</script>";
        if (!paspxPage.IsStartupScriptRegistered("AlertMessage"))
        {
            paspxPage.RegisterStartupScript("AlertMessage", strScript);
        }
    }
    public void CreateMessageAlert(System.Web.UI.Page paspxPage, string pstrMessage)
    {
        string strScript = "<script language=JavaScript>alert('" + pstrMessage + "');</script>";
        if (!paspxPage.IsStartupScriptRegistered("AlertMessage"))
        {
            paspxPage.RegisterStartupScript("AlertMessage", strScript);
        }
    } 
    public void LookUpSTV(System.Web.UI.HtmlControls.HtmlSelect pDropDownList, string pType,string pDefault,string pWhere,string BookTypecode)
    {
	    string strSql = null;
	    string strdValue = null;
	    string strdText = null;
	    string strdDefault = null;
	    strSql = "";
	    strdValue = "";
	    strdText = "";
	    strdDefault = "";
	    switch (pType) {
		    case "1"://ประเทศ
                strSql = " select BKLISTTYPE,BKLISTNAME from SRBT_BOOKLISTTYPE where RS_FLAG='S' and BKLISTTYPE IN ('" + BookTypecode + "') order by BKLISTTYPE ";
                strdValue = "BKLISTTYPE";
                strdText = "BKLISTNAME";
                strdDefault = pDefault;
			    break;
            case "2"://จังหวัด
                strSql = " select PROVINCE_ID,PROVINCE_NAME from MT_PROVINCE where IS_DEL is null and IS_ACTIVE='Y' order by PROVINCE_NAME ";
                strdValue = "PROVINCE_ID";
                strdText = "PROVINCE_NAME";
                strdDefault = pDefault;
                break;
            case "3"://ประเภทรางวัล
                strSql = " select AWARDTYPE_ID,AWARDTYPE_DESC from MT_AWARD_TYPE where IS_DEL is null and IS_ACTIVE='Y' order by AWARDTYPE_ID ";
                strdValue = "AWARDTYPE_ID";
                strdText = "AWARDTYPE_DESC";
                strdDefault = pDefault;
                break;
            case "4"://พระนาม พระบรมวงศานุวงศ์
                strSql = " select ROYALFAMILY_ID,ROYALFAMILY_CODE+' '+ROYALFAMILY_NAME as ROYALFAMILY_NAME from MT_ROYAL_FAMILY where IS_DEL is null and IS_ACTIVE='Y' order by  ROYALFAMILY_CODE ";
                strdValue = "ROYALFAMILY_ID";
                strdText = "ROYALFAMILY_NAME";
                strdDefault = pDefault;
                break;
            case "5"://ประเภทข้อความ
                strSql = " select DOCTYPE_ID,DOCTYPE_DESC from MT_DOCUMENT_TYPE where IS_DEL is null and IS_ACTIVE='Y' order by DOCTYPE_ID  ";
                strdValue = "DOCTYPE_ID";
                strdText = "DOCTYPE_DESC";
                strdDefault = pDefault;
                break;
            case "6"://โอกาส
                strSql = " select OCCASION_ID,OCCASION_DESC from MT_OCCASION where  IS_DEL is null and IS_ACTIVE='Y' "+ pWhere +" order by OCCASION_ID ";
                strdValue = "OCCASION_ID";
                strdText = "OCCASION_DESC";
                strdDefault = pDefault;
                break;
            case "7"://ที่มาของต้นเรื่อง
                strSql = " select SOURCE_ID,SOURCE_DESC from MT_SOURCE where  IS_DEL is null and IS_ACTIVE='Y' order by SOURCE_ID ";
                strdValue = "SOURCE_ID";
                strdText = "SOURCE_DESC";
                strdDefault = pDefault;
                break;
            case "8":// พระนาม Visitor
                strSql = " select VISITOR_ID,VISITOR_NAME_TH from MT_VISITOR where IS_DEL is null and IS_ACTIVE='Y' order by VISITOR_NAME_TH ";
                strdValue = "VISITOR_ID";
                strdText = "VISITOR_NAME_TH";
                strdDefault = pDefault;
                break;
            case "9":// ตำแหน่ง
                strSql = " select POSITION_ID,POSITION_DESC from MT_POSITION where IS_DEL is null and IS_ACTIVE='Y' order by POSITION_DESC ";
                strdValue = "POSITION_ID";
                strdText = "POSITION_DESC";
                strdDefault = pDefault;
                break;
            case "10"://ประเทศ ภาษาอังกฤษ
                strSql = " select COUNTRY_ID,COUNTRY_NAME_EN from MT_COUNTRY where IS_DEL is null and IS_ACTIVE='Y' order by COUNTRY_NAME_EN ";
                strdValue = "COUNTRY_ID";
                strdText = "COUNTRY_NAME_EN";
                strdDefault = pDefault;
                break;
	    }
	    OleDbDataAdapter ddtTemp = default(OleDbDataAdapter);
	    DataSet dstTemp = new DataSet();
	    pDropDownList.Items.Clear();
	    pDropDownList.DataValueField = strdValue;
	    pDropDownList.DataTextField = strdText;
	    ddtTemp = new OleDbDataAdapter(strSql, ConX);
	    ddtTemp.Fill(dstTemp, "TmpSTV");
	    if (dstTemp.Tables[0].Rows.Count > 0) {
		    pDropDownList.DataSource = dstTemp.Tables[0];
		    pDropDownList.DataBind();
	    }//end if
	    pDropDownList.Items.Insert(0, strdDefault);
    }//end if

    public string ExecuteSqlStr(string pStrSql)
    {
        string connect = System.Configuration.ConfigurationManager.AppSettings["ConStr"];
        OleDbConnection Con = new OleDbConnection(connect);
        if (Con.State == ConnectionState.Closed) Con.Open();
        string ReturnValue;
        if (Con.State == ConnectionState.Closed)
        {
            Con.Open();
        }
        OleDbCommand Cmd = new OleDbCommand(pStrSql, Con);
        ReturnValue = Convert.ToString(Cmd.ExecuteScalar());
        Cmd.Dispose();
        if (ReturnValue == null)
        {
            ReturnValue = "";
        }
        Con.Close();
        Con.Dispose();
        return ReturnValue;
    }

    public void CreateTopAndLastPage(System.Web.UI.Page paspxPage, string StrId)
    {
        string strScript = "<script language=JavaScript>window.location = '#" + StrId + "';</script>";
        if (!paspxPage.IsStartupScriptRegistered("AlertMessage"))
        {
            paspxPage.RegisterStartupScript("Alert" + StrId, strScript);
        }
    }

    public String GetUserPermission(String USerId, String PageID, String PerId)
    {
        DataSet dsData = new DataSet();
        String strSql = "SELECT 'Y' FROM PER_TR_GROUP_PERMISSION A INNER JOIN StateVisit_USER B ON A.GROUP_ID = B.GROUP_ID WHERE B.USER_NAME = '" + USerId + "' AND A.SCREEN_ID = " + PageID + " AND A.PERMISSION_ID = " + PerId + " AND PERMISSION_FLAG = 1";
        String RetuebVal = ExecuteSqlStr(strSql);
        return RetuebVal;
    }

    public string ReplaceTag(string Strvalue)
    {
        return Strvalue.Replace("'", "''");
    }

    public void LoadLookUpToDropDownList(DropDownList ddl, string sql, string defaultValue)
    {
        OleDbDataAdapter da = default(OleDbDataAdapter);
        DataSet ds = new DataSet();

        da = new OleDbDataAdapter(sql, ConX);
        da.Fill(ds, "Table0");

        ddl.Items.Clear();
        ddl.DataValueField = ds.Tables[0].Columns[0].ColumnName;
        ddl.DataTextField = ds.Tables[0].Columns[1].ColumnName;
        ddl.DataSource = ds.Tables[0];
        ddl.DataBind();

        ddl.Items.Insert(0, defaultValue);
        ddl.SelectedItem.Text = defaultValue;

        ds.Dispose();
        da.Dispose();
    }
    
}
