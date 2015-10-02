using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Master_bs : System.Web.UI.MasterPage
{
    //private User user;
    public string inboxNotification, taskNotification;
    public string strDay;
    public string strDayNum;
    public string strMonth;
    public string userName;
    public string userProfilePicture;
    public string AdminDisplayStr = "";

    //List<string> permitList = new List<string>();
    //List<HtmlGenericControl> permitMenu = new List<HtmlGenericControl>();
    //Dictionary<EnumFormAllowed, string> buttonType = new Dictionary<EnumFormAllowed, string>();
    //List<EnumFormAllowed> pageAllowed = new List<EnumFormAllowed>();


    protected void Page_Init(object sender, EventArgs e)
    {
        //if (Session["user"] == null)
        //{
        //    string ReqUrl = Request.Url.AbsoluteUri;
        //    Session["request_page"] = ReqUrl;
        //    Response.Redirect("../authentication.aspx");
        //}
    }
   

    protected void Page_Load(object sender, EventArgs e)
    {
        //user = (User)Session["user"];
        //spanUsername.InnerHtml = user.PERSONAL_FNAME_THA + " " + user.PERSONAL_LNAME_THA;
        //userName = user.USER_NAME;

       
        //if (string.IsNullOrEmpty(user.PROFILE_PICTURE))
        //{
        //    userProfilePicture = "../images/theme/user.png";
        //}
        //else
        //{
        //    userProfilePicture = "../upload/user_profiles/" + user.PROFILE_PICTURE;
        //}

        //GetInboxNotification();
        //GetTaskNotification();

        //SetCurrentDate();
        ////SetMenu();


        ////set permisson
        //InitMenuList();
        //InitPermissionList();
        //InitPagePermission();
        //FormPermission.SetMenuPermission(permitMenu, permitList, "bt-permission");
        //FormPermission.SetFormPagePermission(pageAllowed, buttonType, Response, Request,ContentPlaceHolder1, "notallowed.aspx");

        
    }




//    void InitPagePermission()
//    {
//        //init button type
//        buttonType.Clear();
//        buttonType.Add(EnumFormAllowed.Save, "btnSave,btnAdd"); //type, id
//        buttonType.Add(EnumFormAllowed.Delete, "btnDelete"); //type, id
//        buttonType.Add(EnumFormAllowed.Approve, "btnAppove"); //type, id
//        buttonType.Add(EnumFormAllowed.Edit, "btnEdit"); //type, id
//        buttonType.Add(EnumFormAllowed.Print, "btnPrint"); //type, id

//        //get page allow
//        //query from database this page

//        string pagename = Request.Url.AbsolutePath;
//        pageAllowed.Add(EnumFormAllowed.Save);
//        pageAllowed.Add(EnumFormAllowed.Call);
//    }

//    void InitMenuList()
//    {
//        permitMenu.Clear();
//        permitMenu.Add(menuAdmin);
//        permitMenu.Add(menuSec);
//    }

//    void InitPermissionList()
//    {
//        permitList.Clear();
//        if (user.MEETING_ADMIN=="Y") permitList.Add("ADMIN");
//        if (user.MEETING_SEC == "Y") permitList.Add("SEC");
//    }








//    private void SetCurrentDate()
//    {
//        //System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("th-TH");
//        DateTime today = DateTime.Now;

//        strDay = today.ToString("dddd");
//        strDayNum = today.ToString("dd");
//        strMonth = today.ToString("MMMM");
//    }


//    private void SetMenu()
//    {
//        string html = string.Empty;
//        menu.Visible= true;
//        html += string.Format(@"<li><a href='javascript:void(0)'><i class='glyphicon glyphicon-tasks'></i> <span class='title'> การประชุม </span><i class='icon-arrow'></i><span class='selected'></span></a>
//                    <ul class='sub-menu'>
//                        <li>
//                            <a href='../view/default.aspx'>การประชุมของท่าน</a>
//                        </li>
//                        <li>
//                            <a href='../view/confirmationList.aspx'>ยืนยันการประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/taskList.aspx'>งานที่ได้รับมอบหมาย</a>
//                        </li>
//                        <li>
//                            <a href='../view/dialogRoomSelection.aspx?id=&date={0}' target='_blank'>การประชุมวันนี้</a>
//                        </li>
//                        <li>
//                            <a href='../view/search.aspx'>ค้นหาการประชุม</a>
//                        </li>
//                    </ul>
//                </li>", (new mainClass()).ExecuteSql("SELECT GETDATE()"));
//        html += @"<li><a href='javascript:void(0)'><i class='glyphicon glyphicon-user'></i> <span class='title'> เลขาการประชุม </span><i class='icon-arrow'></i><span class='selected'></span></a>
//                    <ul class='sub-menu'>
//                        <li>
//                            <a href='../view/periodMeeting.aspx'>จองห้องประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/meetingList.aspx'>จัดการการประชุม</a>
//                        </li>
//                    </ul>
//                </li>";

//        html += @"<li><a href='javascript:void(0)'><i class='glyphicon glyphicon-file'></i> <span class='title'> รายงาน </span><i class='icon-arrow'></i><span class='selected'></span></a>
//                    <ul class='sub-menu'>
//                        <li>
//                            <a href='../view/reportMeeting.aspx'>รายงานการใช้ห้องประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/reportEquipment.aspx'>รายงานการใช้อุปกรณ์การประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/reportService.aspx'>รายงานการใช้บริการการประชุม</a>
//                        </li>
//                    </ul>
//                </li>";

//        if (user.MEETING_ADMIN == "Y")
//        {
//            html += @"<li><a href='javascript:void(0)'><i class='glyphicon glyphicon-cog'></i> <span class='title'> Admin </span><i class='icon-arrow'></i><span class='selected'></span></a>
//                    <ul class='sub-menu'>
//                        <li>
//                            <a href='../view/roomList.aspx'>จัดการห้องประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/equipmentList.aspx'>จัดการอุปกรณ์การประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/serviceList.aspx'>จัดการบริการการประชุม</a>
//                        </li>
//                        <li>
//                            <a href='../view/workGroupList.aspx'>จัดการคณะทำงาน</a>
//                        </li>
//                    </ul>
//                </li>";
//        }
//        menu.InnerHtml = html;
//    }

//    private void GetInboxNotification()
//    {
//        //string sql = string.Format("SELECT COUNT(1) FROM dbo.GetConfirmationMeetingByUser({0}) WHERE CONFIRM_FLAG IS NULL", user.PERSONAL_ID);
//        //inboxNotification = (new mainClass()).ExecuteSql(sql);

//        //if (inboxNotification == "0")
//        //{
//        //    inboxNotification = "";
//        //}

//        string sql = string.Format("SELECT * FROM dbo.GetConfirmationMeetingByUser({0}) WHERE CONFIRM_FLAG IS NULL", user.PERSONAL_ID);
//        DataSet ds = (new mainClass()).GetDataSet(sql, "TR_MEETING");

//        string html = string.Empty;

//        foreach (DataRow dr in ds.Tables["TR_MEETING"].Rows)
//        {
//            html += "<li >";
//            html += string.Format("<a class='modalMeetingConfirm' backurl='../view/confirmationList.aspx' href='../view/modalMeetingConfirm.aspx?id={0}&m=view'>", dr["MEETING_ID"].ToString());
//            html += string.Format("<span class='message'>{0}</span>", dr["MEETING_TITLE"].ToString());
//            html += string.Format("<span class='time'>{0}</span>", dr["PERIOD_DATE"].ToString());
//            html += "</a>";
//            html += "</li>";
//        }

//        if (ds.Tables["TR_MEETING"].Rows.Count > 0)
//        {
//            spanNotificationBadge.InnerHtml = ds.Tables["TR_MEETING"].Rows.Count.ToString();
//        }
        
//        spanNotification.InnerHtml = string.Format("คุณต้องยืนยันการประชุม {0} การประชุม", ds.Tables["TR_MEETING"].Rows.Count);
//        ulNotification.InnerHtml = html;
//    }

//    private void GetTaskNotification()
//    {
//        //string sql = string.Format("SELECT COUNT(1) FROM TR_TASK WHERE TASK_OWNER_ID = {0} AND TASK_STATUS <> 3", user.PERSONAL_ID);
//        //taskNotification = (new mainClass()).ExecuteSql(sql);

//        //if (taskNotification == "0")
//        //{
//        //    taskNotification = "";
//        //}

//        string sql = string.Format(@"SELECT TASK_ID, TASK_NAME, TASK_OWNER_ID, TASK_ID, TASK_STATUS_NAME, MEETING_ID
//                                    FROM TR_TASK 
//	                                    INNER JOIN MT_TASK_STATUS ON TR_TASK.TASK_STATUS = MT_TASK_STATUS.TASK_STATUS_ID
//                                    WHERE TASK_OWNER_ID = {0} AND TASK_STATUS <> 3", user.PERSONAL_ID);
//        DataSet ds = (new mainClass()).GetDataSet(sql, "TR_TASK");

//        string html = string.Empty;

//        foreach (DataRow dr in ds.Tables["TR_TASK"].Rows)
//        {
//            html += "<li>";
//            html += string.Format("<a href='../view/taskDetail.aspx?id={0}&taskId={1}&m=view&pm=view' style='padding-left: 4px !important;'>", dr["MEETING_ID"].ToString(), dr["TASK_ID"].ToString());
//            html += string.Format("<span class='desc' style='opacity: 1; text-decoration: none;'>{0}</span>", dr["TASK_NAME"].ToString());
//            html += string.Format("<span class='label label-default' style='opacity: 1;'>{0}</span>", dr["TASK_STATUS_NAME"].ToString());
//            html += "</a>";
//            html += "</li>";
//        }

//        if (ds.Tables["TR_TASK"].Rows.Count > 0)
//        {
//            spanTaskBadge.InnerHtml = ds.Tables["TR_TASK"].Rows.Count.ToString();
//        }
        
//        spanTask.InnerHtml = string.Format("คุณมีงานคงค้าง {0} งาน", ds.Tables["TR_TASK"].Rows.Count);
//        ulTask.InnerHtml = html;
//    }

}
