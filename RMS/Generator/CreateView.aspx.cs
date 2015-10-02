using BTeFormGenerator.ExcelConfiguration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Generator_CreateView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string folderXML = ConfigurationManager.AppSettings["HomePath"] + @"\Generator\XML";
        string folderASPX = ConfigurationManager.AppSettings["HomePath"] + @"\View";
        ExcelConfiguration conf = ExcelConfiguration.GetExcelConfigurationXml(folderXML);
 
        try
        {
            if (Request.QueryString["v"] == "detail" && Request.QueryString["id"] != null && Request.QueryString["id"] != "")
            {
                FormGenerator gen = new FormGenerator();
                if (gen.GenerateDetailView(conf, Request.QueryString["id"], folderASPX))
                {
                    Response.Redirect("../View/" + Request.QueryString["id"] + ".aspx");
                }
            }
            else if (Request.QueryString["v"] == "list" && Request.QueryString["id"] != null && Request.QueryString["id"] != "")
            {
                FormGenerator gen = new FormGenerator();
                if (gen.GenerateListView(conf, Request.QueryString["id"], folderASPX))
                {
                    Response.Redirect("../View/" + Request.QueryString["id"] + ".aspx");
                }
            }
            else if (Request.QueryString["v"] == "lku" && Request.QueryString["id"] != null && Request.QueryString["id"] != "")
            {
                FormGenerator gen = new FormGenerator();
                if (gen.GenerateLookupView(conf, Request.QueryString["id"], folderASPX))
                {
                    Response.Redirect("../View/" + Request.QueryString["id"] + ".aspx");
                }
            }
        }
        catch (ApplicationException ex)
        {
            errLbl.Text = "Error : " + ex.Message;
        }
        catch (Exception ex)
        {
            errLbl.Text = "Error : " + ex.Message + "\r\n" + ex.StackTrace;
        }
    }
}