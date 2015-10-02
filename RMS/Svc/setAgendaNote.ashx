<%@ WebHandler Language="C#" Class="setAgendaNote" %>

using System;
using System.Web;

public class setAgendaNote : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string meetingId = context.Request.Form["mid"];
        string agendaId = context.Request.Form["aid"];
        string uname = context.Request.Form["uname"];
        string note = context.Request.Form["note"];
        
        mainClass mClass = new mainClass();
        try
        {
            string rec = mClass.ExecuteSql("select count(0) as c from tr_agenda_note where meeting_id=" + meetingId + " and agenda_id=" + agendaId + " and username='" + uname + "'");

            if (rec == "0")
            {
                mClass.ExecNonQuery("insert into tr_agenda_note(meeting_id,agenda_id, username,note,user_create,create_date)" +
                    "values(" + meetingId + "," + agendaId + ",'" + uname + "','" + note + "','" + uname + "',getdate())");
            }
            else
            {
                mClass.ExecNonQuery("update tr_agenda_note set note='" + note + "',user_update='" + uname + "',update_date=getdate() " +
                    "where meeting_id=" + meetingId + " and agenda_id=" + agendaId + " and username='" + uname + "'");
            }

            context.Response.ContentType = "text/plain";
            context.Response.Write("OK");
        }
        catch (Exception ex)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("ERR:"+ex.Message);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}