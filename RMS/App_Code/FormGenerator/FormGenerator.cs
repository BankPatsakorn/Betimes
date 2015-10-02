using BTeFormGenerator.ExcelConfiguration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FormGenerator
/// </summary>
public class FormGenerator
{
	public FormGenerator()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool GenerateListView(ExcelConfiguration conf, string viewName, string directoryPath)
    {
        ExcelUIViewList view = GetListView(conf, viewName);
        if (view != null)
        {
            string fileAspx = directoryPath + "\\" + view.ViewName + ".aspx";
            string fileCs = directoryPath + "\\" + view.ViewName + ".aspx.cs";
            string fileAspxTemplate = ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates\WebForm.aspx.exclude";
            string fileCsTemplate = ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates\WebForm.aspx.cs.exclude";

            string aspxStr = File.ReadAllText(fileAspxTemplate);
            string csStr = File.ReadAllText(fileCsTemplate);

            string aspxContent = "";
            string aspxHeader = "";

            string buttonStr = "";

            string[] tables = view.TableName.Split(',');
            ExcelTableSpec tableSpec = GetTableSpec(conf, tables[0], 0);

            FormListStructure frmList = GenerateListViewStructure(conf, viewName, directoryPath, true);

            if (view.InputParameters != null && view.InputParameters != "")
            {
                string[] inputs = view.InputParameters.Split(',');
                foreach (var f in inputs)
                {
                    frmList.VariableDeclareCS += "\tstring key=\"" + f.Substring(f.IndexOf('.') + 1) + "\";\r\n";
                    break;
                }
            }
            else
            {
                frmList.VariableDeclareCS += "\tstring key=\"id\";\r\n";
            }
            #region Gen button
            buttonStr +=  @"<input type=""button"" class='btn btn-primary' value=' Add ' onclick=""location='" + view.EditView + ".aspx?id=-1';\" />";
            #endregion

            #region Gen aspxContent
            aspxContent = @"<div>
<h1>" + view.ViewTitle + @"</h1>
</div>
<div>
" + buttonStr + @"
</div>
<div>
" + frmList.HtmlTag + @"
</div>
<div>
" + frmList.DataSourceTag + @"
</div>";
            #endregion

            #region Replace String
            //CodeFile="WebForm.aspx.cs" Inherits="Assets_ControlTemplates_WebForm"
            //MasterPageFile="~/Assets/ControlTemplates/MasterPageLayout.master" 
            aspxStr = aspxStr.Replace("CodeFile=\"WebForm.aspx.cs\"", "CodeFile=\"" + view.ViewName + ".aspx.cs\"");
            aspxStr = aspxStr.Replace("Inherits=\"Assets_ControlTemplates_WebForm\"", "Inherits=\"" + view.ViewName + "\"");
            aspxStr = aspxStr.Replace("MasterPageFile=\"~/Assets/ControlTemplates/MasterPageLayout.master\"", "MasterPageFile=\"~/Master/bs.master\"");
            aspxStr = aspxStr.Replace("{content}", aspxContent).Replace("{head}", aspxHeader);


            csStr = csStr.Replace("{ValidationStr}", "\r\n" + frmList.ValidateCS + "");
            csStr = csStr.Replace("{FormattingStr}", "\r\n" + frmList.FomattingCS + "");
            //class Assets_ControlTemplates_WebForm
            csStr = csStr.Replace("class Assets_ControlTemplates_WebForm", "class " + view.ViewName + "");
            csStr = csStr.Replace("{PopulateDataStr}", "\r\n" + frmList.PopulateCS + "");
            csStr = csStr.Replace("{declare}", "\r\n" + frmList.VariableDeclareCS + "");
            csStr = csStr.Replace("{init}", "\r\n" + frmList.InitCS + "");

            #endregion

            File.WriteAllText(fileAspx, aspxStr);
            File.WriteAllText(fileCs, csStr);

            return true;
        }
        else
        {

            return false;
        }
    }


    public bool GenerateDetailView(ExcelConfiguration conf, string viewName, string directoryPath)
    {
        
        ExcelUIViewDetail view = GetDetailView(conf, viewName);
        if (view != null)
        {
            FormControlTemplateManager ctls = FormControlTemplateManager.GetTemplateFromPath(ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates");
            string fileAspx = directoryPath + "\\" + view.ViewName + ".aspx";
            string fileCs = directoryPath + "\\" + view.ViewName + ".aspx.cs";
            string fileAspxTemplate = ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates\WebForm.aspx.exclude";
            string fileCsTemplate = ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates\WebForm.aspx.cs.exclude";

            string aspxStr = File.ReadAllText(fileAspxTemplate);
            string csStr = File.ReadAllText(fileCsTemplate);

            string aspxContent = "";
            string aspxHeader = "";

            string csDeclareVar = "";
            string csPopulateData = "";
            string csPopulateNewData = "";
            string csInitData = "";
            string csInsertData = "";
            string csUpdateData = "";
            string csUpdateKeyData = "";
            string csValidateData = "";
            string csFormattingData = "";
            List<ExcelTableSpec> tables = new List<ExcelTableSpec>();
            string[] tableArr = view.TableName.Split(',');
            int xx=0;
            foreach (var tb in tableArr)
            {

                tables.Add(GetTableSpec(conf, tb, xx * -1));
                xx++;
            }

            string htmlStr = "";
            string buttonStr = "";
            
            string select = "";
            string from = tables[0].TableName;
            string where = " 1=1 ";
            string sql = "";
            string dataSourceStr = "";
            string dsSelectParam = "";
            string sqlInsert = "";
            string sqlUpdate = "";
            string sqlDelete = "";
            string sqlInsertP2 = "";
            string sqlUpdateP2 = "";

            #region Gen htmlStr
            //view.Items.Sort();
            for (int i = 0; i < view.Items.Count; ++i )
            {
                ExcelUIViewDetailItem item = view.Items[i];
                
                FormControlTemplate ctl = ctls.GetControlByName(item.ElementType);
               if (item.ElementType == "listview") 
                {
                    FormListStructure frmList = GenerateListViewStructure(conf, item.LevelValue, directoryPath, false);
                    htmlStr += "<div>" + frmList.HtmlTag + "</div>"; //<div>" + frmList.TopButtonTag + "</div>
                    dataSourceStr += frmList.DataSourceTag;
                    csPopulateData += frmList.PopulateCS;
                    csInitData += frmList.InitCS;
                    csDeclareVar += frmList.VariableDeclareCS;
                    csFormattingData += frmList.FomattingCS;
                }
               else if (ctl == null)
               {
                   throw new ApplicationException("Error: View [" + view.ViewName + "] บรรทัดที่ " + item.RowNumber + " ไม่มี ElementType ใน template");

               }
               else if (ctl.ControlName == "dropdown" || ctl.ControlName == "radiolist") //is dropdown
               {
                   //find table
                   string tbName = GetFKTableName(item, conf);
                   if (tbName != null && tbName != "")
                   {
                       bool tbNotExisted = true;
                       for (int j = 0; j < tables.Count; ++j)
                       {
                           if (tbName.ToUpper() == tables[j].TableName.ToUpper())
                           {
                               tbNotExisted = false;
                               break;
                           }
                       }
                       if (tbNotExisted && tbName != null && tbName != "")
                           tables.Add(GetTableSpec(conf, tbName, item.RowNumber));


                       htmlStr += ctl.GetEditHtml(item, tables, view.ViewName);
                   }
                   else
                   {

                   }
               }
               else if (ctl.ControlName != "tab") //not is tab
               {
                   htmlStr += ctl.GetEditHtml(item, tables, view.ViewName);
               }
               else if (ctl.ControlName == "tab")
               {
                   htmlStr += ctl.GetEditHtmlHead(item, tables, view.ViewName);
                   bool isNotEndTab = true;
                   int countNestedTab = 0;
                   //find tabpage 
                   for (int j = i + 1; j < view.Items.Count && isNotEndTab; ++j)
                   {
                       ExcelUIViewDetailItem it = view.Items[j];
                       if (it.ElementType == "tabpage")
                       {
                           FormControlTemplate c = ctls.GetControlByName(it.ElementType);
                           htmlStr += c.GetEditHtmlHead(it, tables, view.ViewName);
                       }
                       else if (it.ElementType == "tab")
                       {
                           countNestedTab++;
                       }
                       else if (it.ElementType == "endtab")
                       {
                           countNestedTab--;
                           if (countNestedTab == -1)
                           {
                               FormControlTemplate c = ctls.GetControlByName(it.ElementType);
                               htmlStr += c.GetEditHtmlHead(it, tables, view.ViewName);
                               htmlStr += ctl.GetEditHtml(item, tables, view.ViewName);
                               isNotEndTab = false;
                           }
                       }
                   }
               }
            }
            #endregion


            #region Gen csDeclareVar csInitData csPopulateData where        
            csInitData += "\t\tds" + view.ViewName + ".SelectParameters.Clear();\r\n";


            csPopulateData += "\r\n\t\t//" + view.ViewName + "\r\n";
            csPopulateData += "\t\tTitle = \"" + view.ViewTitle + "\"; \r\n";
            csPopulateData += "\t\tDataView dv = (DataView)ds" + view.ViewName + ".Select(DataSourceSelectArguments.Empty);\r\n";
            csPopulateData += "\t\tDataRowView drv = dv[0];\r\n";

            csInsertData += "\t\tds" + view.ViewName + ".InsertParameters.Clear();\r\n";
            csUpdateData += "\t\tds" + view.ViewName + ".UpdateParameters.Clear();\r\n";
            if (view.InputParameters != null && view.InputParameters != "")
            {
                string[] fds = view.InputParameters.Split(',');
                int i = 0;
                foreach (var f in fds)
                {
                    i++;
                    where += " AND " + f + "=@" + f.Substring(f.IndexOf('.') + 1);
                    dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                    csDeclareVar += "\tstring inputMain" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    if(i==1)
                        csDeclareVar += "\tstring key=\"" + f.Substring(f.IndexOf('.') + 1) + "\";\r\n";
                    csInitData += @"        if (Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""] != null && Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""] != ""-1"")
        {
            inputMain" + f.Substring(f.IndexOf('.') + 1) + @" = Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""];
        }
";
                    csInitData += "\t\tds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, inputMain" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    csUpdateKeyData += "\t\tds" + view.ViewName + ".UpdateParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, inputMain" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    
                }
            }

            if (view.FilterParameters != null && view.FilterParameters != "")
            {
                string[] fds = view.FilterParameters.Split(',');
                foreach (var f in fds)
                {
                    where += " AND " + f + "=@" + f.Substring(f.IndexOf('.') + 1);
                    dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                    csDeclareVar += "string paramMain" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    csInitData += "\t\tds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, paramMain" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                }
            }

            foreach (var item in view.Items)
            {
                if (item.ElementType.ToLower() != "listview" && item.ElementType.ToLower() != "detailview")
                {
                    csPopulateData += ctls.GetControlByName(item.ElementType).GetEditCsPopulate(item, tables, view.ViewName) + "";
                    csPopulateNewData += ctls.GetControlByName(item.ElementType).GetNewCsPopulate(item, tables, view.ViewName) + "";
                    csInsertData += ctls.GetControlByName(item.ElementType).GetInsertCs(item, tables, view.ViewName) + "";
                    csUpdateData += ctls.GetControlByName(item.ElementType).GetUpdateCs(item, tables, view.ViewName) + "";
                    csValidateData += GetValidateString(conf, item.DataBinding);
                    csFormattingData += GetFormattingString(item, item.DataBinding);
                }
            }
            //int i = SqlDataSource1.Insert();
            //int i = SqlDataSource1.Update();
            csUpdateData += csUpdateKeyData;
            csInsertData += "\t\tint i = ds" + view.ViewName + ".Insert();\r\n";
            csUpdateData += "\t\tint i = ds" + view.ViewName + ".Update();\r\n";
            #endregion

            #region Gen button
            buttonStr += "";// @"<input type=""button"" class='btn btn-primary' value=' Save ' />";
            #endregion

            #region Gen sql dataSourceStr

            if (view.SQLSelect == null || view.SQLSelect == "")
            {
                if (tables.Count > 1)
                {
                    for (int i = 1; i < tables.Count; ++i)
                    {
                        from += GetJoinStr(conf, tables[0].TableName, tables[i].TableName);
                    }
                }
                sqlUpdateP2 = " 1=1 ";

                foreach (var fd in tables[0].Fields)
                {
                    if (fd.FieldPrimaryKey)
                    {
                        select += tables[0].TableName + "." + fd.FieldName + "\r\n,";
                        sqlUpdateP2 += "\r\n AND " + fd.FieldName + "=@" + fd.FieldName + "";
                    }
                }
                foreach (var item in view.Items)
                {
                    if (item.DataBinding != null && item.DataBinding != "")
                    {
                        string fdAll = item.DataBinding;
                        string tb = fdAll.Substring(0, fdAll.IndexOf("."));
                        string fd = fdAll.Substring(fdAll.IndexOf(".") + 1);

                        select += fdAll + "\r\n,";
                        if (tb.ToLower() == tables[0].TableName.ToLower())
                        {
                            sqlInsert += fd + "\r\n,";
                            sqlUpdate += fd + "=@" + fd + "\r\n,";
                            sqlInsertP2 += "@" + fd + "\r\n,";
                        }
                    }
                }
                select = select.Substring(0, select.Length - 1);
                sqlInsert = sqlInsert.Substring(0, sqlInsert.Length - 1);
                sqlInsertP2 = sqlInsertP2.Substring(0, sqlInsertP2.Length - 1);
                sqlUpdate = sqlUpdate.Substring(0, sqlUpdate.Length - 1);
                ;

                sql = "select \r\n" + select + " \r\nfrom " + from + " \r\nwhere " + where;
                sqlInsert = "insert into " + tableArr[0] + "\r\n(\r\n" + sqlInsert + ")\r\nvalues\r\n(\r\n" + sqlInsertP2 + ")";
                sqlUpdate = "update " + tableArr[0] + " \r\nset \r\n" + sqlUpdate + " \r\nwhere " + sqlUpdateP2 + "";
                sqlDelete = "DELETE FROM " + tables[0].TableName + @" WHERE [" + GetPrimaryKeyName(tables[0]) + @"] = @" + GetPrimaryKeyName(tables[0]) ;
            }
            else
            {
                sql = view.SQLSelect;
                sqlInsert = view.SQLInsert;
                sqlUpdate = view.SQLUpdate;
                sqlDelete = view.SQLDelete;
            }
            //DefaultConnection
            /*
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [COMMON_MASTER_ORGANIZE] WHERE [ORGANIZE_ID] = @PK_ID" 
            SelectCommand="SELECT * FROM [COMMON_MASTER_ORGANIZE]" 
            <DeleteParameters>
                <asp:Parameter Name="ORGANIZE_ID" Type="Int32" />
            </DeleteParameters>
             </asp:SqlDataSource>
             */
            dataSourceStr += @"
<asp:SqlDataSource ID=""ds" + view.ViewName + @""" runat=""server"" ConnectionString=""<%$ ConnectionStrings:DefaultConnection %>"" 
            DeleteCommand=""" + sqlDelete + @""" 
            SelectCommand=""" + sql + @""" 
            InsertCommand=""" + sqlInsert + @""" 
            UpdateCommand=""" + sqlUpdate + @""" 
            >
            <DeleteParameters>
                <asp:Parameter Name=""" + GetPrimaryKeyName(tables[0]) + @""" Type=""Int32"" />
            </DeleteParameters>
<SelectParameters>
" + dsSelectParam + @"
</SelectParameters>
             </asp:SqlDataSource>
";
            for (int i = 1; i < tables.Count; ++i)
            {
                dataSourceStr += @"
<asp:SqlDataSource ID=""ds" + tables[i].TableName + @""" runat=""server"" ConnectionString=""<%$ ConnectionStrings:DefaultConnection %>"" 
                    SelectCommand=""select " + tables[i].DefaultDisplay + "," + tables[i].PrimaryKey + " from " + tables[i].TableName + @""" >
             </asp:SqlDataSource>
";
            }

            for (int i = 0; i < view.Items.Count; ++i)
            {
                if (view.Items[i].CustomStyle != null && view.Items[i].CustomStyle != ""
                    && view.Items[i].ElementType.ToLower() == "dropdownfix" )
                {
                    string[] itemRows = view.Items[i].CustomStyle.Split(',');
                    dataSourceStr += @"
<asp:SqlDataSource ID=""ds" + view.Items[i].DataBinding.Substring(view.Items[i].DataBinding.IndexOf(".")+1) + @""" runat=""server"" ConnectionString=""<%$ ConnectionStrings:DefaultConnection %>"" 
                    SelectCommand=""select '-1' id, 'กรุณาเลือก' txt ";
                    foreach (var itemRow in itemRows)
                    {
                        if (itemRow.IndexOf(":") >= 0)
                        {
                            string[] itemCols = itemRow.Split(':');
                            dataSourceStr += " union all select '" + itemCols[0] + "','" + itemCols[1] + "' ";
                        }
                    }

                    dataSourceStr += @""" >
             </asp:SqlDataSource>";
                }
                else if (view.Items[i].CustomStyle != null && view.Items[i].CustomStyle != ""
                   && (view.Items[i].ElementType.ToLower() == "radiolistfix"))
                {
                    string[] itemRows = view.Items[i].CustomStyle.Split(',');
                    dataSourceStr += @"
<asp:SqlDataSource ID=""ds" + view.Items[i].DataBinding.Substring(view.Items[i].DataBinding.IndexOf(".") + 1) + @""" runat=""server"" ConnectionString=""<%$ ConnectionStrings:DefaultConnection %>"" 
                    SelectCommand=""select * from (select '-1' id, 'กรุณาเลือก' txt ";
                    foreach (var itemRow in itemRows)
                    {
                        if (itemRow.IndexOf(":") >= 0)
                        {
                            string[] itemCols = itemRow.Split(':');
                            dataSourceStr += " union all select '" + itemCols[0] + "','" + itemCols[1] + "' ";
                        }
                    }

                    dataSourceStr += @") aa where id <> '-1'"" >
             </asp:SqlDataSource>";
                }
            }
            
            #endregion

            #region Gen aspxContent
            aspxContent = @"<div>
<h1>" + view.ViewTitle + @"</h1>
</div>

<div  class=""col-sm-12"">
" + htmlStr + @"
</div>
<div>
" + dataSourceStr + @"
</div>";
            //<div>
            //" + buttonStr + @"
            //</div>
            #endregion


            #region Replace String
            //CodeFile="WebForm.aspx.cs" Inherits="Assets_ControlTemplates_WebForm"
            //MasterPageFile="~/Assets/ControlTemplates/MasterPageLayout.master" 
            aspxStr = aspxStr.Replace("CodeFile=\"WebForm.aspx.cs\"", "CodeFile=\"" + view.ViewName + ".aspx.cs\"");
            aspxStr = aspxStr.Replace("Inherits=\"Assets_ControlTemplates_WebForm\"", "Inherits=\"" + view.ViewName + "\"");
            aspxStr = aspxStr.Replace("MasterPageFile=\"~/Assets/ControlTemplates/MasterPageLayout.master\"", "MasterPageFile=\"~/Master/bs.master\"");
            aspxStr = aspxStr.Replace("{content}", aspxContent).Replace("{head}", aspxHeader);


            //class Assets_ControlTemplates_WebForm
            csStr = csStr.Replace("class Assets_ControlTemplates_WebForm", "class " + view.ViewName + "");

            csStr = csStr.Replace("{init}", "\r\n" + csInitData + "");
            csStr = csStr.Replace("{PopulateDataStr}", "\r\n" + csPopulateData + "");
            csStr = csStr.Replace("{PopulateNewDataStr}", "\r\n" + csPopulateNewData + "");
            csStr = csStr.Replace("{Insert}", "\r\n" + csInsertData + "");
            csStr = csStr.Replace("{Update}", "\r\n" + csUpdateData + "");
            csStr = csStr.Replace("{ValidationStr}", "\r\n" + csValidateData + "");
            csStr = csStr.Replace("{FormattingStr}", "\r\n" + csFormattingData + "");
            csStr = csStr.Replace("{declare}", "\r\n" + csDeclareVar + "");
            #endregion

            File.WriteAllText(fileAspx, aspxStr, System.Text.Encoding.UTF8);
            File.WriteAllText(fileCs, csStr, System.Text.Encoding.UTF8);

            return true;
        }
        else
        {

            return false;
        }
    }


    public bool GenerateLookupView(ExcelConfiguration conf, string viewName, string directoryPath)
    {
        ExcelUIViewLookup view = GetLookupView(conf, viewName);
        if (view != null)
        {
            string fileAspx = directoryPath + "\\" + view.ViewName + ".aspx";
            string fileCs = directoryPath + "\\" + view.ViewName + ".aspx.cs";
            string fileAspxTemplate = ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates\WebFormLku.aspx.exclude";
            string fileCsTemplate = ConfigurationManager.AppSettings["HomePath"] + @"\Assets\ControlTemplates\WebFormLku.aspx.cs.exclude";

            string aspxStr = File.ReadAllText(fileAspxTemplate);
            string csStr = File.ReadAllText(fileCsTemplate);

            string aspxContent = "";
            string aspxHeader = "";

            string buttonStr = "";

            string[] tables = view.TableName.Split(',');
            ExcelTableSpec tableSpec = GetTableSpec(conf, tables[0], 0);

            FormListStructure frmList = GenerateLookupViewStructure(conf, viewName, directoryPath);

            if (view.InputParameters != null && view.InputParameters != "")
            {
                string[] inputs = view.InputParameters.Split(',');
                foreach (var f in inputs)
                {
                    frmList.VariableDeclareCS += "\tstring key=\"" + f.Substring(f.IndexOf('.') + 1) + "\";\r\n";
                    break;
                }
            }
            else
            {
                frmList.VariableDeclareCS += "\tstring key=\"id\";\r\n";
            }
            #region Gen button
            buttonStr += "";// @"<input type=""button"" class='btn btn-primary' value=' Add ' onclick=''; />";
            #endregion

            #region Gen aspxContent
            aspxContent = @"<div>
<h1>" + view.ViewTitle + @"</h1>
</div>
<div>
" + buttonStr + @"
</div>
<div>
" + frmList.HtmlTag + @"
</div>
<div>
" + frmList.DataSourceTag + @"
</div>";
            #endregion

            #region Replace String
            //CodeFile="WebForm.aspx.cs" Inherits="Assets_ControlTemplates_WebForm"
            //MasterPageFile="~/Assets/ControlTemplates/MasterPageLayout.master" 
            aspxStr = aspxStr.Replace("CodeFile=\"WebForm.aspx.cs\"", "CodeFile=\"" + view.ViewName + ".aspx.cs\"");
            aspxStr = aspxStr.Replace("Inherits=\"Assets_ControlTemplates_WebForm\"", "Inherits=\"" + view.ViewName + "\"");
            aspxStr = aspxStr.Replace("MasterPageFile=\"~/Assets/ControlTemplates/MasterPageLayout.master\"", "MasterPageFile=\"~/Master/blank.master\"");
            aspxStr = aspxStr.Replace("{content}", aspxContent).Replace("{head}", aspxHeader);

            aspxStr = aspxStr.Replace("{fieldpk}", tableSpec.PrimaryKey);
            aspxStr = aspxStr.Replace("{fielddisplay}", tableSpec.DefaultDisplay);

            //class Assets_ControlTemplates_WebForm
            csStr = csStr.Replace("class Assets_ControlTemplates_WebForm", "class " + view.ViewName + "");
            csStr = csStr.Replace("{PopulateDataStr}", "\r\n" + frmList.PopulateCS + "");
            csStr = csStr.Replace("{declare}", "\r\n" + frmList.VariableDeclareCS + "");
            csStr = csStr.Replace("{init}", "\r\n" + frmList.InitCS + "");

            #endregion

            File.WriteAllText(fileAspx, aspxStr);
            File.WriteAllText(fileCs, csStr);

            return true;
        }
        else
        {

            return false;
        }
    }


    public FormListStructure GenerateListViewStructure(ExcelConfiguration conf, string viewName, string directoryPath, bool isInListView)
    {
        FormListStructure frm = new FormListStructure();
        ExcelUIViewList view = GetListView(conf, viewName);
        if (view != null)
        {

            string[] tables = view.TableName.Split(',');
            ExcelTableSpec tableSpec = GetTableSpec(conf, tables[0],0);

            string gridStr = "";
            string buttonStr = "";

            string select = "";
            string from = tables[0];
            string where = " 1=1 ";
            string sql = "";
            string dataSourceStr = "";
            string dsSelectParam = "";

            #region Gen Grid
                var editView = GetDetailView(conf, view.EditView);
                try
                {
                    string xx = editView.ViewName;
                }
                catch (Exception ex)
                {
                    throw new ApplicationException("View " + view.ViewName + " ต้องการ View " + view.EditView + " ** แต่ไม่มี", ex);
                }
                var linkDetail = @"<a target=""_blank"" onclick=""OpenChildDetail('fancyBox" + view.ViewName + @"','" + view.EditView + @".aspx?" + editView.GetHyperlinkRequest() + @"', view" + view.ViewName + @");""><img src=""images/edit.png"" style=""border:none"" alt=""edit"" /></a>";
                if (isInListView)
                {
                    linkDetail = @"<a target=""_self"" href=""" + view.EditView + @".aspx?" + editView.GetHyperlinkRequest() + @"""><img src=""images/edit.png"" style=""border:none"" alt=""edit"" /></a>";
                
                }
            gridStr = @"

<dx:ASPxGridView ID=""view" + view.ViewName + @""" runat=""server"" Width=""100%"" 
AutoGenerateColumns=""False"" Styles-AlternatingRow-BackColor=""White"" Styles-Row-BackColor=""#D9EDF7""
DataSourceID=""ds" + view.ViewName + @""" KeyFieldName=""" + GetPrimaryKeyName(tableSpec) + @"""  ClientInstanceName=""view" + view.ViewName + @""" Theme=""Metropolis"">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode=""Page"" ShowClearFilterButton=""True"" 
ShowDeleteButton=""True"" ShowSelectCheckbox=""False"" ButtonType=""Image"" VisibleIndex=""0"">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName=""" + GetPrimaryKeyName(tableSpec) + @""" ReadOnly=""True""  Visible=""False"" VisibleIndex=""2"">
                    <EditFormSettings Visible=""False"" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex=""1"" Caption="""">
                <DataItemTemplate>
                    " + linkDetail + @"
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
";

                int colNum = 2;
                foreach (var fd in view.Items)
                {
                    
                    colNum++;
                    var f = GetFieldSpec(conf, tables[0], fd.DataBinding);
                    //frm.ValidateCS += GetValidateString(conf, f.FieldName);
                    frm.FomattingCS += GetFormattingListString(view, fd);
                    try
                    {
                        if (f==null || f.FieldType == ExcelEntityFieldType.String)
                        {
                            gridStr += @" 
<dx:GridViewDataTextColumn Caption=""" + fd.Caption + @""" FieldName=""" + GetOnlyFieldName(fd) + @""" VisibleIndex=""" + colNum + @""">
</dx:GridViewDataTextColumn>
";
                        }
                        else if (f.FieldType == ExcelEntityFieldType.Number)
                        {
                            gridStr += @" 
<dx:GridViewDataSpinEditColumn Caption=""" + fd.Caption + @""" FieldName=""" + GetOnlyFieldName(fd) + @""" VisibleIndex=""" + colNum + @""">

</dx:GridViewDataSpinEditColumn>
";
                        }
                        else if (f.FieldType == ExcelEntityFieldType.DateTime)
                        {
                            gridStr += @" 
<dx:GridViewDataDateColumn Caption=""" + fd.Caption + @""" FieldName=""" + GetOnlyFieldName(fd) + @""" VisibleIndex=""" + colNum + @""">
</dx:GridViewDataDateColumn>
";
                        }
                        else if (f.FieldType == ExcelEntityFieldType.Boolean)
                        {
                            gridStr += @" 
<dx:GridViewDataCheckColumn Caption=""" + fd.Caption + @""" FieldName=""" + GetOnlyFieldName(fd) + @""" VisibleIndex=""" + colNum + @""">
</dx:GridViewDataCheckColumn>
";
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new ApplicationException("View " + view.ViewName + " ต้องการใช้ field [" + fd.DataBinding + "] แต่ไม่มีในตาราง [" + GetOnlyTableName(fd)+"]", ex);
                    }
                }

                gridStr += @"</Columns>
            <Settings ShowFilterRow=""True"" ShowFilterRowMenu=""true"" ShowHeaderFilterButton=""false"" ShowGroupPanel=""False"" />
            <SettingsBehavior ConfirmDelete=""true"" AllowSelectSingleRowOnly=""true"" /> 
            <SettingsText ConfirmDelete=""ท่านต้องการลบรายการนี้หรือไม่?"" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip=""ลบ"" Url=""Images/del.png"" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id=""fancyBox" + view.ViewName + @""" class='fancyBox'  style=""display:none""></a>
";

 
            #endregion

            #region Gen sql dataSourceStr
                if (view.SQLSelect == null || view.SQLSelect == "")
                {
                    ExcelTableSpec tb = GetTableSpec(conf, tables[0], 0);
                    foreach (var fd in tb.Fields)
                    {
                        if (fd.FieldPrimaryKey || fd.FieldForeignKey)
                        {
                            select += tb.TableName + "." + fd.FieldName + "\r\n,";
                        }
                    }
                    if (tables.Length > 1)
                    {
                        for (int i = 1; i < tables.Length; ++i)
                        {
                            from += GetJoinStr(conf, tables[0], tables[i]);
                        }
                    }
                    foreach (var item in view.Items)
                    {
                        if (item.DataBinding != null && item.DataBinding != "")
                        {
                            select += item.DataBinding + "\r\n,";
                        }
                    }
                    select = select.Substring(0, select.Length - 1);

                    if (view.InputParameters != null && view.InputParameters != "")
                    {
                        string[] fds = view.InputParameters.Split(',');
                        foreach (var f in fds)
                        {
                            where += " AND " + f + "=@" + f.Substring(f.IndexOf('.') + 1);
                            dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                        }
                    }

                    if (view.FilterParameters != null && view.FilterParameters != "")
                    {
                        string[] fds = view.FilterParameters.Split(',');
                        foreach (var f in fds)
                        {
                            where += " AND " + f + "=@" + f.Substring(f.IndexOf('.') + 1);
                            dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                        }
                    }
                    sql = "select " + select + " from " + from + " where " + where;
                }
                else
                {
                    sql = view.SQLSelect;
                }
            //DefaultConnection
            /*
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [COMMON_MASTER_ORGANIZE] WHERE [ORGANIZE_ID] = @PK_ID" 
            SelectCommand="SELECT * FROM [COMMON_MASTER_ORGANIZE]" 
            <DeleteParameters>
                <asp:Parameter Name="ORGANIZE_ID" Type="Int32" />
            </DeleteParameters>
             </asp:SqlDataSource>
             */
            dataSourceStr = @"
<asp:SqlDataSource ID=""ds" + view.ViewName + @""" runat=""server"" ConnectionString=""<%$ ConnectionStrings:DefaultConnection %>"" 
            DeleteCommand=""DELETE FROM " + tables[0] + @" WHERE [" + GetPrimaryKeyName(tableSpec) + @"] = @" + GetPrimaryKeyName(tableSpec) + @""" 
            SelectCommand=""" + sql + @""" >
            <DeleteParameters>
                <asp:Parameter Name=""" + GetPrimaryKeyName(tableSpec) + @""" Type=""Int32"" />
            </DeleteParameters>
<SelectParameters>
" + dsSelectParam + @"
</SelectParameters>
             </asp:SqlDataSource>";
            #endregion

            #region Gen PopulateData
            //frm.PopulateCS += "//Grid \r\n";
            //frm.PopulateCS += "ds" + view.ViewName + ".SelectParameters.Clear();\r\n";
            frm.InitCS += "//Grid "+ view.ViewName+" \r\n";
            frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Clear();\r\n";
            if (view.InputParameters != null && view.InputParameters != "")
            {
                string[] fds = view.InputParameters.Split(',');
                foreach (var f in fds)
                {
                    frm.VariableDeclareCS += "string input" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    //frm.PopulateCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, input" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    frm.InitCS += @"        if (Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""] != null && Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""] != ""-1"")
        {
            input" + f.Substring(f.IndexOf('.') + 1) + @" = Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""];
        }
"; 
                    frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, input" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    
                }
            }
            if (view.FilterParameters != null && view.FilterParameters != "")
            {
                string[] fds = view.FilterParameters.Split(',');
                foreach (var f in fds)
                {
                    frm.VariableDeclareCS += "string param" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    //frm.PopulateCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, param" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, param" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                }
            }
            if (view.SQLSelectParams != null && view.SQLSelectParams != "")
            {
                string[] fds = view.SQLSelectParams.Split(',');
                foreach (var f in fds)
                {
                    frm.VariableDeclareCS += "string param" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, param" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                }
            }
            #endregion

            #region Gen button
            buttonStr += "";// @"<input type=""button"" id=""btn" + view.ViewName + @"_new"" class='btn btn-primary' value=' Add ' onclick=""location='" + view.EditView + ".aspx?id=-1';\" />";
            #endregion

            frm.HtmlTag =  @"<div>
" + gridStr + @"
</div>";
            frm.DataSourceTag = dataSourceStr;
            frm.TopButtonTag = "";// buttonStr;

            return frm;
        }
        else
        {

            return frm;
        }
    }

    public FormListStructure GenerateLookupViewStructure(ExcelConfiguration conf, string viewName, string directoryPath)
    {
        FormListStructure frm = new FormListStructure();
        ExcelUIViewLookup view = GetLookupView(conf, viewName);
        if (view != null)
        {
            string[] tables = view.TableName.Split(',');
            ExcelTableSpec tableSpec = GetTableSpec(conf, tables[0],0);

            string gridStr = "";
            string buttonStr = "";

            string select = "";
            string from = tables[0];
            string where = " 1=1 ";
            string sql = "";
            string dataSourceStr = "";
            string dsSelectParam = "";

            #region Gen Grid
                gridStr = @"
<dx:ASPxGridView ID=""view" + view.ViewName + @""" runat=""server"" Width=""100%"" 
 Styles-AlternatingRow-BackColor=""White"" Styles-Row-BackColor=""#D9EDF7""
AutoGenerateColumns=""False"" ClientInstanceName=""view" + view.ViewName + @"""
DataSourceID=""ds" + view.ViewName + @""" KeyFieldName=""" + GetPrimaryKeyName(tableSpec) + @"""  Theme=""Metropolis"">
            <Columns>

            <dx:GridViewCommandColumn
ShowSelectButton =""True""
SelectAllCheckboxMode=""Page"" ShowClearFilterButton=""True"" 
ShowDeleteButton=""False"" ShowSelectCheckbox=""False"" ButtonType=""Image"" VisibleIndex=""30"">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName=""" + GetPrimaryKeyName(tableSpec) + @""" ReadOnly=""True""  Visible=""False"" VisibleIndex=""2"">
                    <EditFormSettings Visible=""False"" />
            </dx:GridViewDataTextColumn>
";

                int colNum = 2;
                foreach (var fd in view.Items)
                {
                    colNum++;
                    gridStr += @" <dx:GridViewDataTextColumn Caption=""" + fd.Caption + @""" FieldName=""" + GetOnlyFieldName(fd) + @""" VisibleIndex=""" + colNum + @"""></dx:GridViewDataTextColumn>
";
                }

                gridStr += @"</Columns>
            <Settings ShowFilterRow=""True"" ShowGroupPanel=""False"" />
            <SettingsBehavior ConfirmDelete=""true"" AllowSelectSingleRowOnly=""true"" /> 
        <SettingsCommandButton>
            <SelectButton>
                <Image ToolTip=""เลือก"" Url=""Images/select.png"" />
            </SelectButton>
        </SettingsCommandButton>

    <ClientSideEvents SelectionChanged=""grid_SelectionChanged"" />
        </dx:ASPxGridView>
";
            
            #endregion

            #region Gen sql dataSourceStr

                if (view.SQLSelect == null || view.SQLSelect == "")
                {
                    foreach (var fd in tableSpec.Fields)
                    {
                        if (fd.FieldPrimaryKey || fd.FieldForeignKey)
                        {
                            select += tableSpec.TableName + "." + fd.FieldName + "\r\n,";
                        }
                    }
                    if (tables.Length > 1)
                    {
                        for (int i = 1; i < tables.Length; ++i)
                        {
                            from += GetJoinStr(conf, tables[0], tables[i]);
                        }
                    }
                    foreach (var item in view.Items)
                    {
                        if (item.DataBinding != null && item.DataBinding != "")
                        {
                            select += item.DataBinding + "\r\n,";
                        }
                    }
                    select = select.Substring(0, select.Length - 1);

                    if (view.InputParameters != null && view.InputParameters != "")
                    {
                        string[] fds = view.InputParameters.Split(',');
                        foreach (var f in fds)
                        {
                            where += " AND " + f + "=@" + f.Substring(f.IndexOf('.') + 1);
                            dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                        }
                    }

                    if (view.FilterParameters != null && view.FilterParameters != "")
                    {
                        string[] fds = view.FilterParameters.Split(',');
                        foreach (var f in fds)
                        {
                            where += " AND " + f + "=@" + f.Substring(f.IndexOf('.') + 1);
                            dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                        }
                    }
                    sql = "select " + select + " from " + from + " where " + where;
                }
                else
                {
                    sql = view.SQLSelect;
                    if (view.SQLSelectParams != null && view.SQLSelectParams != "")
                    {
                        string[] fds = view.SQLSelectParams.Split(',');
                        foreach (var f in fds)
                        {
                            dsSelectParam += "<asp:Parameter Name=\"" + f.Substring(f.IndexOf('.') + 1) + "\" Type=\"Int32\" />";
                        }
                    }
                }
            //DefaultConnection
            /*
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [COMMON_MASTER_ORGANIZE] WHERE [ORGANIZE_ID] = @PK_ID" 
            SelectCommand="SELECT * FROM [COMMON_MASTER_ORGANIZE]" 
            <DeleteParameters>
                <asp:Parameter Name="ORGANIZE_ID" Type="Int32" />
            </DeleteParameters>
             </asp:SqlDataSource>
             */
            dataSourceStr = @"<asp:SqlDataSource ID=""ds" + view.ViewName + @""" runat=""server"" ConnectionString=""<%$ ConnectionStrings:DefaultConnection %>"" 
            DeleteCommand=""DELETE FROM " + tables[0] + @" WHERE [" + GetPrimaryKeyName(tableSpec) + @"] = @" + GetPrimaryKeyName(tableSpec) + @""" 
            SelectCommand=""" + sql + @""" >
            <DeleteParameters>
                <asp:Parameter Name=""" + GetPrimaryKeyName(tableSpec) + @""" Type=""Int32"" />
            </DeleteParameters>
<SelectParameters>
" + dsSelectParam + @"
</SelectParameters>
             </asp:SqlDataSource>";
            #endregion

            #region Gen PopulateData
            //frm.PopulateCS += "//Grid \r\n";
            //frm.PopulateCS += "ds" + view.ViewName + ".SelectParameters.Clear();\r\n";
            frm.InitCS += "//Grid " + view.ViewName + " \r\n";
            frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Clear();\r\n";
            if (view.InputParameters != null && view.InputParameters != "")
            {
                string[] fds = view.InputParameters.Split(',');
                foreach (var f in fds)
                {
                    frm.VariableDeclareCS += "string input" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    //frm.PopulateCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, input" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    frm.InitCS += @"        if (Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""] != null && Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""] != ""-1"")
        {
            input" + f.Substring(f.IndexOf('.') + 1) + @" = Request.QueryString[""" + f.Substring(f.IndexOf('.') + 1) + @"""];
        }
";
                    frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, input" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";

                }
            }
            if (view.FilterParameters != null && view.FilterParameters != "")
            {
                string[] fds = view.FilterParameters.Split(',');
                foreach (var f in fds)
                {
                    frm.VariableDeclareCS += "string param" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    //frm.PopulateCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, param" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                    frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, param" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                }
            }
            if (view.SQLSelectParams != null && view.SQLSelectParams != "")
            {
                string[] fds = view.SQLSelectParams.Split(',');
                foreach (var f in fds)
                {
                    frm.VariableDeclareCS += "string param" + f.Substring(f.IndexOf('.') + 1) + "=\"-1\";\r\n";
                    frm.InitCS += "ds" + view.ViewName + ".SelectParameters.Add(\"" + f.Substring(f.IndexOf('.') + 1) + "\", System.Data.DbType.Int32, param" + f.Substring(f.IndexOf('.') + 1) + ");\r\n";
                }
            }
            #endregion

            #region Gen button
            //buttonStr += @"<input type=""button"" id=""btn" + view.ViewName + @"_new"" class='btn btn-primary' value=' Add ' onclick="""" />";
            #endregion

            frm.HtmlTag = @"<div>
" + gridStr + @"
</div>";
            frm.DataSourceTag = dataSourceStr;
            frm.TopButtonTag = buttonStr;

            return frm;
        }
        else
        {

            return frm;
        }
    }


    #region util
    ExcelUIViewList GetListView(ExcelConfiguration conf, string viewName)
    {
        foreach (var view in conf.ViewList)
        {
            if (view.ViewName.ToUpper() == viewName.ToUpper()) return view;
        }
        return null;
    }

    ExcelUIViewDetail GetDetailView(ExcelConfiguration conf, string viewName)
    {
        foreach (var view in conf.ViewDetails)
        {
            if (view.ViewName.ToUpper() == viewName.ToUpper()) return view;
        }
        return null;
    }

    ExcelUIViewLookup GetLookupView(ExcelConfiguration conf, string viewName)
    {
        foreach (var view in conf.ViewLookup)
        {
            if (view.ViewName.ToUpper() == viewName.ToUpper()) return view;
        }
        return null;
    }





    //sql
    string GetJoinStr(ExcelConfiguration conf, string table1, string table2)
    {
        string join = " \r\nleft join "+ table2 + " on ";
        ExcelTableSpec tb = GetTableSpec(conf, table1, 0);
        int i = 0;
        foreach (var fd in tb.Fields)
        {
            if (fd.FieldForeignKey && fd.FieldForeignKeyTableName.ToUpper() == table2.ToUpper())
            {
                i++;
                if (i == 1)
                {
                    join += tb.TableName + "." + fd.FieldName + " = " + fd.FieldForeignKeyTableName + "." + fd.FieldName + " ";
                }
                else
                {
                    join += " AND " + tb.TableName + "." + fd.FieldName + " = " + fd.FieldForeignKeyTableName + "." + fd.FieldName + " ";
                }
            }
        }
        return join;
    }

    ExcelTableSpec GetTableSpec(ExcelConfiguration conf, string tablename, int rowNumber)
    {
        ExcelTableSpec tbOut = null;
        foreach (var tb in conf.Tables)
        {
            if (tb.TableName.ToUpper() == tablename.ToUpper()) tbOut = tb;
        }

        try
        {
            string name = tbOut.TableName;
        }
        catch (Exception ex)
        {
            throw new ApplicationException("มีการเรียกใช้ table \"" + tablename + "\" แต่ไม่มี rownum="+rowNumber, ex);
        }

        return tbOut;
    }
    ExcelFieldSpec GetFieldSpec(ExcelConfiguration conf, string tablename, string fieldname)
    {
        foreach (var tb in conf.Tables)
        {
            if (tb.TableName.ToUpper() == tablename.ToUpper())
            {
                foreach (var fd in tb.Fields)
                {
                    if(fd.FieldName.ToUpper() == fieldname.ToUpper())
                    return fd;
                }
                break;
            }
        }
        return null;
    }

    string GetValidateString(ExcelConfiguration conf, string fieldname)
    {
        string validStr = "";
        if (fieldname==null || fieldname.IndexOf(".") < 0) return "";
        string tb = fieldname.Substring(0, fieldname.IndexOf("."));
        string fd = fieldname.Substring(fieldname.IndexOf(".")+1);
        ExcelFieldSpec fdSpec = GetFieldSpec(conf, tb, fd);
        if(fdSpec == null)return "";
        if (fdSpec.IsRequireField)
        {
            validStr += "\t\tctl" + fd + ".ValidationSettings.RequiredField.IsRequired = true;\r\n";
            validStr += "\t\tctl" + fd + ".ValidationSettings.RequiredField.ErrorText = \"" + fdSpec.IsRequireFieldMsg + "\";\r\n";
        }
        if (fdSpec.MaxLength > 0)
        {
            validStr += "\t\tctl" + fd + ".MaxLength = " + fdSpec.MaxLength.ToString() + ";\r\n";
        }
        if (fdSpec.RegularExpression != null && fdSpec.RegularExpression!="")
        {
            validStr += "\t\tctl" + fd + ".ValidationSettings.RegularExpression.ValidationExpression = \"" + fdSpec.RegularExpression + "\";\r\n";
            validStr += "\t\tctl" + fd + ".ValidationSettings.RegularExpression.ErrorText = \"" + fdSpec.IsRegularExpressionMsg + "\";\r\n";
        }
       
        return validStr;
    }

    string GetFormattingString(ExcelUIViewDetailItem item, string fieldname)
    {
        string str = "";
        if (fieldname == null || fieldname.IndexOf(".") < 0) return "";
        string tb = fieldname.Substring(0, fieldname.IndexOf("."));
        string fd = fieldname.Substring(fieldname.IndexOf(".") + 1);
        if (item.TextAlignment!=null && item.TextAlignment.ToLower() == "right")
        {
            //ctlPROVINCE_CODE.Style.Add("text-align","right");
            str += "\t\tctl" + fd + ".HorizontalAlign = HorizontalAlign.Right;\r\n";
        }
        else if (item.TextAlignment != null && item.TextAlignment.ToLower() == "center")
        {
            str += "\t\tctl" + fd + ".HorizontalAlign = HorizontalAlign.Center;\r\n";
        }

        if (item.Formats != null && item.Formats != "")
        {
            str += "\t\tctl" + fd + ".DisplayFormatString = \"" + item.Formats + "\";\r\n";
        }

        return str;
    }

    string GetFormattingListString(ExcelUIViewList list, ExcelUIViewListItem item)
    {
        string str = "";
        if (item.DataBinding == null || item.DataBinding.IndexOf(".") < 0) return "";
        string tb = item.DataBinding.Substring(0, item.DataBinding.IndexOf("."));
        string fd = item.DataBinding.Substring(item.DataBinding.IndexOf(".") + 1);
        if (item.TextAlignment != null && item.TextAlignment.ToLower() == "right")
        {
            //viewCRMT_PMM_PROJECT_CONTRACT_List.DataColumns[""].PropertiesEdit.DisplayFormatString = "";
            //viewCRMT_PMM_PROJECT_CONTRACT_List.Columns[""].CellStyle.HorizontalAlign = HorizontalAlign.Center;
            str += "\t\tview" + list.ViewName + ".Columns[\"" + fd + "\"].CellStyle.HorizontalAlign = HorizontalAlign.Right;\r\n";
        }
        else if (item.TextAlignment != null && item.TextAlignment.ToLower() == "center")
        {
            str += "\t\tview" + list.ViewName + ".Columns[\"" + fd + "\"].CellStyle.HorizontalAlign = HorizontalAlign.Center;\r\n";
        }

        if (item.Formats != null && item.Formats != "")
        {
            str += "\t\tview" + list.ViewName + ".DataColumns[\"" + fd + "\"].PropertiesEdit.DisplayFormatString = \"" + item.Formats + "\";\r\n";
        }

        return str;
    }
    /*
             ctlPROVINCE_CODE.MaskSettings.Mask = "";
        ctlPROVINCE_CODE.MaxLength = 3;
        
        ctlPROVINCE_CODE.DisplayFormatString = "0-00";
        ctlPROVINCE_CODE.NullText = "(ว่าง)";
        ctlPROVINCE_CODE.CssClass = "form-control";
        ctlPROVINCE_NAME.CssClass = "form-control";
        ctlREGION_ID.CssClass = "form-control";
        ctlOptimisticLockField.CssClass = "form-control";
        ctlOptimisticLockField.Width = 300;
        ctlUPDATE_DATE.CssClass = "form-control";
        ctlUPDATE_DATE.Width = 300;
             */
    string GetPrimaryKeyName(ExcelTableSpec tb)
    {
        try
        {
            foreach (var fd in tb.Fields)
            {
                if (fd.FieldPrimaryKey) return fd.FieldName;
            }
        }
        catch (Exception ex)
        {
            throw new ApplicationException("ไม่มี PK ของ Table [" + tb.TableName + "]", ex);
        }
        return null;
    }
    string GetPrimaryKeyType(ExcelTableSpec tb)
    {
        try
        {
            foreach (var fd in tb.Fields)
            {
                if (fd.FieldPrimaryKey) return fd.FieldTypeString;
            }
        }
        catch (Exception ex)
        {
            throw new ApplicationException("ไม่มี Type ของ  PK Table [" + tb.TableName + "]", ex);
        }
        return null;
    }

    string GetOnlyFieldName(ExcelUIViewListItem fd)
    {
        if (fd.DataBinding.IndexOf(".") >= 0)
            return fd.DataBinding.Substring(fd.DataBinding.IndexOf(".") + 1);
        else
            return fd.DataBinding;

    }
    string GetOnlyTableName(ExcelUIViewListItem fd)
    {
        if (fd.DataBinding.IndexOf(".") >= 0)
            return fd.DataBinding.Substring(0, fd.DataBinding.IndexOf("."));
        else
            return "";

    }
    string GetOnlyFieldName(ExcelUIViewDetailItem fd)
    {
        if (fd.DataBinding.IndexOf(".") >= 0)
            return fd.DataBinding.Substring(fd.DataBinding.IndexOf(".") + 1);
        else
            return fd.DataBinding;

    }
    string GetOnlyTableName(ExcelUIViewDetailItem fd)
    {
        if (fd.DataBinding.IndexOf(".") >= 0)
            return fd.DataBinding.Substring(0, fd.DataBinding.IndexOf("."));
        else
            return "";

    }
    string GetFKTableName(ExcelUIViewDetailItem fd, ExcelConfiguration conf)
    {
        ExcelFieldSpec f = GetFieldSpec(conf, GetOnlyTableName(fd), GetOnlyFieldName(fd));
        if (f.FieldForeignKey)
            return f.FieldForeignKeyTableName;
        else
            return "";

    }
    #endregion
}