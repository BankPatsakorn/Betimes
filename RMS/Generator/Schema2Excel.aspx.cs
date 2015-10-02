using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using ICSharpCode.SharpZipLib.Core;
using ICSharpCode.SharpZipLib.Zip;
using System.Configuration;
using BTeFormGenerator.ExcelConfiguration;

public partial class Generator_UploadExcel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitialParameter();
        }
    }

    private void InitialParameter()
    {
        (new mainClass()).LoadLookUpToDropDownList(ddlDatabase, "SELECT database_id, UPPER(name) name FROM sys.databases WHERE owner_sid <> 0x01 ORDER BY name", "กรุณาเลือก");
        ddlDatabase.SelectedIndex = 1;
    }

    private void PopulateDataSet()
    {
    }
    
    protected void btnExport_Click(object sender, EventArgs e)
    {
        if (ddlDatabase.SelectedIndex == 0) return;

        mainClass cls = new mainClass();
        string sql = string.Format("SELECT name, [object_id] FROM {0}.sys.tables", ddlDatabase.SelectedItem);
        DataSet ds = cls.GetDataSet(sql, "tables");

        using (ExcelPackage package = new ExcelPackage())
        {
            foreach (DataRow dr in ds.Tables["tables"].Rows)
            {
                // add a new worksheet to the empty workbook
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add(dr["name"].ToString());

                worksheet.Cells["A1"].Value = "TableId";
                worksheet.Cells["B1"].Value = dr["object_id"].ToString();
                worksheet.Cells["A2"].Value = "TableName";
                worksheet.Cells["B2"].Value = dr["name"].ToString();
                worksheet.Cells["A3"].Value = "DefaultDisplay";
                worksheet.Cells["G1"].Value = "FormType";
                worksheet.Cells["H1"].Value = "Data";

                worksheet.Cells["A1"].Style.Font.Bold = true;
                worksheet.Cells["A2"].Style.Font.Bold = true;
                worksheet.Cells["A3"].Style.Font.Bold = true;
                worksheet.Cells["G1"].Style.Font.Bold = true;

                ////Add the headers
                worksheet.Cells["A5"].Value = "SystemId";
                worksheet.Cells["B5"].Value = "Field";
                worksheet.Cells["C5"].Value = "PK/FK";
                worksheet.Cells["D5"].Value = "Type";
                worksheet.Cells["E5"].Value = "DefaultValue";
                worksheet.Cells["F5"].Value = "ValueList";
                worksheet.Cells["G5"].Value = "Null";
                worksheet.Cells["H5"].Value = "RequireField";
                worksheet.Cells["I5"].Value = "RequireField (Error Msg)";
                worksheet.Cells["J5"].Value = "RegularExpression";
                worksheet.Cells["K5"].Value = "RegularExpression (Error Msg)";
                worksheet.Cells["L5"].Value = "UniqueValue";
                worksheet.Cells["M5"].Value = "UniqueValue (Error Msg)";
                worksheet.Cells["N5"].Value = "MinLength";
                worksheet.Cells["O5"].Value = "MinLength (Error Msg)";
                worksheet.Cells["P5"].Value = "MaxLength";
                worksheet.Cells["Q5"].Value = "MaxLength (Error Msg)";
                worksheet.Cells["R5"].Value = "RuleCriteria";
                worksheet.Cells["S5"].Value = "RuleCriteria (Error Msg)";
                worksheet.Cells["T5"].Value = "FileAttachment";
                worksheet.Cells["U5"].Value = "AppearanceRules";
                worksheet.Cells["V5"].Value = "CalculationRules";

                worksheet.Cells["A5:V5"].Style.Font.Bold = true;
                System.Drawing.Color colFromHex = System.Drawing.ColorTranslator.FromHtml("#B7DEE8");
                worksheet.Cells["A5:V5"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                worksheet.Cells["A5:V5"].Style.Fill.BackgroundColor.SetColor(colFromHex);

                sql = string.Format(@"SELECT column_id, C.name, 
                                    --PF.CONSTRAINT_TYPE, 
                                    CASE PF.CONSTRAINT_TYPE WHEN 'PRIMARY KEY' THEN 'PK' WHEN 'FOREIGN KEY' THEN 'FK' ELSE '' END CONSTRAINT_TYPE,
                                    C.user_type_id, 
                                    --T.name [type_name], 
                                    CASE 
		                                WHEN T.name IN ('nvarchar', 'varchar', 'char') AND C.max_length <> -1 THEN T.name + ' (' + CONVERT(varchar, C.max_length) + ')' 
		                                WHEN T.name IN ('nvarchar', 'varchar', 'char') AND C.max_length = -1 THEN T.name + ' (max)' 
		                                ELSE T.name 
	                                END [type_name],
                                    C.max_length, C.is_nullable, is_identity
                                FROM {0}.sys.columns C
	                                LEFT JOIN (SELECT KCU.TABLE_NAME, COLUMN_NAME, CONSTRAINT_TYPE
				                                FROM {0}.INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
					                                INNER JOIN {0}.INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU ON TC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
				                                WHERE KCU.TABLE_NAME = '{1}') AS PF ON C.name = PF.COLUMN_NAME
	                                INNER JOIN {0}.sys.types T ON C.user_type_id = T.user_type_id
                                WHERE [object_id] = {2}",
                                ddlDatabase.SelectedItem, dr["name"].ToString(), dr["object_id"].ToString());

                DataSet ds_columns = cls.GetDataSet(sql, "columns");

                int row = 6;
                foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
                {
                    worksheet.Cells["A" + row.ToString()].Value = dr_columns["column_id"].ToString();
                    worksheet.Cells["B" + row.ToString()].Value = dr_columns["name"].ToString();
                    worksheet.Cells["C" + row.ToString()].Value = dr_columns["CONSTRAINT_TYPE"].ToString();
                    worksheet.Cells["D" + row.ToString()].Value = dr_columns["type_name"].ToString();
                    worksheet.Cells["G" + row.ToString()].Value = dr_columns["is_nullable"].ToString();
                    row++;
                }
            }

            string fileName = string.Format("{0}_{1}.xlsx", ddlDatabase.SelectedItem, DateTime.Now.ToString("dd-MM-yyyy_HH-mm-ss"));

            //Write it back to the client
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", string.Format("attachment;  filename={0}", fileName));
            Response.BinaryWrite(package.GetAsByteArray());
            Response.End();
        }
    }
    

    protected void btnExportUI_Click(object sender, EventArgs e)
    {
        if (ddlDatabase.SelectedIndex == 0) return;

        mainClass cls = new mainClass();
        string sql = string.Format("SELECT name, [object_id] FROM {0}.sys.tables", ddlDatabase.SelectedItem);
        DataSet ds = cls.GetDataSet(sql, "tables");

        //string folder = Server.MapPath(string.Format("assets/schema2excel/{0}_{1}", ddlDatabase.SelectedItem, DateTime.Now.ToString("ddMMyyyy_HHmmss")));
        string folder = Server.MapPath(string.Format("assets/schema2excel/{0}", ddlDatabase.SelectedItem));
        if (!Directory.Exists(folder))
        {
            Directory.CreateDirectory(folder);
        }

        foreach (DataRow dr in ds.Tables["tables"].Rows)
        {
            sql = string.Format(@"SELECT column_id, C.name, 
                                    --PF.CONSTRAINT_TYPE, 
                                    CASE PF.CONSTRAINT_TYPE WHEN 'PRIMARY KEY' THEN 'PK' WHEN 'FOREIGN KEY' THEN 'FK' ELSE '' END CONSTRAINT_TYPE,
                                    C.user_type_id, CONSTRAINT_NAME,
                                    --T.name [type_name], 
                                    CASE 
		                                WHEN T.name IN ('nvarchar', 'varchar', 'char') AND C.max_length <> -1 THEN T.name + ' (' + CONVERT(varchar, C.max_length) + ')' 
		                                WHEN T.name IN ('nvarchar', 'varchar', 'char') AND C.max_length = -1 THEN T.name + ' (max)' 
		                                ELSE T.name 
	                                END [type_name],
                                    C.max_length, C.is_nullable, is_identity
                                FROM {0}.sys.columns C
	                                LEFT JOIN (SELECT KCU.TABLE_NAME, COLUMN_NAME, CONSTRAINT_TYPE,KCU.CONSTRAINT_NAME
				                                FROM {0}.INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
					                                INNER JOIN {0}.INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU ON TC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
				                                WHERE KCU.TABLE_NAME = '{1}') AS PF ON C.name = PF.COLUMN_NAME
	                                INNER JOIN {0}.sys.types T ON C.user_type_id = T.user_type_id
                                WHERE [object_id] = {2}",
                                ddlDatabase.SelectedItem, dr["name"].ToString(), dr["object_id"].ToString());

            DataSet ds_columns = cls.GetDataSet(sql, "columns");
            int row = 0;
            string fieldformat = "";
            //string TableName = "";
            bool found = false;
            string viewName = dr["name"].ToString() + "_DetailView";

            using (ExcelPackage package = new ExcelPackage())
            {
                #region MasterLayout
                // add a new worksheet to the empty workbook
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("MasterLayout");

                worksheet.Cells["A1"].Value = "SystemName";
                worksheet.Cells["A2"].Value = "ThemeName";
                worksheet.Cells["A3"].Value = "DefaultLayout";
                worksheet.Cells["A4"].Value = "DefaultView";
                worksheet.Cells["A5"].Value = "Banner";
                worksheet.Cells["A6"].Value = "Authentication";
                worksheet.Cells["A7"].Value = "Header";
                worksheet.Cells["A8"].Value = "Footer";
                worksheet.Cells["A9"].Value = "Root Service URL";

                ////Add the headers
                worksheet.Cells["A10"].Value = "ElementType";
                worksheet.Cells["B10"].Value = "ElementId";
                worksheet.Cells["C10"].Value = "LV1";
                worksheet.Cells["D10"].Value = "LV2";
                worksheet.Cells["E10"].Value = "LV3";
                worksheet.Cells["F10"].Value = "LV4";
                worksheet.Cells["G10"].Value = "LV5";
                worksheet.Cells["H10"].Value = "Caption";
                worksheet.Cells["I10"].Value = "Url";
                worksheet.Cells["J10"].Value = "AppearanceRules";

                System.Drawing.Color colFromHex = System.Drawing.ColorTranslator.FromHtml("#B7DEE8");
                worksheet.Cells["A10:J10"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                worksheet.Cells["A10:J10"].Style.Fill.BackgroundColor.SetColor(colFromHex);

                worksheet.Cells["A1:J11"].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:J11"].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:J11"].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:J11"].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:J11"].Style.Font.Name = "Tahoma";
                worksheet.Cells["A1:J11"].Style.Font.Size = 10;
                #endregion
                #region ExcelConfiguration

                string folderXML = ConfigurationManager.AppSettings["HomePath"] + @"\Generator\XML";
                ExcelConfiguration conf = ExcelConfiguration.GetExcelConfigurationXml(folderXML);
               
                #endregion
                #region DetailViewLayout
                
                worksheet = package.Workbook.Worksheets.Add("DetailViewLayout");
                for (int i = 0; i < conf.ViewDetails.Count; i++)
                {
                    // TableName = conf.ViewDetails[i].ViewName;

                    if (viewName.ToLower().Equals(conf.ViewDetails[i].ViewName.ToLower()))
                     {
                            found = true;
                            worksheet =  CreateDetailView_XML(worksheet, row, fieldformat, colFromHex, i,conf);
                            i = conf.ViewDetails.Count;
                     }
                     
                   //worksheet = CreateDetailView(worksheet, dr, row, fieldformat, colFromHex, ds_columns);
                }
                if (!found) 
                {
                    worksheet = CreateDetailView_Table(worksheet, dr, row, fieldformat, colFromHex, ds_columns);
                }
                #endregion

                #region ListViewLayout
                worksheet = package.Workbook.Worksheets.Add("ListViewLayout");
                for (int i = 0; i < conf.ViewList.Count; i++)
                {
                    // TableName = conf.ViewDetails[i].ViewName;

                    if (viewName.ToLower().Equals(conf.ViewDetails[i].ViewName.ToLower()))
                    {
                        found = true;

                        worksheet = CreateListView_XML(worksheet, row, fieldformat, colFromHex, i, conf);
                        i = conf.ViewDetails.Count;
                    }

                    //worksheet = CreateDetailView(worksheet, dr, row, fieldformat, colFromHex, ds_columns);
                }
                if (!found)
                {
                    worksheet = CreateListView_Table(worksheet, dr, row, fieldformat, colFromHex, ds_columns);
                }
                
                #endregion

                #region LookupListViewLayout
                worksheet = package.Workbook.Worksheets.Add("LookupListViewLayout");
                worksheet.Cells["A1"].Value = "TableName";
                worksheet.Cells["B1"].Value = dr["name"].ToString();
                worksheet.Cells["A2"].Value = "ViewType";
                worksheet.Cells["B2"].Value = "LookupListView";
                worksheet.Cells["A3"].Value = "ViewName";
                worksheet.Cells["B3"].Value = dr["name"].ToString()+"_LookupListView";
                worksheet.Cells["A4"].Value = "Title";
                //worksheet.Cells["A5"].Value = "Root Service URL";
                worksheet.Cells["B5"].Value = "output/service";
                worksheet.Cells["A5"].Value = "Order By";
                worksheet.Cells["A6"].Value = "Filter";
                worksheet.Cells["B6"].Value = "TRUE";
                worksheet.Cells["A7"].Value = "PageSize";
                worksheet.Cells["B7"].Value = "20";

                //
                worksheet.Cells["A8"].Value = "ReturnField";
                worksheet.Cells["A9"].Value = "FilterView";
                worksheet.Cells["A10"].Value = "InputParameters";
                worksheet.Cells["A11"].Value = "FilterParameters";
                worksheet.Cells["A12"].Value = "MasterPage";
                worksheet.Cells["A13"].Value = "SqlSelect";
                worksheet.Cells["E13"].Value = "SqlSelectParameter";
                //

                ////Add the headers
                worksheet.Cells["A14"].Value = "Caption";
                worksheet.Cells["B14"].Value = "Column";
                worksheet.Cells["C14"].Value = "Format";
                worksheet.Cells["D14"].Value = "TextAlignment";
                worksheet.Cells["E14"].Value = "IsHideResize";
                worksheet.Cells["F14"].Value = "CustomStyle";

                colFromHex = System.Drawing.ColorTranslator.FromHtml("#FFFF00");
                worksheet.Cells["A14:F14"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                worksheet.Cells["A14:F14"].Style.Fill.BackgroundColor.SetColor(colFromHex);

                row = 15;
                foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
                {
                    fieldformat = "";
                    if (row == 15)
                    {
                        if (dr_columns["CONSTRAINT_TYPE"].ToString().ToLower() == "pk")
                            worksheet.Cells["B10"].Value = dr_columns["name"].ToString();
                    }

                    string[] typename = dr_columns["type_name"].ToString().Split(' ');

                    if (typename[0].ToString().ToString() == "date" || typename[0].ToString().ToString() == "datetime")
                    {
                        fieldformat = "d MMM yyyy";

                    }
                    else if (typename[0].ToString().ToString() == "int" || typename[0].ToString().ToString() == "decimal"
                        || typename[0].ToString().ToString() == "numeric" || typename[0].ToString().ToString() == "money")
                    {
                        fieldformat = "n2";
                    }

                    worksheet.Cells["A" + row.ToString()].Value = dr_columns["name"].ToString();
                    worksheet.Cells["B" + row.ToString()].Value = dr_columns["name"].ToString();
                    worksheet.Cells["C" + row.ToString()].Value = fieldformat;
                    row++;
                }

                row--;
                worksheet.Cells["A1:F" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:F" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:F" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:F" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:F" + row.ToString()].Style.Font.Name = "Tahoma";
                worksheet.Cells["A1:F" + row.ToString()].Style.Font.Size = 10;
                #endregion

                #region DataSpect
                worksheet = package.Workbook.Worksheets.Add("DATA_SPEC");

                worksheet.Cells["A1"].Value = "TableId";
                worksheet.Cells["B1"].Value = dr["object_id"].ToString();
                worksheet.Cells["A2"].Value = "TableName";
                worksheet.Cells["B2"].Value = dr["name"].ToString();
                worksheet.Cells["A3"].Value = "DefaultDisplay";
                worksheet.Cells["H1"].Value = "FormType";
                worksheet.Cells["I1"].Value = "Data";

                //worksheet.Cells["A1"].Style.Font.Bold = true;
                //worksheet.Cells["A2"].Style.Font.Bold = true;
                //worksheet.Cells["A3"].Style.Font.Bold = true;
                //worksheet.Cells["G1"].Style.Font.Bold = true;

                ////Add the headers
                worksheet.Cells["A5"].Value = "SystemId";
                worksheet.Cells["B5"].Value = "Field";
                worksheet.Cells["C5"].Value = "PK/FK";
                worksheet.Cells["D5"].Value = "FieldForeignKeyTableName";
                worksheet.Cells["E5"].Value = "Type";
                worksheet.Cells["F5"].Value = "DefaultValue";
                worksheet.Cells["G5"].Value = "ValueList";
                worksheet.Cells["H5"].Value = "Null";
                worksheet.Cells["I5"].Value = "RequireField";
                worksheet.Cells["J5"].Value = "RequireField (Error Msg)";
                worksheet.Cells["K5"].Value = "RegularExpression";
                worksheet.Cells["L5"].Value = "RegularExpression (Error Msg)";
                worksheet.Cells["M5"].Value = "UniqueValue";
                worksheet.Cells["N5"].Value = "UniqueValue (Error Msg)";
                worksheet.Cells["O5"].Value = "MinLength";
                worksheet.Cells["P5"].Value = "MinLength (Error Msg)";
                worksheet.Cells["Q5"].Value = "MaxLength";
                worksheet.Cells["R5"].Value = "MaxLength (Error Msg)";
                worksheet.Cells["S5"].Value = "RuleCriteria";
                worksheet.Cells["T5"].Value = "RuleCriteria (Error Msg)";
                worksheet.Cells["U5"].Value = "FileAttachment";
                worksheet.Cells["V5"].Value = "AppearanceRules";
                worksheet.Cells["W5"].Value = "AppearanceDisplay";
                worksheet.Cells["X5"].Value = "CalculationRules";

                colFromHex = System.Drawing.ColorTranslator.FromHtml("#B7DEE8");
                worksheet.Cells["A5:X5"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                worksheet.Cells["A5:X5"].Style.Fill.BackgroundColor.SetColor(colFromHex);

                row = 6;
                foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
                {

                    worksheet.Cells["A" + row.ToString()].Value = dr_columns["column_id"].ToString();
                    worksheet.Cells["B" + row.ToString()].Value = dr_columns["name"].ToString();
                    worksheet.Cells["C" + row.ToString()].Value = dr_columns["CONSTRAINT_TYPE"].ToString();
                    worksheet.Cells["E" + row.ToString()].Value = dr_columns["type_name"].ToString();
                    worksheet.Cells["G" + row.ToString()].Value = dr_columns["is_nullable"].ToString();


                    if (dr_columns["CONSTRAINT_TYPE"].ToString() == "FK")
                    {
                        worksheet.Cells["D" + row.ToString()].Value = dr_columns["CONSTRAINT_NAME"].ToString();
                    }

                    row++;
                }

                row--;
                worksheet.Cells["A1:X" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:X" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:X" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:X" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:X" + row.ToString()].Style.Font.Name = "Tahoma";
                worksheet.Cells["A1:X" + row.ToString()].Style.Font.Size = 10;
                #endregion

                //string fileName = string.Format("UITEMP_{0}_{1}.xlsx", dr["name"].ToString(), DateTime.Now.ToString("ddMMyyyy_HHmmss"));
                string fileName = string.Format("{0}.xlsx", dr["name"].ToString(), DateTime.Now.ToString("ddMMyyyy_HHmmss"));

                FileInfo fi = new FileInfo(folder + "/" + fileName);
                package.SaveAs(fi);
            }
        }

        #region zip
        string path = folder + "_UI.zip";
        ZipFolder(folder, path);

        Directory.Delete(folder, true);

        using (FileStream fs = File.OpenRead(path))
        {
            int length = (int)fs.Length;
            byte[] buffer;

            using (BinaryReader br = new BinaryReader(fs))
            {
                buffer = br.ReadBytes(length);
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", String.Format("attachment;filename={0}", Path.GetFileName(path)));
            Response.ContentType = "application/" + Path.GetExtension(path).Substring(1);
            Response.BinaryWrite(buffer);
            Response.End();
        }
        #endregion
    }

    private ExcelWorksheet CreateDetailView_Table(ExcelWorksheet worksheet, DataRow dr,
        int row, string fieldformat, System.Drawing.Color colFromHex, DataSet ds_columns)
    {
        worksheet.Cells["A1"].Value = "TableName";
        worksheet.Cells["B1"].Value = dr["name"].ToString();
        worksheet.Cells["A2"].Value = "ViewType";
        worksheet.Cells["B2"].Value = "DetailView";
        worksheet.Cells["A3"].Value = "ViewName";
        worksheet.Cells["B3"].Value = dr["name"].ToString() + "_DetailView";
        worksheet.Cells["A4"].Value = "Title";
        worksheet.Cells["A5"].Value = "Root Service URL";
        worksheet.Cells["B5"].Value = "output/service";
        //

        worksheet.Cells["A6"].Value = "InputParameters";
        worksheet.Cells["A7"].Value = "FilterParameters";
        //if(ds_columns.Tables[""]

        worksheet.Cells["A8"].Value = "MaterPage";
        worksheet.Cells["A13"].Value = "SqlSelect";
        worksheet.Cells["A14"].Value = "SqlInsert";
        worksheet.Cells["A15"].Value = "SqlUpdate";
        worksheet.Cells["A16"].Value = "SqlDelete";
        worksheet.Cells["E13"].Value = "SqlSelectParameter";
        worksheet.Cells["E14"].Value = "SqlInsertParameter";
        worksheet.Cells["E15"].Value = "SqlUpdateParameter";
        worksheet.Cells["E16"].Value = "SqlDeleteParameter";
        //

        worksheet.Cells["A9"].Value = "ButtonNew";
        worksheet.Cells["B9"].Value = "TRUE";
        worksheet.Cells["C9"].Value = "Caption";
        worksheet.Cells["D9"].Value = "เพิ่ม";
        worksheet.Cells["E9"].Value = "AppearanceRules";
        worksheet.Cells["F9"].Value = "TRUE";
        worksheet.Cells["A10"].Value = "ButtonSave";
        worksheet.Cells["B10"].Value = "TRUE";
        worksheet.Cells["C10"].Value = "Caption";
        worksheet.Cells["D10"].Value = "บันทึก";
        worksheet.Cells["E10"].Value = "AppearanceRules";
        worksheet.Cells["F10"].Value = "TRUE";
        worksheet.Cells["A11"].Value = "ButtonDelete";
        worksheet.Cells["B11"].Value = "TRUE";
        worksheet.Cells["C11"].Value = "Caption";
        worksheet.Cells["D11"].Value = "ลบ";
        worksheet.Cells["E11"].Value = "AppearanceRules";
        worksheet.Cells["F11"].Value = "TRUE";
        worksheet.Cells["A12"].Value = "ButtonSubmitWF";
        worksheet.Cells["B12"].Value = "TRUE";
        worksheet.Cells["C12"].Value = "Caption";
        worksheet.Cells["D12"].Value = "ส่งงาน";
        worksheet.Cells["E12"].Value = "AppearanceRules";
        worksheet.Cells["F12"].Value = "TRUE";

        ////Add the headers
        worksheet.Cells["A17"].Value = "ElementType";
        worksheet.Cells["B17"].Value = "ElementId";
        worksheet.Cells["C17"].Value = "Caption";
        worksheet.Cells["D17"].Value = "LV1";
        worksheet.Cells["E17"].Value = "LV2";
        worksheet.Cells["F17"].Value = "LV3";
        worksheet.Cells["G17"].Value = "LV4";
        worksheet.Cells["H17"].Value = "LV5";
        worksheet.Cells["I17"].Value = "ShowCaption";
        worksheet.Cells["J17"].Value = "Data";
        worksheet.Cells["K17"].Value = "PlaceHolder";
        worksheet.Cells["L17"].Value = "Width";
        worksheet.Cells["M17"].Value = "Height";
        worksheet.Cells["N17"].Value = "Format";
        worksheet.Cells["O17"].Value = "TextAlignment";
        worksheet.Cells["P17"].Value = "CustomStyle";

        colFromHex = System.Drawing.ColorTranslator.FromHtml("#FFFF00");
        worksheet.Cells["A17:P17"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
        worksheet.Cells["A17:P17"].Style.Fill.BackgroundColor.SetColor(colFromHex);

        row = 18;
        foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
        {
            fieldformat = "";
            if (row == 18)
            {
                if (dr_columns["CONSTRAINT_TYPE"].ToString().ToLower() == "pk")
                    worksheet.Cells["B6"].Value = dr_columns["name"].ToString();
            }
            else
            {
                worksheet.Cells["B" + row.ToString()].Value = dr_columns["CONSTRAINT_TYPE"].ToString();
            }

            string[] typename = dr_columns["type_name"].ToString().Split(' ');

            if (typename[0].ToString().ToString() == "date" || typename[0].ToString().ToString() == "datetime")
            {
                worksheet.Cells["A" + row.ToString()].Value = "datepicker";
                fieldformat = "d MMM yyyy";

            }
            else if (typename[0].ToString().ToString() == "int" || typename[0].ToString().ToString() == "decimal"
                || typename[0].ToString().ToString() == "numeric" || typename[0].ToString().ToString() == "money")
            {
                worksheet.Cells["A" + row.ToString()].Value = "number";
                fieldformat = "n2";
            }
            else if (typename[0].ToString().ToString() == "bit")
            {
                worksheet.Cells["A" + row.ToString()].Value = "checkbox";
            }
            else
            {
                worksheet.Cells["A" + row.ToString()].Value = "textbox";
            }

            worksheet.Cells["C" + row.ToString()].Value = dr_columns["name"].ToString();
            worksheet.Cells["D" + row.ToString()].Value = "Field12";
            worksheet.Cells["N" + row.ToString()].Value = fieldformat;
            worksheet.Cells["I" + row.ToString()].Value = "inline";
            worksheet.Cells["J" + row.ToString()].Value = string.Format("{0}.{1}", dr["name"].ToString(), dr_columns["name"].ToString());
            row++;
        }

        row--;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Font.Name = "Tahoma";
        worksheet.Cells["A1:P" + row.ToString()].Style.Font.Size = 10;

        return worksheet;
    }
    private ExcelWorksheet CreateListView_Table(ExcelWorksheet worksheet, DataRow dr,
        int row, string fieldformat, System.Drawing.Color colFromHex, DataSet ds_columns)
    {
        worksheet.Column(1).Width = 15;
        worksheet.Column(2).Width = 15;

        worksheet.Cells["A1"].Value = "TableName";
        worksheet.Cells["B1"].Value = dr["name"].ToString();
        worksheet.Cells["A2"].Value = "ViewType";
        worksheet.Cells["B2"].Value = "ListView";
        worksheet.Cells["A3"].Value = "ViewName";
        worksheet.Cells["B3"].Value = dr["name"].ToString() + "_ListView";
        worksheet.Cells["A4"].Value = "Title";
        worksheet.Cells["A5"].Value = "Root Service URL";
        worksheet.Cells["B5"].Value = "output/service";
        worksheet.Cells["A6"].Value = "Order By";

        worksheet.Cells["A7"].Value = "Filter";
        worksheet.Cells["B7"].Value = "TRUE";
        worksheet.Cells["A8"].Value = "PageSize";
        worksheet.Cells["B8"].Value = "20";
        //
        worksheet.Cells["A9"].Value = "EditView";
        worksheet.Cells["A10"].Value = "FilterView";
        worksheet.Cells["A11"].Value = "InputParameters";
        worksheet.Cells["A12"].Value = "FilterParameters";
        worksheet.Cells["A13"].Value = "MasterPage";
        //

        worksheet.Cells["A14"].Value = "ButtonNew";
        worksheet.Cells["B14"].Value = "TRUE";
        worksheet.Cells["C14"].Value = "Caption";
        worksheet.Cells["D14"].Value = "เพิ่ม";
        worksheet.Cells["E14"].Value = "AppearanceRules";
        worksheet.Cells["F14"].Value = "TRUE";
        worksheet.Cells["A15"].Value = "ButtonSave";
        worksheet.Cells["B15"].Value = "FALSE";
        worksheet.Cells["C15"].Value = "Caption";
        worksheet.Cells["D15"].Value = "บันทึก";
        worksheet.Cells["E15"].Value = "AppearanceRules";
        worksheet.Cells["F15"].Value = "FALSE";
        worksheet.Cells["A16"].Value = "ButtonDelete";
        worksheet.Cells["B16"].Value = "TRUE";
        worksheet.Cells["C16"].Value = "Caption";
        worksheet.Cells["D16"].Value = "ลบ";
        worksheet.Cells["E16"].Value = "AppearanceRules";
        worksheet.Cells["F16"].Value = "TRUE";
        //
        worksheet.Cells["A17"].Value = "SqlSelect";
        worksheet.Cells["A18"].Value = "SqlInsert";
        worksheet.Cells["A19"].Value = "SqlUpdate";
        worksheet.Cells["A20"].Value = "SqlDelete";
        worksheet.Cells["F17"].Value = "SqlSelectParameter";
        worksheet.Cells["F18"].Value = "SqlInsertParameter";
        worksheet.Cells["F19"].Value = "SqlUpdateParameter";
        worksheet.Cells["F20"].Value = "SqlDeleteParameter";
        //

        ////Add the headers
        worksheet.Cells["A21"].Value = "Caption";
        worksheet.Cells["B21"].Value = "Column";
        worksheet.Cells["C21"].Value = "Format";
        worksheet.Cells["D21"].Value = "TextAlignment";
        worksheet.Cells["E21"].Value = "IsHideResize";
        worksheet.Cells["F21"].Value = "CustomStyle";

        colFromHex = System.Drawing.ColorTranslator.FromHtml("#FFFF00");
        worksheet.Cells["A21:F21"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
        worksheet.Cells["A21:F21"].Style.Fill.BackgroundColor.SetColor(colFromHex);

        row = 22;

        foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
        {
            fieldformat = "";
            if (row == 22)
            {
                if (dr_columns["CONSTRAINT_TYPE"].ToString().ToLower() == "pk")
                    worksheet.Cells["B11"].Value = dr_columns["name"].ToString();
            }

            string[] typename = dr_columns["type_name"].ToString().Split(' ');

            if (typename[0].ToString().ToString() == "date" || typename[0].ToString().ToString() == "datetime")
            {
                fieldformat = "d MMM yyyy";

            }
            else if (typename[0].ToString().ToString() == "int" || typename[0].ToString().ToString() == "decimal"
                || typename[0].ToString().ToString() == "numeric" || typename[0].ToString().ToString() == "money")
            {
                fieldformat = "n2";
            }


            worksheet.Cells["A" + row.ToString()].Value = dr_columns["name"].ToString();
            worksheet.Cells["B" + row.ToString()].Value = dr_columns["name"].ToString();
            worksheet.Cells["C" + row.ToString()].Value = fieldformat;
            row++;
        }

        row--;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Font.Name = "Tahoma";
        worksheet.Cells["A1:F" + row.ToString()].Style.Font.Size = 10;

        return worksheet;
    }
  
    //=================//
    private ExcelWorksheet CreateDetailView_XML(ExcelWorksheet worksheet,
        int row, string fieldformat, System.Drawing.Color colFromHex,int i,ExcelConfiguration conf)
    {
        worksheet.Cells["A1"].Value = "TableName";
        worksheet.Cells["B1"].Value = conf.ViewDetails[i].TableName;
        worksheet.Cells["A2"].Value = "ViewType";
        worksheet.Cells["B2"].Value = conf.ViewDetails[i].ViewType;
        worksheet.Cells["A3"].Value = "ViewName";
        worksheet.Cells["B3"].Value = conf.ViewDetails[i].ViewName;
        worksheet.Cells["A4"].Value = "Title";
        worksheet.Cells["B4"].Value = conf.ViewDetails[i].ViewTitle;
        worksheet.Cells["A5"].Value = "Root Service URL";
        worksheet.Cells["B5"].Value = conf.ViewDetails[i].RootServiceUrl;
        //

        worksheet.Cells["A6"].Value = "InputParameters";
        worksheet.Cells["B6"].Value = conf.ViewDetails[i].InputParameters;
        worksheet.Cells["A7"].Value = "FilterParameters";
        worksheet.Cells["B6"].Value = conf.ViewDetails[i].FilterParameters;
        //if(ds_columns.Tables[""]

        worksheet.Cells["A8"].Value = "MaterPage";
        worksheet.Cells["B8"].Value = conf.ViewDetails[i].MasterPage;
        worksheet.Cells["A13"].Value = "SqlSelect";
        worksheet.Cells["B13"].Value = conf.ViewDetails[i].SQLSelect;
        worksheet.Cells["A14"].Value = "SqlInsert";
        worksheet.Cells["B14"].Value = conf.ViewDetails[i].SQLInsert;
        worksheet.Cells["A15"].Value = "SqlUpdate";
        worksheet.Cells["B15"].Value = conf.ViewDetails[i].SQLUpdate;
        worksheet.Cells["A16"].Value = "SqlDelete";
        worksheet.Cells["B16"].Value = conf.ViewDetails[i].SQLDelete;
        worksheet.Cells["E13"].Value = "SqlSelectParameter";
        worksheet.Cells["F13"].Value = conf.ViewDetails[i].SQLSelectParams;
        worksheet.Cells["E14"].Value = "SqlInsertParameter";
        worksheet.Cells["F14"].Value = conf.ViewDetails[i].SQLInsertParams;
        worksheet.Cells["E15"].Value = "SqlUpdateParameter";
        worksheet.Cells["F15"].Value = conf.ViewDetails[i].SQLUpdateParams;
        worksheet.Cells["E16"].Value = "SqlDeleteParameter";
        worksheet.Cells["E16"].Value = conf.ViewDetails[i].SQLDeleteParams;
        //

        worksheet.Cells["A9"].Value = "ButtonNew";
        worksheet.Cells["B9"].Value = conf.ViewDetails[i].IsHasNewButton;
        worksheet.Cells["C9"].Value = "Caption";
        worksheet.Cells["D9"].Value = "เพิ่ม";
        worksheet.Cells["E9"].Value = "AppearanceRules";
        worksheet.Cells["F9"].Value = "TRUE";
        worksheet.Cells["A10"].Value = "ButtonSave";
        worksheet.Cells["B10"].Value = conf.ViewDetails[i].IsHasSaveButton;
        worksheet.Cells["C10"].Value = "Caption";
        worksheet.Cells["D10"].Value = "บันทึก";
        worksheet.Cells["E10"].Value = "AppearanceRules";
        worksheet.Cells["F10"].Value = "TRUE";
        worksheet.Cells["A11"].Value = "ButtonDelete";
        worksheet.Cells["B11"].Value = conf.ViewDetails[i].IsHasDeleteButton;
        worksheet.Cells["C11"].Value = "Caption";
        worksheet.Cells["D11"].Value = "ลบ";
        worksheet.Cells["E11"].Value = "AppearanceRules";
        worksheet.Cells["F11"].Value = "TRUE";
        worksheet.Cells["A12"].Value = "ButtonSubmitWF";
        worksheet.Cells["B12"].Value = conf.ViewDetails[i].IsHasSubmitWf;
        worksheet.Cells["C12"].Value = "Caption";
        worksheet.Cells["D12"].Value = "ส่งงาน";
        worksheet.Cells["E12"].Value = "AppearanceRules";
        worksheet.Cells["F12"].Value = "TRUE";

        ////Add the headers
        worksheet.Cells["A17"].Value = "ElementType";
        worksheet.Cells["B17"].Value = "ElementId";
        worksheet.Cells["C17"].Value = "Caption";
        worksheet.Cells["D17"].Value = "LV1";
        worksheet.Cells["E17"].Value = "LV2";
        worksheet.Cells["F17"].Value = "LV3";
        worksheet.Cells["G17"].Value = "LV4";
        worksheet.Cells["H17"].Value = "LV5";
        worksheet.Cells["I17"].Value = "ShowCaption";
        worksheet.Cells["J17"].Value = "Data";
        worksheet.Cells["K17"].Value = "PlaceHolder";
        worksheet.Cells["L17"].Value = "Width";
        worksheet.Cells["M17"].Value = "Height";
        worksheet.Cells["N17"].Value = "Format";
        worksheet.Cells["O17"].Value = "TextAlignment";
        worksheet.Cells["P17"].Value = "CustomStyle";

        colFromHex = System.Drawing.ColorTranslator.FromHtml("#FFFF00");
        worksheet.Cells["A17:P17"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
        worksheet.Cells["A17:P17"].Style.Fill.BackgroundColor.SetColor(colFromHex);

        row = 18;

        for (int j = 0; j < conf.ViewDetails[i].Items.Count; j++)
        { 
        
           // fieldformat = "";
          
            worksheet.Cells["B" + row.ToString()].Value = conf.ViewDetails[i].Items[j].ElementId;

            worksheet.Cells["A" + row.ToString()].Value = conf.ViewDetails[i].Items[j].ElementType;


            worksheet.Cells["C" + row.ToString()].Value = conf.ViewDetails[i].Items[j].Caption;
            switch (conf.ViewDetails[i].Items[j].LevelValue)
            {
                case "1":
                    worksheet.Cells["D" + row.ToString()].Value = conf.ViewDetails[i].Items[j].LevelValue;
                break;
                case "2":
                worksheet.Cells["E" + row.ToString()].Value = conf.ViewDetails[i].Items[j].LevelValue;
                break;
                case "3":
                worksheet.Cells["F" + row.ToString()].Value = conf.ViewDetails[i].Items[j].LevelValue;
                break;
                case "4":
                worksheet.Cells["G" + row.ToString()].Value = conf.ViewDetails[i].Items[j].LevelValue;
                break;
                case "5":
                worksheet.Cells["H" + row.ToString()].Value = conf.ViewDetails[i].Items[j].LevelValue;
                break;
            }
            
            worksheet.Cells["N" + row.ToString()].Value = conf.ViewDetails[i].Items[j].Formats;
            worksheet.Cells["I" + row.ToString()].Value = conf.ViewDetails[i].Items[j].ShowCaption;
            worksheet.Cells["J" + row.ToString()].Value = conf.ViewDetails[i].Items[j].DataBinding;
            worksheet.Cells["K" + row.ToString()].Value = conf.ViewDetails[i].Items[j].PlaceHolderName;
            worksheet.Cells["L" + row.ToString()].Value = conf.ViewDetails[i].Items[j].Width;
            worksheet.Cells["M" + row.ToString()].Value = conf.ViewDetails[i].Items[j].Height;
            worksheet.Cells["O" + row.ToString()].Value = conf.ViewDetails[i].Items[j].TextAlignment;
            worksheet.Cells["P" + row.ToString()].Value = conf.ViewDetails[i].Items[j].CustomStyle;
            row++;
        }

        row--;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:P" + row.ToString()].Style.Font.Name = "Tahoma";
        worksheet.Cells["A1:P" + row.ToString()].Style.Font.Size = 10;

        return worksheet;
    }

    private ExcelWorksheet CreateListView_XML(ExcelWorksheet worksheet,
        int row, string fieldformat, System.Drawing.Color colFromHex, int i, ExcelConfiguration conf)
    {
        worksheet.Column(1).Width = 15;
        worksheet.Column(2).Width = 15;

        worksheet.Cells["A1"].Value = "TableName";
        worksheet.Cells["B1"].Value = conf.ViewList[i].TableName;
        worksheet.Cells["A2"].Value = "ViewType";
        worksheet.Cells["B2"].Value = "ListView";
        worksheet.Cells["A3"].Value = "ViewName";
        worksheet.Cells["B3"].Value = conf.ViewList[i].ViewName;
        worksheet.Cells["A4"].Value = "Title";
        worksheet.Cells["B4"].Value = conf.ViewList[i].ViewTitle;
        worksheet.Cells["A5"].Value = "Root Service URL";
        worksheet.Cells["B5"].Value = conf.ViewList[i].RootServiceUrl;
        worksheet.Cells["A6"].Value = "Order By";
        worksheet.Cells["B6"].Value = conf.ViewList[i].OrderBy;

        worksheet.Cells["A7"].Value = "Filter";
        worksheet.Cells["B7"].Value = conf.ViewList[i].IsHasFilter;
        worksheet.Cells["A8"].Value = "PageSize";
        worksheet.Cells["B8"].Value = conf.ViewList[i].PageSize;
        //
        worksheet.Cells["A9"].Value = "EditView";
        worksheet.Cells["A10"].Value = "FilterView";
        worksheet.Cells["A11"].Value = "InputParameters";
        worksheet.Cells["A12"].Value = "FilterParameters";
        worksheet.Cells["A13"].Value = "MasterPage";

        worksheet.Cells["B9"].Value = conf.ViewList[i].EditView;
        worksheet.Cells["B10"].Value = conf.ViewList[i].FilterView;
        worksheet.Cells["B11"].Value = conf.ViewList[i].InputParameters;
        worksheet.Cells["B12"].Value = conf.ViewList[i].FilterParameters;
        worksheet.Cells["B13"].Value = conf.ViewList[i].MasterPage;
        //

        worksheet.Cells["A14"].Value = "ButtonNew";
        worksheet.Cells["B14"].Value = conf.ViewList[i].IsHasNewButton;
        worksheet.Cells["C14"].Value = "Caption";
        worksheet.Cells["D14"].Value = "เพิ่ม";
        worksheet.Cells["E14"].Value = "AppearanceRules";
        worksheet.Cells["F14"].Value = "TRUE";
        worksheet.Cells["A15"].Value = "ButtonSave";
        worksheet.Cells["B15"].Value = conf.ViewList[i].IsHasSaveButton;
        worksheet.Cells["C15"].Value = "Caption";
        worksheet.Cells["D15"].Value = "บันทึก";
        worksheet.Cells["E15"].Value = "AppearanceRules";
        worksheet.Cells["F15"].Value = "FALSE";
        worksheet.Cells["A16"].Value = "ButtonDelete";
        worksheet.Cells["B16"].Value = conf.ViewList[i].IsHasDeleteButton;
        worksheet.Cells["C16"].Value = "Caption";
        worksheet.Cells["D16"].Value = "ลบ";
        worksheet.Cells["E16"].Value = "AppearanceRules";
        worksheet.Cells["F16"].Value = "TRUE";
        //
        worksheet.Cells["A17"].Value = "SqlSelect";
        worksheet.Cells["A18"].Value = conf.ViewList[i].SQLSelect;
        worksheet.Cells["A19"].Value = "SqlUpdate";
        worksheet.Cells["A20"].Value = conf.ViewList[i].SQLUpdate;
        worksheet.Cells["F17"].Value = "SqlSelectParameter";
        worksheet.Cells["F18"].Value = conf.ViewList[i].SQLInsertParams;
        worksheet.Cells["F19"].Value = "SqlUpdateParameter";
        worksheet.Cells["F20"].Value = conf.ViewList[i].SQLUpdateParams;
        //

        ////Add the headers
        worksheet.Cells["A21"].Value = "Caption";
        worksheet.Cells["B21"].Value = "Column";
        worksheet.Cells["C21"].Value = "Format";
        worksheet.Cells["D21"].Value = "TextAlignment";
        worksheet.Cells["E21"].Value = "IsHideResize";
        worksheet.Cells["F21"].Value = "CustomStyle";

        colFromHex = System.Drawing.ColorTranslator.FromHtml("#FFFF00");
        worksheet.Cells["A21:F21"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
        worksheet.Cells["A21:F21"].Style.Fill.BackgroundColor.SetColor(colFromHex);

        row = 22;
        for(int j=0;j<conf.ViewList[i].Items.Count;j++)
        {
        //foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
        //{


            worksheet.Cells["A" + row.ToString()].Value = conf.ViewList[i].Items[j].Caption;
            worksheet.Cells["B" + row.ToString()].Value = conf.ViewList[i].Items[j].DataBinding;
            worksheet.Cells["C" + row.ToString()].Value = conf.ViewList[i].Items[j].Formats;
            //worksheet.Cells["D" + row.ToString()].Value = conf.ViewList[i].Items[j].Formats;
            //worksheet.Cells["E" + row.ToString()].Value = conf.ViewList[i].Items[j].Formats;
            //worksheet.Cells["F" + row.ToString()].Value = conf.ViewList[i].Items[j].Formats;
            row++;
        }

        row--;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
        worksheet.Cells["A1:F" + row.ToString()].Style.Font.Name = "Tahoma";
        worksheet.Cells["A1:F" + row.ToString()].Style.Font.Size = 10;

        return worksheet;
    }
    protected void btnExportEntity_Click(object sender, EventArgs e)
    {
        if (ddlDatabase.SelectedIndex == 0) return;

        mainClass cls = new mainClass();
        string sql = string.Format("SELECT name, [object_id] FROM {0}.sys.tables WHERE name NOT LIKE '%_AUDIT'", ddlDatabase.SelectedItem);
        DataSet ds = cls.GetDataSet(sql, "tables");

        //string folder = Server.MapPath(string.Format("assets/entity/{0}_{1}", ddlDatabase.SelectedItem, DateTime.Now.ToString("ddMMyyyy_HHmmss")));
        string folder = Server.MapPath(string.Format("assets/entity/{0}", ddlDatabase.SelectedItem));
        if (!Directory.Exists(folder))
        {
            Directory.CreateDirectory(folder);
        }

        foreach (DataRow dr in ds.Tables["tables"].Rows)
        {
            using (ExcelPackage package = new ExcelPackage())
            {
                // add a new worksheet to the empty workbook
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add(dr["name"].ToString());

                worksheet.Cells["A1"].Value = "TableId";
                worksheet.Cells["B1"].Value = dr["object_id"].ToString();
                worksheet.Cells["A2"].Value = "TableName";
                worksheet.Cells["B2"].Value = dr["name"].ToString();
                worksheet.Cells["A3"].Value = "DefaultDisplay";
                worksheet.Cells["A4"].Value = "Context";

                ////Add the headers
                worksheet.Cells["A5"].Value = "Field";
                worksheet.Cells["B5"].Value = "PK/FK";
                worksheet.Cells["C5"].Value = "Type";
                worksheet.Cells["D5"].Value = "Length";
                worksheet.Cells["E5"].Value = "DefaultValue";
                worksheet.Cells["F5"].Value = "IsRequire";
                worksheet.Cells["G5"].Value = "IsUnique";
                worksheet.Cells["H5"].Value = "IsAI";
                worksheet.Cells["I5"].Value = "OnDelete";

                worksheet.Cells["A5:I5"].Style.Font.Bold = true;
                System.Drawing.Color colFromHex = System.Drawing.ColorTranslator.FromHtml("#B7DEE8");
                worksheet.Cells["A5:I5"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                worksheet.Cells["A5:I5"].Style.Fill.BackgroundColor.SetColor(colFromHex);

                sql = string.Format(@"SELECT column_id, C.name, 
                                    --PF.CONSTRAINT_TYPE, 
                                    CASE PF.CONSTRAINT_TYPE WHEN 'PRIMARY KEY' THEN 'PK' WHEN 'FOREIGN KEY' THEN 'FK' ELSE '' END CONSTRAINT_TYPE,
                                    CONSTRAINT_NAME,
                                    C.user_type_id, T.name [type_name], C.max_length, C.is_nullable, is_identity
                                FROM {0}.sys.columns C
	                                LEFT JOIN (SELECT KCU.TABLE_NAME, COLUMN_NAME, CONSTRAINT_TYPE, KCU.CONSTRAINT_NAME
				                                FROM {0}.INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
					                                INNER JOIN {0}.INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU ON TC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
				                                WHERE KCU.TABLE_NAME = '{1}') AS PF ON C.name = PF.COLUMN_NAME
	                                INNER JOIN {0}.sys.types T ON C.user_type_id = T.user_type_id
                                WHERE [object_id] = {2} AND C.name NOT LIKE '%_AUDIT'",
                                ddlDatabase.SelectedItem, dr["name"].ToString(), dr["object_id"].ToString());

                DataSet ds_columns = cls.GetDataSet(sql, "columns");

                int row = 6;
                foreach (DataRow dr_columns in ds_columns.Tables["columns"].Rows)
                {
                    worksheet.Cells["A" + row.ToString()].Value = dr_columns["name"].ToString();
                    //worksheet.Cells["B" + row.ToString()].Value = dr_columns["CONSTRAINT_TYPE"].ToString();

                    if (dr_columns["CONSTRAINT_TYPE"].ToString() == "FK")
                    {
                        worksheet.Cells["B" + row.ToString()].Value = string.Format("{0}[{1}.{2}]",
                            dr_columns["CONSTRAINT_TYPE"],
                            dr_columns["CONSTRAINT_NAME"].ToString().Replace("FK_", "").Replace(dr["name"].ToString() + "_", ""),
                            dr_columns["name"].ToString());
                    }
                    else
                    {
                        worksheet.Cells["B" + row.ToString()].Value = dr_columns["CONSTRAINT_TYPE"].ToString();
                    }

                    switch (dr_columns["type_name"].ToString())
                    {
                        case "varchar":
                        case "nvarchar":
                        case "char":
                        case "nchar":
                            worksheet.Cells["C" + row.ToString()].Value = "string";
                            break;
                        case "numeric":
                        case "bigint":
                            worksheet.Cells["C" + row.ToString()].Value = "int";
                            break;
                        case "datetime":
                            worksheet.Cells["C" + row.ToString()].Value = "DateTime";
                            break;
                        case "bit":
                            worksheet.Cells["C" + row.ToString()].Value = "bool";
                            break;
                        default:
                            worksheet.Cells["C" + row.ToString()].Value = dr_columns["type_name"].ToString();
                            break;
                    }

                    if (dr_columns["max_length"].ToString() != "-1")
                    {
                        worksheet.Cells["D" + row.ToString()].Value = dr_columns["max_length"].ToString();
                    }

                    if (dr_columns["is_nullable"].ToString() == "True")
                    {
                        worksheet.Cells["F" + row.ToString()].Value = "false";
                    }
                    else
                    {
                        worksheet.Cells["F" + row.ToString()].Value = "true";
                    }

                    if (dr_columns["is_identity"].ToString() == "True")
                    {
                        worksheet.Cells["H" + row.ToString()].Value = "true";
                    }
                    else
                    {
                        worksheet.Cells["H" + row.ToString()].Value = "false";
                    }

                    row++;
                }

                row--;
                worksheet.Cells["A1:I" + row.ToString()].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:I" + row.ToString()].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:I" + row.ToString()].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:I" + row.ToString()].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                worksheet.Cells["A1:I" + row.ToString()].Style.Font.Name = "Tahoma";
                worksheet.Cells["A1:I" + row.ToString()].Style.Font.Size = 10;

                string fileName = string.Format("{0}.xlsx", dr["name"].ToString());

                FileInfo fi = new FileInfo(folder + "/" + fileName);
                package.SaveAs(fi);

                //Write it back to the client
                //Response.Clear();
                //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                //Response.AddHeader("content-disposition", string.Format("attachment;  filename={0}", fileName));
                //Response.BinaryWrite(package.GetAsByteArray());
                //Response.End();
            }
        }

        #region zip
        string path = folder + "_ENTITY.zip";
        ZipFolder(folder, path);

        Directory.Delete(folder, true);

        using (FileStream fs = File.OpenRead(path))
        {
            int length = (int)fs.Length;
            byte[] buffer;

            using (BinaryReader br = new BinaryReader(fs))
            {
                buffer = br.ReadBytes(length);
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", String.Format("attachment;filename={0}", Path.GetFileName(path)));
            Response.ContentType = "application/" + Path.GetExtension(path).Substring(1);
            Response.BinaryWrite(buffer);
            Response.End();
        }
        #endregion
    }

    private void ZipFolder(string folderName, string destination)
    {
        FileStream fsOut = File.Create(destination);
        ZipOutputStream zipStream = new ZipOutputStream(fsOut);

        zipStream.SetLevel(3); //0-9, 9 being the highest level of compression

        //zipStream.Password = password;  // optional. Null is the same as not setting. Required if using AES.

        // This setting will strip the leading part of the folder path in the entries, to
        // make the entries relative to the starting folder.
        // To include the full path for each entry up to the drive root, assign folderOffset = 0.
        int folderOffset = folderName.Length + (folderName.EndsWith("\\") ? 0 : 1);

        CompressFolder(folderName, zipStream, folderOffset);

        zipStream.IsStreamOwner = true; // Makes the Close also Close the underlying stream
        zipStream.Close();
    }

    private void CompressFolder(string path, ZipOutputStream zipStream, int folderOffset)
    {

        string[] files = Directory.GetFiles(path);

        foreach (string filename in files)
        {

            FileInfo fi = new FileInfo(filename);

            string entryName = filename.Substring(folderOffset); // Makes the name in zip based on the folder
            entryName = ZipEntry.CleanName(entryName); // Removes drive from name and fixes slash direction
            ZipEntry newEntry = new ZipEntry(entryName);
            newEntry.DateTime = fi.LastWriteTime; // Note the zip format stores 2 second granularity

            // Specifying the AESKeySize triggers AES encryption. Allowable values are 0 (off), 128 or 256.
            // A password on the ZipOutputStream is required if using AES.
            //   newEntry.AESKeySize = 256;

            // To permit the zip to be unpacked by built-in extractor in WinXP and Server2003, WinZip 8, Java, and other older code,
            // you need to do one of the following: Specify UseZip64.Off, or set the Size.
            // If the file may be bigger than 4GB, or you do not need WinXP built-in compatibility, you do not need either,
            // but the zip will be in Zip64 format which not all utilities can understand.
            //   zipStream.UseZip64 = UseZip64.Off;
            newEntry.Size = fi.Length;

            zipStream.PutNextEntry(newEntry);

            // Zip the file in buffered chunks
            // the "using" will close the stream even if an exception occurs
            byte[] buffer = new byte[4096];
            using (FileStream streamReader = File.OpenRead(filename))
            {
                StreamUtils.Copy(streamReader, zipStream, buffer);
            }
            zipStream.CloseEntry();
        }
        string[] folders = Directory.GetDirectories(path);
        foreach (string folder in folders)
        {
            CompressFolder(folder, zipStream, folderOffset);
        }
    }

    //protected void ddlDatabase_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlDatabase.SelectedItem.Text != "")
    //    {
    //        (new mainClass()).LoadLookUpToDropDownList(ddlDatabase, "SELECT database_id, UPPER(name) name FROM sys.databases WHERE owner_sid <> 0x01 ORDER BY name", "กรุณาเลือก");
    //        ddlDatabase.SelectedIndex = 1;
    //    }
    //}
}