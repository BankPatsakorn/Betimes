<%@ WebHandler Language="C#" Class="getTaskFile" %>

using System;
using System.Web;
using System.Data;

public class getTaskFile : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        string taskId = context.Request.QueryString["taskId"];

        if (string.IsNullOrEmpty(taskId))
        {
            if (context.Session["FILE_UPLOAD_TASK"] != null)
            {
                System.Collections.Generic.List<string[]> fu = (System.Collections.Generic.List<string[]>)context.Session["FILE_UPLOAD_TASK"];
                var r0 = new System.Collections.Generic.List<TaskFile>();

                foreach (var s in fu)
                {
                    r0.Add(new TaskFile()
                    {
                        file_id = "0",
                        file_name = s[0],
                        file_path = "../upload/tf/" + s[1]
                    });
                }

                var jsonObj0 = (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(r0);
                context.Response.ContentType = "text/plain";
                context.Response.Write(jsonObj0);
                return;
            }
        }

        string sql = string.Format(@"SELECT ROW_NUMBER() OVER(ORDER BY [FILE_ID]) SEQ, [FILE_ID], [FILE_NAME], FILE_PATH 
                                    FROM TR_TASK_FILE 
                                    WHERE TASK_ID = {0} AND DEL_FLAG = 'N'
                                    ORDER BY [FILE_ID]", taskId);

        DataSet ds = (new mainClass()).GetDataSet(sql, "TR_TASK_FILE");

        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        var r = new System.Collections.Generic.List<TaskFile>();

        foreach (DataRow dr in ds.Tables["TR_TASK_FILE"].Rows)
        {
            r.Add(new TaskFile()
            {
                file_id = dr["FILE_ID"].ToString(),
                file_name = dr["FILE_NAME"].ToString(),
                file_path = dr["FILE_PATH"].ToString()
            });
        }

        var jsonObj = js.Serialize(r);

        context.Response.ContentType = "text/plain";
        context.Response.Write(jsonObj);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}

public class TaskFile
{
    public string file_id { get; set; }
    public string file_name { get; set; }
    public string file_path { get; set; }
}