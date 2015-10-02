<%@ WebHandler Language="C#" Class="svcPersonalRegSave" %>

using System;
using System.Web;

public class svcPersonalRegSave : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        User user = (User)context.Session["user"];
        string mode = context.Request.Form["m"];
        string user_id = context.Request.Form["user_id"];
        string result = "false";

        if (string.IsNullOrEmpty(user_id))
        {
            return;
        }

        string sql = "select 0;";
        if (mode == "i")
        {
            sql = string.Format(@"INSERT INTO TR_PERSONAL_REG(PERSONAL_ID, REG_PERSONAL_ID,  DEL_FLAG, USER_CREATE, CREATE_DATE, USER_UPDATE, UPDATE_DATE)
                                    VALUES({0}, '{1}',  'N', '{2}', GETDATE(), '{2}', GETDATE())",
                                    user.PERSONAL_ID, user_id, user.USER_NAME);
        }
        else if (mode == "d")
        {
            sql = string.Format(@"update TR_PERSONAL_REG set 
[DEL_FLAG]='Y',  USER_UPDATE='{0}', UPDATE_DATE=getdate()
                                    where PERSONAL_ID={1} and REG_PERSONAL_ID={2} ",
                                      user.USER_NAME, user.PERSONAL_ID, user_id);
        }
        
        if ((new mainClass()).ExecNonQuery(sql) == 1)
        {
            result = "true";
        }
        
        context.Response.ContentType = "text/plain";
        context.Response.Write(result);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}