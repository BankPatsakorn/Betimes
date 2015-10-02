<%@ WebHandler Language="C#" Class="setPostponeMeeting" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;
public class setPostponeMeeting : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        mainClass cls = new mainClass();
        string strPERIOD_ID = context.Request.Form["periodId"];
        if (strPERIOD_ID == null || strPERIOD_ID == "") {
            strPERIOD_ID = "0";
        }
        cls.ExecuteSql("update TR_MEETING_PERIOD set DEL_FLAG = 'Y',UPDATE_DATE = getdate() where PERIOD_ID = " + strPERIOD_ID);
        context.Response.Write("0");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}