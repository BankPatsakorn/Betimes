<%@ WebHandler Language="C#" Class="GetCode" %>

using System;
using System.Web;

public class GetCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string fileName = System.Configuration.ConfigurationManager.AppSettings["HomePath"] + @"\View\" + context.Request.QueryString["f"];

        if (System.IO.File.Exists(fileName))
        {
            HttpContext.Current.Response.ContentType = "application/text";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + context.Request.QueryString["f"] + ".txt\"");
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.WriteFile(fileName);
            HttpContext.Current.Response.End();
        }
        else
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("File Not Found!!");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}