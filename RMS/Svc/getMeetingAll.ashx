<%@ WebHandler Language="C#" Class="getMeetingAll" %>

using System;
using System.Web;
using System.Data;

public class getMeetingAll : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string sql = string.Format(@"SELECT MEETING_ID,ROOM_ID, MEETING_TITLE, PERIOD_DATE, ROOM_NAME, PERIOD_START, PERIOD_STOP, USER_CREATE
                                    FROM dbo.getMeetingAll() 
                                    WHERE 1 = 1 ");

        if (!string.IsNullOrEmpty(context.Request.QueryString["roomId"]))
        {
            sql += " AND ROOM_ID = " + context.Request.QueryString["roomId"];
        }

        if (!string.IsNullOrEmpty(context.Request.QueryString["date"]))
        {
            sql += string.Format(" AND PERIOD_DATE_EN = '{0}'", context.Request.QueryString["date"]);
        }

        sql += " ORDER BY CONVERT(DATETIME, PERIOD_DATE_EN) DESC, PERIOD_START, PERIOD_STOP ";

        DataSet ds = (new mainClass()).GetDataSet(sql, "TR_MEETING");
        string html = SetTable(ds);
        
        context.Response.ContentType = "text/plain";
        context.Response.Write(html);
    }

    private string SetTable(DataSet ds)
    {
        string html = "<table id='tableMeeting' class='meeting-list-table'>";
        html += "<thead></thead>";
        html += "<tbody>";
        foreach (DataRow dr in ds.Tables["TR_MEETING"].Rows)
        {
            html += "<tr>";
            html += string.Format("<td style='width: 20%;'>{0}</td>", dr["PERIOD_DATE"].ToString());
            html += string.Format("<td><a href='viewMeeting.aspx?id={0}' style='text-decoration: none;'>{1}</a></td>", dr["MEETING_ID"].ToString(), dr["MEETING_TITLE"].ToString());
            html += string.Format("<td rowspan='2' class='border-bottom-td' style='padding-right: 10px;'><a href='periodMeeting.aspx?id={0}&m=view'><img src='../Images/icons/zoom16.png' alt='detail' title='รายละเอียด' /></a></td>", dr["MEETING_ID"].ToString());
            html += "</tr>";
            html += "<tr valign='top'>";
            html += string.Format("<td>{0} - {1}</td>", dr["PERIOD_START"].ToString(), dr["PERIOD_STOP"].ToString());

            if (dr["ROOM_NAME"].ToString() != "")
            {
                html += string.Format("<td><span class='room_icon room{1}' >{0}</span></td>", dr["ROOM_NAME"].ToString(), dr["ROOM_ID"].ToString());
            }
            else
            {
                html += "<td>-</td>";
            }

            html += "</tr>";
        }

        if (ds.Tables["TR_MEETING"].Rows.Count == 0)
        {
            html += "<tr><td colspan='3' style='color: #808080; text-align: center; height: 100px;'>ไม่มีรายการ</td></tr>";
        }
        
        html += "</tbody>";
        html += "</table>";
        html += "<div id='divTablePage'></div>";

        return html;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}