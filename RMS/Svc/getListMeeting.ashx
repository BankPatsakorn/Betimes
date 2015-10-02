<%@ WebHandler Language="C#" Class="getListMeeting" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;
public class getListMeeting : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int intPageNow = 1;
        string strDate = context.Request.Form["pDate"];
        string strType = context.Request.Form["pType"];
        string strRoom = context.Request.Form["pRoom"];
        string strORG_STR_SEQ = context.Request.Form["pUid"];
        string strPER_OTH_SEQ = context.Request.Form["pOthId"];
        string strUSER_TYPE = context.Request.Form["pUType"];
        string sPage = context.Request.Form["page"];
        string strFunction = "";
        mainClass cls = new mainClass();
        if (sPage != null && sPage != "")
        {
            intPageNow = int.Parse(sPage);
        }
        else
        {
            intPageNow = 1;
        }
        
        string html = string.Empty;
        string str = "";
        html = @"<table width=""100%"" class=""string_normal"" border=""0"" cellspacing=""0"" cellpadding=""2"">
                    <tr>
                        <td width=""2%""></td>
                        <td width=""23%""></td>
                        <td width=""75%""></td>
                    </tr>";
        switch (strType) {
            case "D" : // วัน
                strFunction = "getListMeeting";
                if (strDate != null && strDate != "")
                {
                    str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')
                    where period_date = '" + strDate + @"' 
                    AND MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')
                    where period_date = '" + strDate + @"'                     
                    order by PERIOD_DATE desc)
                    order by PERIOD_DATE desc";
                }
                else {
                    str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"') 
                    where MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')  order by PERIOD_DATE desc)                    
                    order by PERIOD_DATE desc";
                }
                break;
            case "R": // ห้อง
                strFunction = "getPageListMeetingByRoom";
                if (strRoom != null)
                {
                    str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')
                    where ROOM_ID = '" + strRoom + @"'
                    AND MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')
                    where ROOM_ID = '" + strRoom + @"'
                    order by PERIOD_DATE desc)                                         
                    order by PERIOD_DATE desc";
                }
                else
                {
                    str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"') 
                    WHERE MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')   order by PERIOD_DATE desc)
                    order by PERIOD_DATE desc";
                }
                break;
            case "M": // เดือน
                strFunction = "getListMeetingMonth";
                if (strDate != null && strDate != "")
                {
                    str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')
                    where SUBSTRING(convert(varchar(10),PERIOD_DATE,105),4,10) = SUBSTRING(convert(varchar(10),convert(datetime, '" + strDate + @"'), 105), 4, 10) AND
                     MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"') 
                    where SUBSTRING(convert(varchar(10),PERIOD_DATE,105),4,10) = SUBSTRING(convert(varchar(10),convert(datetime, '" + strDate + @"'), 105), 4, 10) 
                    order by PERIOD_DATE desc)
                    order by PERIOD_DATE desc";
                }
                else
                {
                    str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"')
                    where MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(" + strORG_STR_SEQ + @"," + strPER_OTH_SEQ + @",'" + strUSER_TYPE + @"') order by PERIOD_DATE desc)
                    order by PERIOD_DATE desc";
                }
                break;
            default: // null
                strFunction = "getListMeetingMonth";
                str = @"select distinct top 20 0 MEETING_PERSON_ID,MEETING_ID,ROOM_ID,PERIOD_DATE_TH,PERIOD_START,PERIOD_STOP,
                    MEETING_TITLE,MEETING_NAME,ROOM_NAME,PERIOD_DATE,case when isnull(USER_BOOK,'') = '' then '' else ' ทำการจองโดย ' +  USER_BOOK end USER_BOOK,ORG_NAME_BOOK 
                    from dbo.getListMeetingByORG_STR_SEQ(0,0,'I') 
                    where MEETING_PERSON_ID not in
                    (SELECT top (20*" + (intPageNow - 1).ToString() + @")
                    MEETING_PERSON_ID                   
                    from dbo.getListMeetingByORG_STR_SEQ(0,0,'I')  order by PERIOD_DATE desc)
                    order by PERIOD_DATE desc";
                break;                 
        }
        
        
        DataTable dt = cls.GetDataTable(str);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i % 2 == 0)
            {
                html = html + @"
                        <tr class='tx-meetroom-date'>
                                <td><img id=""Img3"" src=""../Images/icon/view.png"" onclick=""CallPopup(" + dt.Rows[i]["MEETING_ID"].ToString() + @")"" style=""cursor: pointer;""/></td>
                                <td valign=""top"" align=""left"" >"
                                             + dt.Rows[i]["PERIOD_DATE_TH"].ToString() + @"
                                </td>
                                <td valign=""top"" align=""left"" rowspan=""2"">" + dt.Rows[i]["MEETING_TITLE"].ToString() + "  (" + dt.Rows[i]["ROOM_NAME"].ToString() + ") " + dt.Rows[i]["USER_BOOK"].ToString() + " " + dt.Rows[i]["ORG_NAME_BOOK"].ToString() + @"</td>
                        <tr class='tx-meetroom-date'>
                                <td></td>
                                <td valign=""top"" align=""left"" >" + dt.Rows[i]["PERIOD_START"].ToString() + "-" + dt.Rows[i]["PERIOD_STOP"].ToString() + " น. " + @"</td>
                                </td>
                        </tr>";
            }
            else
            {
                html = html + @"
                        <tr class='tx-meetroom-content'>
                                <td><img id=""Img3"" src=""../Images/icon/view.png"" onclick=""CallPopup(" + dt.Rows[i]["MEETING_ID"].ToString() + @")"" style=""cursor: pointer;""/></td>
                                <td valign=""top"" align=""left"">"
                                             + dt.Rows[i]["PERIOD_DATE_TH"].ToString() + @"
                                </td>
                                <td valign=""top"" align=""left"" rowspan=""2"">" + dt.Rows[i]["MEETING_TITLE"].ToString() + "  (" + dt.Rows[i]["ROOM_NAME"].ToString() + ") " + dt.Rows[i]["USER_BOOK"].ToString() + " " + dt.Rows[i]["ORG_NAME_BOOK"].ToString() + @"</td>
                        <tr class='tx-meetroom-content'>
                                <td></td>
                                <td valign=""top"" align=""left"">" + dt.Rows[i]["PERIOD_START"].ToString() + "-" + dt.Rows[i]["PERIOD_STOP"].ToString() + " น. " + @"</td>
                                </td>
                        </tr>";
            }
////            html = html + @"<tr style=""height:1px"">
////                            <td></td>
////                            <td colspan=""4"" align=""left"">
////                            ---------------------------------------------------------------------------------------------
////                            </td>
////                        </tr>";
        }
        html = html + "</table>";// dt.Rows.Count == 0 ? "<p>No Data</p>" : html;
        if (dt.Rows.Count != 0)
        {
            //html = html + cls.SetPage(dt.Rows.Count, intPageNow, strFunction);
        }
        context.Response.Write(html);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}