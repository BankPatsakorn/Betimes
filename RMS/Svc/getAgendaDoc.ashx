<%@ WebHandler Language="C#" Class="getAgendaDoc" %>

using System;
using System.Web;
using System.Data;

public class getAgendaDoc : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        string id = context.Request.QueryString["id"];
        string agendaId = context.Request.QueryString["agendaId"];
        string level = context.Request.QueryString["level"];

        #region Get file from session
        if (string.IsNullOrEmpty(agendaId))
        {
            if (context.Session["FILE_UPLOAD"] != null)
            {
                System.Collections.Generic.List<string[]> fu = (System.Collections.Generic.List<string[]>)context.Session["FILE_UPLOAD"];
                var r0 = new System.Collections.Generic.List<AgendaDoc>();
                
                foreach (var s in fu)
                {
                    r0.Add(new AgendaDoc()
                    {
                        adoc_id = "0",
                        meeting_id = id,
                        level_no = "0",
                        agenda_id = "0",
                        doc_name = s[0],
                        doc_path = "../upload/agenda/" + s[1]
                    });
                }

                var jsonObj0 = (new System.Web.Script.Serialization.JavaScriptSerializer()).Serialize(r0);
                context.Response.ContentType = "text/plain";
                context.Response.Write(jsonObj0);
                return;
            }
        }
        #endregion

        string sql = string.Format(@"SELECT ADOC_ID, MEETING_ID, AGENDA_ID, LEVEL_NO, DOC_NAME, DOC_PATH
                                    FROM TR_AGENDA_DOC 
                                    WHERE MEETING_ID = {0} AND LEVEL_NO = {2} AND DEL_FLAG = 'N' AND AGENDA_ID = {1}", 
                                    id, agendaId, level);

        DataSet ds = (new mainClass()).GetDataSet(sql, "TR_AGENDA_DOC");

        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        var r = new System.Collections.Generic.List<AgendaDoc>();

        foreach (DataRow dr in ds.Tables["TR_AGENDA_DOC"].Rows)
        {
            r.Add(new AgendaDoc()
            {
                adoc_id = dr["ADOC_ID"].ToString(),
                meeting_id = dr["MEETING_ID"].ToString(),
                level_no = dr["LEVEL_NO"].ToString(),
                agenda_id = dr["AGENDA_ID"].ToString(),
                doc_name = dr["DOC_NAME"].ToString(),
                doc_path = dr["DOC_PATH"].ToString()
            });
        }
        
        var jsonObj = js.Serialize(r);

        context.Response.ContentType = "text/plain";
        context.Response.Write(jsonObj);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}

public class AgendaDoc 
{
    public string adoc_id { get; set; }
    public string meeting_id { get; set; }
    public string parent_id { get; set; }
    public string level_no { get; set; }
    public string agenda_id { get; set; }
    public string doc_name { get; set; }
    public string doc_path { get; set; }
}