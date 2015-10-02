using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class view_modalMeetingConfirm : System.Web.UI.Page
{
//    User user;
//    public string id = "";
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        user = (User)Session["user"];
//        id = Request.QueryString["id"];
//        if (!IsPostBack)
//        {
//            ViewState.Add("id", Request.QueryString["id"]);

//            SetCurrentDate();
//            PopulateDataSet();
//        }
//    }

//    private void SetCurrentDate()
//    {
//        System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("th-TH");
//        DateTime today = DateTime.Now;

//        lblDayName.Text = today.ToString("dddd");
//        lblDayNum.Text = today.ToString("dd");
//        lblMonthName.Text = today.ToString("MMMM");
//    }

//    private void PopulateDataSet()
//    {
//        mainClass cls = new mainClass();

//        string sql = string.Format(@"SELECT MEETING_TITLE, PERIOD_DATE, PERIOD_START, PERIOD_STOP, ROOM_NAME, CONFIRM_FLAG, CONFIRM_NOTE,
//                                        ISNULL(PREFIX_NAME_THA, '') + PERSONAL_FNAME_THA + ' ' + ISNULL(PERSONAL_LNAME_THA, '') FULLNAME,
//                                        DAY(PERIOD_DATE_EN) DAY, MONTH(PERIOD_DATE_EN) MONTH, YEAR(PERIOD_DATE_EN) YEAR
//                                    FROM [dbo].[getMeetingAll]() A
//	                                    LEFT JOIN TR_MEETING_PERSON ON A.MEETING_ID = TR_MEETING_PERSON.MEETING_ID AND ORG_STR_SEQ = {1}
//                                        LEFT JOIN dbo.VIEW_USER_AD ON ORG_STR_SEQ_INSTEAD = PERSONAL_ID
//                                    WHERE A.MEETING_ID = {0}", ViewState["id"].ToString(), user.PERSONAL_ID);

//        DataSet ds = cls.GetDataSet(sql, "TR_MEETING");
//        SetMain(ds);

//        ds.Dispose();
//        cls.Dispose();
//        ds = null;
//        cls = null;
//    }

//    private void SetMain(DataSet ds)
//    {
//        if (ds.Tables["TR_MEETING"].Rows.Count == 1)
//        {
//            string _name = string.Empty, _pos = string.Empty, _tel = string.Empty;

//            lblMeetingTitle.Text = ds.Tables["TR_MEETING"].Rows[0]["MEETING_TITLE"].ToString();
//            lblMeetignRoom.Text = ds.Tables["TR_MEETING"].Rows[0]["ROOM_NAME"].ToString();
//            lblMeetingTime.Text = string.Format("{0} {1}-{2}",
//                                                ds.Tables["TR_MEETING"].Rows[0]["PERIOD_DATE"].ToString(),
//                                                ds.Tables["TR_MEETING"].Rows[0]["PERIOD_START"].ToString(),
//                                                ds.Tables["TR_MEETING"].Rows[0]["PERIOD_STOP"].ToString());

//            DateTime _d = new DateTime(int.Parse(ds.Tables["TR_MEETING"].Rows[0]["YEAR"].ToString()),
//                                        int.Parse(ds.Tables["TR_MEETING"].Rows[0]["MONTH"].ToString()),
//                                        int.Parse(ds.Tables["TR_MEETING"].Rows[0]["DAY"].ToString()));

//            lblDayName.Text = _d.ToString("dddd");
//            lblDayNum.Text = _d.ToString("dd");
//            lblMonthName.Text = _d.ToString("MMMM");
                        
//            if (ds.Tables["TR_MEETING"].Rows[0]["CONFIRM_FLAG"].ToString() == "Y")
//            {
//                //optionsRadios1.Checked = true;
//            }
//            else if (ds.Tables["TR_MEETING"].Rows[0]["CONFIRM_FLAG"].ToString() == "N")
//            {
//                txtReject.Value = ds.Tables["TR_MEETING"].Rows[0]["CONFIRM_NOTE"].ToString();
//                //optionsRadios2.Checked = true;
//            }
//            else if (ds.Tables["TR_MEETING"].Rows[0]["CONFIRM_FLAG"].ToString() == "I")
//            {
//                txtInstead.Value = ds.Tables["TR_MEETING"].Rows[0]["FULLNAME"].ToString();
//                //optionsRadios3.Checked = true;
//            }
//        }
//    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
//        mainClass cls = new mainClass();
//        string sql = string.Empty;

//        if (optionsRadios1.Checked)
//        {
//            sql = string.Format(@"UPDATE TR_MEETING_PERSON 
//                                SET CONFIRM_FLAG = 'Y', CONFIRM_NOTE = '' 
//                                WHERE MEETING_ID = {0} AND ORG_STR_SEQ = {1}",
//                                ViewState["id"].ToString(), user.PERSONAL_ID);
//        }
//        else if (optionsRadios2.Checked)
//        {
//            sql = string.Format(@"UPDATE TR_MEETING_PERSON 
//                                SET CONFIRM_FLAG = 'N', CONFIRM_NOTE = '{2}' 
//                                WHERE MEETING_ID = {0} AND ORG_STR_SEQ = {1}",
//                                ViewState["id"].ToString(), user.PERSONAL_ID, txtReject.Value);
//        }
//        else if (optionsRadios3.Checked)
//        {
//            sql = string.Format(@"UPDATE TR_MEETING_PERSON 
//                                SET CONFIRM_FLAG = 'I', CONFIRM_NOTE = '', ORG_STR_SEQ_INSTEAD = {2} 
//                                WHERE MEETING_ID = {0} AND ORG_STR_SEQ = {1}",
//                                ViewState["id"].ToString(), user.PERSONAL_ID, txtInsteadId.Value);
//        }

//        cls.ExecNonQuery(sql);
//        CallJavaScriptFunction("parent.jQuery.fancybox.close();");
    }

//    private void CallJavaScriptFunction(string function)
//    {
//        // Define the name and type of the client scripts on the page.
//        string csname = "CallFunction";
//        Type cstype = this.GetType();

//        // Get a ClientScriptManager reference from the Page class.
//        System.Web.UI.ClientScriptManager cs = Page.ClientScript;

//        // Check to see if the startup script is already registered.
//        if (!cs.IsStartupScriptRegistered(cstype, csname))
//        {
//            string cstext = String.Format("{0}", function);
//            cs.RegisterStartupScript(cstype, csname, cstext, true);
//        }
//    }

}