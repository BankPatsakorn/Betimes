<%@ WebHandler Language="C#" Class="getRoomPeriod" %>

using System;
using System.Web;

public class getRoomPeriod : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        User user = (User)context.Session["user"];
        string id = context.Request.Form["id"];
        string sql = string.Empty;
        string sql2 = string.Empty;
        if (string.IsNullOrEmpty(id) || id == "0")
        {
            sql = string.Format(@"SELECT TOP 1 CONVERT(varchar, MT_ROOM.ROOM_ID) + '^' + ROOM_NAME + '^' + dbo.dateTHShort(PERIOD_DATE) + ' ' + CONVERT(varchar, PERIOD_START) + '-' + CONVERT(varchar, PERIOD_STOP)
                                FROM TR_MEETING_PERIOD_TEMP
	                                INNER JOIN MT_ROOM ON TR_MEETING_PERIOD_TEMP.ROOM_ID = MT_ROOM.ROOM_ID
                                WHERE SESSION_ID = '{0}'
                                ORDER BY PERIOD_ID ASC", user.SESSION_ID);

            sql2 = string.Format(@"SELECT TOP 1 CONVERT(varchar, MT_ROOM.ROOM_ID) + '^' + ROOM_NAME + '^' + dbo.dateTHShort(PERIOD_DATE) + ' ' + CONVERT(varchar, PERIOD_START) + '-' + CONVERT(varchar, PERIOD_STOP)
                                FROM TR_MEETING_PERIOD_TEMP
	                                INNER JOIN MT_ROOM ON TR_MEETING_PERIOD_TEMP.ROOM_ID = MT_ROOM.ROOM_ID
                                WHERE SESSION_ID = '{0}'
                                ORDER BY PERIOD_ID DESC", user.SESSION_ID);
        }
        else
        {
            sql = @"SELECT CONVERT(varchar, ROOM_ID) + '^' + ROOM_NAME + '^' + PERIOD_DATE + ' ' + CONVERT(varchar, PERIOD_START) + '-' + CONVERT(varchar, PERIOD_STOP)
                    FROM [dbo].[getMeetingAllNew]()
                    WHERE MEETING_ID = " + id;
        }
        
        string roomPeriod = (new mainClass()).ExecuteSql(sql);
         roomPeriod += "@" + (new mainClass()).ExecuteSql(sql2);

        context.Response.ContentType = "text/plain";
        context.Response.Write(roomPeriod);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}