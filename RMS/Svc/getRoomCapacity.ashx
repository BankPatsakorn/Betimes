<%@ WebHandler Language="C#" Class="getRoomCapacity" %>

using System;
using System.Web;

public class getRoomCapacity : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        mainClass mClass = new mainClass();
        string html = "";
        string strRoomID = context.Request.Form["RoomID"];
        html = mClass.ExecuteSql("select isnull(convert(varchar(10),ROOM_CAPACITY) + ' คน','ไม่ระบุ') from MT_ROOM where ROOM_ID = " + strRoomID);
        context.Response.Write(html);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}