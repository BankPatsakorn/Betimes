using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class view_confirmationList : System.Web.UI.Page
{
//   // private User user;

//    protected void Page_Load(object sender, EventArgs e)
//    {
//        //user = (User)Session["user"];

//        if (!IsPostBack)
//        {
//            InitialParameter();
//            PopulateDataSet();
//        }
//    }

//    private void InitialParameter()
//    {

//    }

//    private void PopulateDataSet()
//    {
//        mainClass cls = new mainClass();

//        string sql = string.Format(@"SELECT MEETING_ID, MEETING_TITLE, PERIOD_DATE, ROOM_NAME, PERIOD_START, PERIOD_STOP, MEETING_PERSON_ID, CONFIRM_FLAG, CONFIRM_FLAG_NAME
//                                    FROM dbo.GetConfirmationMeetingByUser({0})
//                                    ORDER BY CONVERT(DATETIME, PERIOD_DATE_EN) DESC", user.PERSONAL_ID);
//        DataSet ds = cls.GetDataSet(sql, "TR_MEETING");
//        SetTable(ds);

//        cls.Dispose();
//        ds.Dispose();
//        cls = null;
//        ds = null;
//    }

//    private void SetTable(DataSet ds)
//    {
//        string html = "<table id='tableMeeting' class='meeting-list-table'>";

//        foreach (DataRow dr in ds.Tables["TR_MEETING"].Rows)
//        {
//            html += "<tr>";
//            html += string.Format("<td style='width: 20%;'>{0}</td>", dr["PERIOD_DATE"].ToString());
//            html += string.Format("<td style='width: 60%;'><a href='#' style='text-decoration: none;' onclick='CallFancyBox({1});'>{0}</a></td>", dr["MEETING_TITLE"].ToString(), dr["MEETING_ID"].ToString());

//            if (dr["CONFIRM_FLAG"].ToString() == "Y")
//            {
//                html += string.Format("<td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox({1});'><span class='label label-success'>{0}</span></a></td>", dr["CONFIRM_FLAG_NAME"].ToString(), dr["MEETING_ID"].ToString());
//            }
//            else if (dr["CONFIRM_FLAG"].ToString() == "N")
//            {
//                html += string.Format("<td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox({1});'><span class='label label-danger'>{0}</span></a></td>", dr["CONFIRM_FLAG_NAME"].ToString(), dr["MEETING_ID"].ToString());
//            }
//            else if (dr["CONFIRM_FLAG"].ToString() == "I")
//            {
//                html += string.Format("<td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox({1});'><span class='label label-warning'>{0}</span></a></td>", dr["CONFIRM_FLAG_NAME"].ToString(), dr["MEETING_ID"].ToString());
//            }
//            else
//            {
//                html += string.Format("<td rowspan='2' class='border-bottom-td' style='width: 20%;'><a href='javascript:;' onclick='CallFancyBox({1});'><span class='label label-default'>{0}</span></a></td>", dr["CONFIRM_FLAG_NAME"].ToString(), dr["MEETING_ID"].ToString());
//            }

//            html += "</tr>";

//            html += "<tr valign='top'>";
//            html += string.Format("<td>{0} - {1}</td>", dr["PERIOD_START"].ToString(), dr["PERIOD_STOP"].ToString());

//            if (dr["ROOM_NAME"].ToString() != "")
//            {
//                html += string.Format("<td>ณ {0}</td>", dr["ROOM_NAME"].ToString());
//            }
//            else
//            {
//                html += "<td>-</td>";
//            }

//            html += "</tr>";
//        }

//        html += "</table>";

//        divTableMeeting.InnerHtml = html;
//    }

}