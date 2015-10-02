<%@ WebHandler Language="C#" Class="setSecretary" %>

using System;
using System.Web;

public class setSecretary : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string perId = context.Request.Form["pid"];
        string secId = context.Request.Form["sid"];
        string mode = context.Request.Form["m"];
        
        mainClass mClass = new mainClass();
        try
        {
            if (mode == "I")
            {
               // mClass.ExecNonQuery("delete from TR_SECRETARY where PERSONAL_ID=" + perId);

                string[] secIdArr = secId.Split(',');
                for (int i = 0; i < secIdArr.Length; ++i)
                {
                    if(secIdArr[i]!="")
                    mClass.ExecNonQuery("insert into TR_SECRETARY(PERSONAL_ID, SECRETARY_PERSONAL_ID, DEL_FLAG,create_date)" +
                        "values(" + perId + "," + secIdArr[i] + ",'N',getdate())");
                }

            }
            else if (mode == "D")
            {
                mClass.ExecNonQuery("update TR_SECRETARY SET DEL_FLAG='Y' where PERSONAL_ID=" + perId + " and SECRETARY_PERSONAL_ID=" + secId);
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