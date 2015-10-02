<%@ WebHandler Language="C#" Class="svcAgendaUpDown" %>

using System;
using System.Web;

public class svcAgendaUpDown : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        User user = (User)context.Session["user"];
        string id = context.Request.QueryString["id"];
        string direction = context.Request.QueryString["direction"];
        string strReturn = "";
        if (id != null && id != "0" && direction == "up")
        {
            string sql = string.Format("EXEC [dbo].[AGENDA_UP] {0}, '{1}';",
                                    id, user.USER_NAME);
            strReturn += sql;
            (new mainClass()).ExecNonQuery(sql);
        }
        else if (id != null && id != "0" && direction == "down")
        {
            string sql = string.Format("EXEC [dbo].[AGENDA_DOWN] {0}, '{1}';",
                                    id, user.USER_NAME);
            strReturn += sql;
            (new mainClass()).ExecNonQuery(sql);
        }
            
            strReturn += "Reorder Agenda have been Saved.";


        context.Response.ContentType = "text/plain";
        context.Response.Write(strReturn);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}