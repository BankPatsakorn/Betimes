<%@ WebHandler Language="C#" Class="dataEventAll" %>

using System;
using System.Web;

public class dataEventAll : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string user = context.Request.QueryString["pid"];
        string[] aColor = { "#0199Cb", "#ff6600", "#339933", "#FF00FF", "#AF7817" };
        string sData = "";
        System.Globalization.CultureInfo ct = new System.Globalization.CultureInfo("en-US");

        string template = @"<event id='%ID%' color='%BGCOLOR%' textColor='%COLOR%'>
		                            <start_date><![CDATA[%START%]]></start_date>
		                            <end_date><![CDATA[%END%]]></end_date>
		                            <text><![CDATA[%TEXT%]]></text>
		                            <section_id>%ROOMID%</section_id>
	                            </event>";

            string sId = "";
            string sStart = "";
            string sEnd = "";
            string sText = "";
            string sRoomId = "";
            string sBgColor = "";
            string sTextColor = "";

            string sql = string.Format(@"SELECT MEETING_ID, MEETING_TITLE, CASE WHEN ROOM_ID = 0 THEN 1 ELSE ROOM_ID END ROOM_ID, ROOM_NAME, PERIOD_DATE_EN, PERIOD_START, PERIOD_STOP FROM [dbo].[getMeetingByUser]({0})",
                user);
            System.Data.DataTable dt = (new mainClass()).GetDataTable(sql);

            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                sId = dt.Rows[i]["MEETING_ID"].ToString();
                sBgColor = aColor[(int)dt.Rows[i]["ROOM_ID"] - 1];
                sTextColor = "#FFFFFF";

                sStart = ((DateTime)(dt.Rows[i]["PERIOD_DATE_EN"])).ToString("yyyy-MM-dd HH:mm", ct);
                sEnd = ((DateTime)(dt.Rows[i]["PERIOD_DATE_EN"])).ToString("yyyy-MM-dd HH:mm", ct);

                DateTime d1 = (DateTime)(dt.Rows[i]["PERIOD_DATE_EN"]);
                DateTime d2 = (DateTime)(dt.Rows[i]["PERIOD_DATE_EN"]);
                string[] arr1 = dt.Rows[i]["PERIOD_START"].ToString().Split('.');
                string[] arr2 = dt.Rows[i]["PERIOD_STOP"].ToString().Split('.');

                if (arr1.Length == 2)
                {
                    d1 = d1.AddHours(double.Parse(arr1[0]));
                    d1 = d1.AddMinutes(double.Parse(arr1[1]));
                }

                if (arr2.Length == 2)
                {
                    d2 = d2.AddHours(double.Parse(arr2[0]));
                    d2 = d2.AddMinutes(double.Parse(arr2[1]));
                }

                sStart = d1.ToString("yyyy-MM-dd HH:mm", ct);
                sEnd = d2.ToString("yyyy-MM-dd HH:mm", ct);

                sText = dt.Rows[i]["MEETING_TITLE"].ToString();
                sRoomId = dt.Rows[i]["ROOM_ID"].ToString();
                sData += template.Replace("%ID%", sId).Replace("%ID%", sId).Replace("%START%", sStart).Replace("%END%", sEnd).Replace("%TEXT%", sText).Replace("%ROOMID%", sRoomId).Replace("%BGCOLOR%", sBgColor).Replace("%COLOR%", sTextColor);
            }

        context.Response.ContentType = "text/xml";
        context.Response.Write("<data>" + sData + "</data>");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}