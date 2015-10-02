using BTeFormGenerator.ExcelConfiguration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FormControlTemplate
/// </summary>
public class FormControlTemplate
{
    public string ControlName;
    public string EditHtmlString;
    public string EditHtmlHeadString;
    public string ViewHtmlString;
    public string ViewHtmlHeadString;
    public string EditCsPopulateString;
    public string NewCsPopulateString;
    public string ViewCsPopulateString;
    public string InsertCsString;
    public string UpdateCsString;

	public FormControlTemplate()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static FormControlTemplate GetFormControlTemplate(string path)
    {
        FormControlTemplate obj = new FormControlTemplate();
        string str = File.ReadAllText(path);
        string[] strArr = str.Split('^');
        path = path.Substring(path.LastIndexOf("\\") + 1);
        obj.ControlName = path.Replace(".html","").ToLower();
        for (int i = 0; i < strArr.Length; ++i)
        {
            string[] line = strArr[i].Split('\n');
            if (line[0].Trim() == "EDIT")
            {
                obj.EditHtmlString = strArr[i].Replace("EDIT","").Trim();
            }
            else if (line[0].Trim() == "EDITPOPULATECS")
            {
                obj.EditCsPopulateString = strArr[i].Replace("EDITPOPULATECS\r\n", "");//.Trim(); 
            }
            else if (line[0].Trim() == "VIEW")
            {
                obj.ViewHtmlString = strArr[i].Replace("VIEW", "").Trim();
            }
            else if (line[0].Trim() == "VIEWPOPULATECS")
            {
                obj.ViewCsPopulateString = strArr[i].Replace("VIEWPOPULATECS\r\n", "");//.Trim();
            }
            else if (line[0].Trim() == "VIEWHEAD")
            {
                obj.ViewHtmlHeadString = strArr[i].Replace("VIEWHEAD", "").Trim();
            }
            else if (line[0].Trim() == "EDITHEAD")
            {
                obj.EditHtmlHeadString = strArr[i].Replace("EDITHEAD", "").Trim();
            }
            else if (line[0].Trim() == "INSERTCS")
            {
                obj.InsertCsString = strArr[i].Replace("INSERTCS\r\n", "");//.Trim();
            }
            else if (line[0].Trim() == "UPDATECS")
            {
                obj.UpdateCsString = strArr[i].Replace("UPDATECS\r\n", "");//.Trim();
            }
        }
        return obj;
    }

    string ReplaceUiItemValue(string template, ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string vieweName)
    {
        if (template == null) return "";
        if (uiItem.ElementId!=null) 
            template = template.Replace("{id}", uiItem.ElementId.Replace(".", "_"));
        else
            template = template.Replace("{id}", "item"+uiItem.RowNumber.ToString());
        if (uiItem.RowNumber != null) template = template.Replace("{rownum}", uiItem.RowNumber.ToString());
        if (uiItem.Caption != null)
        {
            template = template.Replace("{caption}", uiItem.Caption);

            template = template.Replace("*", "<span style=\"color: red\">*</span>");
        }
        else
            template = template.Replace("{caption}", "");
        if (uiItem.CustomStyle != null)
            template = template.Replace("{class}", uiItem.CustomStyle);
        else
            template = template.Replace("{class}", "");

        if (uiItem.Width != 0) 
            template = template.Replace("{width}", uiItem.Width.ToString());
        else
            template = template.Replace("Width=\"{width}\"", "");
        if (uiItem.Height != 0) 
            template = template.Replace("{height}", uiItem.Height.ToString());
        else
            template = template.Replace("Height=\"{height}\"", "");
        if (uiItem.DataBinding != null)
        {
            template = template.Replace("{fieldname}", uiItem.DataBinding.Substring(uiItem.DataBinding.IndexOf(".")+1));
            if (template.IndexOf("{lkudatasourceid}") >= 0)
                template = template.Replace("{lkudatasourceid}", "ds" + GetTableNameFK(tables, uiItem.DataBinding));
            if (template.IndexOf("{datasourceid}") >= 0)
                template = template.Replace("{datasourceid}", "ds" + vieweName);
            if (template.IndexOf("{fieldtext}") >= 0)
                template = template.Replace("{fieldtext}", "" + GetFieldTextFK(tables, uiItem.DataBinding));
            if (template.IndexOf("{fieldvalue}") >= 0)
                template = template.Replace("{fieldvalue}", "" + GetFieldValueFK(tables, uiItem.DataBinding));
        }
        else
        {
            template = template.Replace("{fieldname}", "");
            if (template.IndexOf("{lkudatasourceid}") >= 0)
                template = template.Replace("{lkudatasourceid}", "ds" + GetTableNameFK(tables, uiItem.DataBinding));
            if (template.IndexOf("{datasourceid}") >= 0)
                template = template.Replace("{datasourceid}", "ds" + vieweName);
            if (template.IndexOf("{fieldtext}") >= 0)
                template = template.Replace("{fieldtext}", "fd" + uiItem.RowNumber.ToString());
            if (template.IndexOf("{fieldvalue}") >= 0)
                template = template.Replace("{fieldvalue}", "fd" + uiItem.RowNumber.ToString());
       
        }
        if (uiItem.LevelValue != null && uiItem.LevelValue.Trim() != "")
            template = template.Replace("{value}", uiItem.LevelValue);
        if (uiItem.ElementId != null && uiItem.ElementId != "")
            template = template.Replace("{idlayout}", "id=\"" + uiItem.ElementId + "\"");
        else
            template = template.Replace("{idlayout}", "");
        //
        return template + "\r\n";
    }
    string GetTableNameFK(List<ExcelTableSpec> tables, string fd)
    {
        string fdRe = "";
        string fk = fd.Substring(fd.IndexOf(".") + 1);
        foreach (var tb in tables)
        {
            if (tb.PrimaryKey == fk) return tb.TableName;
        }
        return fdRe;
    }
    string GetFieldTextFK(List<ExcelTableSpec> tables, string fd)
    {
        string fdRe = "";
        string fk = fd.Substring(fd.IndexOf(".") + 1);
        foreach (var tb in tables)
        {
            if (tb.PrimaryKey == fk) return tb.DefaultDisplay;
        }
        return fdRe;
    }
    string GetFieldValueFK(List<ExcelTableSpec> tables, string fd)
    {
        string fdRe = "";
        string fk = fd.Substring(fd.IndexOf(".") + 1);
        foreach (var tb in tables)
        {
            if (tb.PrimaryKey == fk) return tb.PrimaryKey;
        }
        return fdRe;
    }
    public string GetEditHtml(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(EditHtmlString, uiItem, tables, viewName);
    }

    public string GetEditHtmlHead(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(EditHtmlHeadString, uiItem, tables, viewName);
    }

    public string GetViewHtml(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(ViewHtmlString, uiItem, tables, viewName);
    }

    public string GetViewHtmlHead(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(ViewHtmlHeadString, uiItem, tables, viewName);
    }

    public string GetEditCsPopulate(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(EditCsPopulateString, uiItem, tables, viewName);
    }

    public string GetNewCsPopulate(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(NewCsPopulateString, uiItem, tables, viewName);
    }

    public string GetViewCsPopulate(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(ViewCsPopulateString, uiItem, tables, viewName);
    }

    public string GetInsertCs(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(InsertCsString, uiItem, tables, viewName);
    }

    public string GetUpdateCs(ExcelUIViewDetailItem uiItem, List<ExcelTableSpec> tables, string viewName)
    {
        return ReplaceUiItemValue(UpdateCsString, uiItem, tables, viewName);
    }
}