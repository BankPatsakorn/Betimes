<%@ WebHandler Language="C#" Class="getServiceByRoom" %>

using System;
using System.Web;
using System.Data;

public class getServiceByRoom : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string roomId = context.Request.QueryString["id"];
        string sql = "SELECT SERVICE_ID, [SERVICE_NAME], ROOM_ID FROM MT_SERVICE WHERE DEL_FLAG = 'N' AND ROOM_ID IS NOT NULL";
        DataSet ds = (new mainClass()).GetDataSet(sql, "MT_SERVICE");

        string html = string.Empty;
        foreach (DataRow dr in ds.Tables["MT_SERVICE"].Rows)
        {
            if (!string.IsNullOrEmpty(dr["ROOM_ID"].ToString()))
            {
                string[] arrRoomId = dr["ROOM_ID"].ToString().Split(',');
                foreach (string s in arrRoomId)
                {
                    if (s == roomId)
                    {
                        html += string.Format("<option value='{0}'>{1}</option>",
                            dr["SERVICE_ID"].ToString(), dr["SERVICE_NAME"].ToString());
                    }
                }
            }
        }
        
        context.Response.ContentType = "text/plain";
        context.Response.Write(html);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}