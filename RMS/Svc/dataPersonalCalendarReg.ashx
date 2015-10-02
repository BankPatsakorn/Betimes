<%@ WebHandler Language="C#" Class="dataPersonalCalendarReg" %>

using System;
using System.Web;

public class dataPersonalCalendarReg : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string id = context.Request.QueryString["id"];
        string color = "";
        string[] aColor = { "#0199Cb"};
        string[] ids = { "" };
        string sData = "";
        System.Globalization.CultureInfo ct = new System.Globalization.CultureInfo("en-US");

        string template = @"<event id='%ID%' color='%BGCOLOR%' textColor='%COLOR%'>
		                        <start_date><![CDATA[%START%]]></start_date>
		                        <end_date><![CDATA[%END%]]></end_date>
		                        <text><![CDATA[%TEXT% [%FULLNAME%]]]></text>
		                        <section_id>%PERSONALID%</section_id>
	                        </event>";

        if (id.IndexOf("-") >= 0)
        {
            color = id.Substring(id.IndexOf("-") + 1);
            id = id.Substring(0, id.IndexOf("-"));
            aColor = color.Split(',');
            ids = id.Split(',');
        }

        string sId = "";
        string sStart = "";
        string sEnd = "";
        string sText = "";
        string sPersonalId = "";
        string sBgColor = "";
        string sTextColor = "";
        string sql = string.Empty;

        if (!string.IsNullOrEmpty(id))
        {
            sql = string.Format(@"SELECT ROW_NUMBER() OVER(ORDER BY PERIOD_DATE_EN, PERIOD_START, PERIOD_STOP) SEQ, *
                                FROM 
                                (
                                    SELECT M.MEETING_ID*-1 as ID, VUA.PERSONAL_ID, ISNULL(PREFIX_NAME_THA, '') + PERSONAL_FNAME_THA + ' ' + ISNULL(PERSONAL_LNAME_THA, '') FULLNAME, 
	                                --CASE 
			                        --WHEN TMP.CONFIRM_FLAG IS NULL THEN '**' + MEETING_TITLE
			                        --WHEN TMP.CONFIRM_FLAG = 'Y' THEN 'Y: ' + MEETING_TITLE
			                        --WHEN TMP.CONFIRM_FLAG = 'N' THEN 'N: '  + MEETING_TITLE
			                        --WHEN TMP.CONFIRM_FLAG = 'I' THEN 'O: '  + MEETING_TITLE
		                            --END  as 'TITLE', 
                                    --MEETING_TITLE  as 'TITLE', 
                                    'ไม่ว่าง' as 'TITLE', 
                                    CASE 
			                        WHEN TMP.CONFIRM_FLAG IS NULL THEN 'ยังไม่ยืนยันการเข้าประชุม'
			                        WHEN TMP.CONFIRM_FLAG = 'Y' THEN 'ยืนยันเข้าประชุม'
			                        WHEN TMP.CONFIRM_FLAG = 'N' THEN 'ไม่เข้าประชุม' 
			                        WHEN TMP.CONFIRM_FLAG = 'I' THEN 'มอบหมายผู้แทน' 
		                            END  as 'STATUS', 
                                    PERIOD_DATE_EN, PERIOD_START, PERIOD_STOP, 
                                    CASE 
			                        WHEN TMP.CONFIRM_FLAG IS NULL THEN 1
			                        WHEN TMP.CONFIRM_FLAG = 'Y' THEN 2
			                        WHEN TMP.CONFIRM_FLAG = 'N' THEN 3
			                        WHEN TMP.CONFIRM_FLAG = 'I' THEN 4
		                            END as [TYPE]
                                    FROM TR_MEETING_PERSON TMP
	                                    INNER JOIN [dbo].[VIEW_USER_AD] VUA ON TMP.ORG_STR_SEQ = PERSONAL_ID
	                                    INNER JOIN [dbo].[getMeetingAll]() M ON TMP.MEETING_ID = M.MEETING_ID
                                    WHERE TMP.DEL_FLAG = 'N' AND PERSONAL_ID in ('{0}')
                                    UNION
                                    SELECT PERSONAL_CALENDAR_ID as ID, TPC.PERSONAL_ID, ISNULL(PREFIX_NAME_THA, '') + PERSONAL_FNAME_THA + ' ' + ISNULL(PERSONAL_LNAME_THA, '') FULLNAME, 
	                                    --[DESCRIPTION], 
'ไม่ว่าง' as 'TITLE',
'ส่วนตัว'  as 'STATUS',
	                                    CONVERT(date, [START_DATE]),
	                                    CONVERT(decimal(4, 2), REPLACE(CONVERT(varchar(5), [START_DATE], 114), ':', '.')), 
	                                    CONVERT(decimal(4, 2), REPLACE(CONVERT(varchar(5), [END_DATE], 114), ':', '.')), 0
                                    FROM TR_PERSONAL_CALENDAR TPC
	                                    INNER JOIN [dbo].[VIEW_USER_AD] VUA ON TPC.PERSONAL_ID = VUA.PERSONAL_ID
                                    WHERE TPC.PERSONAL_ID in ('{0}')
                                ) AS R1
                                ORDER BY PERIOD_DATE_EN, PERIOD_START, PERIOD_STOP", id.Replace(",","','"));

            System.Data.DataTable dt = (new mainClass()).GetDataTable(sql);

            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                sId = dt.Rows[i]["ID"].ToString();
                sBgColor = "#"+getColor(ids,aColor, dt.Rows[i]["PERSONAL_ID"].ToString());
                //if (dt.Rows[i]["TYPE"].ToString() == "1")
                //{
                //    sBgColor = aColor[0];
                //}
                //else
                //{
                //    sBgColor = aColor[1];
                //}
                
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

                sText = dt.Rows[i]["TITLE"].ToString();
                var sStatus = dt.Rows[i]["STATUS"].ToString();
                var sfullname = dt.Rows[i]["FULLNAME"].ToString();
                sPersonalId = dt.Rows[i]["PERSONAL_ID"].ToString();
                sData += template.Replace("%ID%", sId).Replace("%FULLNAME%", sfullname).Replace("%STATUS%", sStatus).Replace("%START%", sStart).Replace("%END%", sEnd).Replace("%TEXT%", sText).Replace("%PERSONALID%", sPersonalId).Replace("%BGCOLOR%", sBgColor).Replace("%COLOR%", sTextColor);
            }
        }

        context.Response.ContentType = "text/xml";
        context.Response.Write("<data>" + sData + "</data>");
    }

    string getColor(string[] ids, string[] colors, string id)
    {
        for (int i = 0; i < ids.Length; ++i)
        {
            if (ids[i] == id) return colors[i];
        }
        return "FFFFFF";
    }
 
    public bool IsReusable 
    {
        get {
            return false;
        }
    }

}