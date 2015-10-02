using BTeFormGenerator.ExcelConfiguration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Generator_UploadExcel : System.Web.UI.Page
{
    public string ListASPX = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadXML();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string folderExcel = ConfigurationManager.AppSettings["HomePath"] + @"\Generator\Excel";
        string folderXML = ConfigurationManager.AppSettings["HomePath"] + @"\Generator\XML";

        try
        {
            Label1.Text = "";
            FileUpload1.SaveAs(folderExcel + "\\" + FileUpload1.FileName);
            ExcelConfiguration xlsConf = ExcelConfiguration.GetExcelConfigurationXls(folderExcel + "\\" + FileUpload1.FileName);
            ExcelConfiguration.SaveExcelConfigurationXml(xlsConf, folderXML);
            LoadXML();
        }
        catch (ApplicationException ex)
        {
            Label1.Text = ex.Message + "<br />" ;
        }
        catch (Exception ex)
        {
            Label1.Text += ex.Message + "<br />"+ex.StackTrace;
        }
    }

    void LoadXML()
    {
        ListASPX = "";
        string folderXML = ConfigurationManager.AppSettings["HomePath"] + @"\Generator\XML";
        string folderAsp = ConfigurationManager.AppSettings["HomePath"] + @"\View";
        ExcelConfiguration conf = ExcelConfiguration.GetExcelConfigurationXml(folderXML);


        ListASPX += "<div>";
        ListASPX += "<h3>List View</h3>";
        foreach (var o in conf.ViewList)
        {
            ListASPX += " - " + o.ViewName + " " + o.ViewTitle +
                " &nbsp; [<a href='CreateView.aspx?v=list&id=" + o.ViewName + "'>Create</a>]";
            if (File.Exists(folderAsp + "\\" + o.ViewName + ".aspx"))
            {
                ListASPX += " [<a href='../View/" + o.ViewName + ".aspx'>Link</a>]";
                ListASPX += " [<a href='../Generator/GetCode.ashx?f=" + o.ViewName + ".aspx'>Get ASPX</a>]";
                ListASPX += " [<a href='../Generator/GetCode.ashx?f=" + o.ViewName + ".aspx.cs'>Get CS</a>]";
            }
            else
            {
                ListASPX += "<span style='color:red'>**</span>";
            }
            ListASPX += "<br />";
        }
        ListASPX += "</div>";


        ListASPX += "<div>";
        ListASPX += "<h3>Detail View</h3>";
        foreach (var o in conf.ViewDetails)
        {
            ListASPX += " - " + o.ViewName + " "+ o.ViewTitle +
                " &nbsp; [<a href='CreateView.aspx?v=detail&id=" + o.ViewName + "'>Create</a>]";
            if (File.Exists(folderAsp + "\\" + o.ViewName + ".aspx"))
            {
                ListASPX += " [<a href='../View/" + o.ViewName + ".aspx'>Link</a>]";
                ListASPX += " [<a href='../Generator/GetCode.ashx?f=" + o.ViewName + ".aspx'>Get ASPX</a>]";
                ListASPX += " [<a href='../Generator/GetCode.ashx?f=" + o.ViewName + ".aspx.cs'>Get CS</a>]";
            }
            else
            {
                ListASPX += "<span style='color:red'>**</span>";
            }
            ListASPX += "<br />";
        }
        ListASPX += "</div>";


        ListASPX += "<div>";
        ListASPX += "<h3>Lookup View</h3>";
        foreach (var o in conf.ViewLookup)
        {
            ListASPX += " - " + o.ViewName + " " + o.ViewTitle +
                " &nbsp; [<a href='CreateView.aspx?v=lku&id=" + o.ViewName + "'>Create</a>]";
            if (File.Exists(folderAsp + "\\" + o.ViewName + ".aspx"))
            {
                ListASPX += " [<a href='../View/" + o.ViewName + ".aspx'>Link</a>]";
                ListASPX += " [<a href='../Generator/GetCode.ashx?f=" + o.ViewName + ".aspx'>Get ASPX</a>]";
                ListASPX += " [<a href='../Generator/GetCode.ashx?f=" + o.ViewName + ".aspx.cs'>Get CS</a>]";
            }
            else
            {
                ListASPX += "<span style='color:red'>**</span>";
            }
            ListASPX += "<br />";
        }
        ListASPX += "</div>";

        ListASPX += "<div>";
        ListASPX += "<h3>Table</h3>";
        foreach (var o in conf.Tables)
        {
            ListASPX += " - " + o.TableName + " " + 
                " &nbsp; [<a href='XML/" + o.TableName + ".table.xml'>View</a>] <br />";
        }
        ListASPX += "</div>";

        xml_div.InnerHtml = ListASPX;
    }
}