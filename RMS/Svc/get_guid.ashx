<%@ WebHandler Language="C#" Class="get_guid" %>

using System;
using System.Web;

public class get_guid : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        Guid guids = Guid.NewGuid();
        context.Response.Write(guids);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}