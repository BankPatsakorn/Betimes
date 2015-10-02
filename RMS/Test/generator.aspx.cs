using BTeFormGenerator.ExcelConfiguration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_generator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        //list inline
        ExcelConfiguration xlsConf = new ExcelConfiguration();
        //ExcelConfiguration xlsConf = ExcelConfiguration.GetExcelConfigurationXls("c:\\pj.xls");
        
        var tb1 = new ExcelTableSpec();
        tb1.TableName = "COMMON_MASTER_REGION";
        tb1.DefaultDisplay = "REGION_NAME_THA";
        tb1.Fields.Add(new ExcelFieldSpec() { FieldName = "REGION_ID", FieldType = ExcelEntityFieldType.Number, FieldPrimaryKey = true, FieldTypeString="Int32" });
        tb1.Fields.Add(new ExcelFieldSpec() { FieldName = "REGION_NAME_THA", FieldType = ExcelEntityFieldType.String });
        tb1.Fields.Add(new ExcelFieldSpec() { FieldName = "REGION_NAME_ENG", FieldType = ExcelEntityFieldType.String });
        tb1.Fields.Add(new ExcelFieldSpec() { FieldName = "UPDATE_DATE", FieldType = ExcelEntityFieldType.DateTime });

        var tb2 = new ExcelTableSpec();
        tb2.TableName = "COMMON_MASTER_PROVINCE";
        tb2.DefaultDisplay = "PROVINCE_NAME";//
        tb2.Fields.Add(new ExcelFieldSpec() { FieldName = "PROVINCE_ID", FieldType = ExcelEntityFieldType.Number, FieldPrimaryKey = true, FieldTypeString="Int32" });
        tb2.Fields.Add(new ExcelFieldSpec() { FieldName = "REGION_ID", FieldType = ExcelEntityFieldType.Number, FieldForeignKey = true, FieldForeignKeyTableName = "COMMON_MASTER_REGION" });
        tb2.Fields.Add(new ExcelFieldSpec() { FieldName = "PROVINCE_CODE", FieldType = ExcelEntityFieldType.String, IsRequireField = true, MaxLength = 2, MinLength = 2 });
        tb2.Fields.Add(new ExcelFieldSpec() { FieldName = "PROVINCE_NAME", FieldType = ExcelEntityFieldType.String, IsRequireField = true });
        tb2.Fields.Add(new ExcelFieldSpec() { FieldName = "UPDATE_DATE", FieldType = ExcelEntityFieldType.DateTime });
        tb2.Fields.Add(new ExcelFieldSpec() { FieldName = "OptimisticLockField", FieldType = ExcelEntityFieldType.Number });

        var tb3 = new ExcelTableSpec();
        tb3.TableName = "COMMON_MASTER_DISTRICT";
        tb3.DefaultDisplay = "DISTRICT_NAME";//
        tb3.Fields.Add(new ExcelFieldSpec() { FieldName = "DISTRICT_ID", FieldType = ExcelEntityFieldType.Number, FieldPrimaryKey = true, FieldTypeString = "Int32" });
        tb3.Fields.Add(new ExcelFieldSpec() { FieldName = "PROVINCE_ID", FieldType = ExcelEntityFieldType.Number, FieldForeignKey = true, FieldForeignKeyTableName = "COMMON_MASTER_PROVINCE" });
        tb3.Fields.Add(new ExcelFieldSpec() { FieldName = "DISTRICT_CODE", FieldType = ExcelEntityFieldType.String, IsRequireField = true, MaxLength = 100, MinLength = 20 });
        tb3.Fields.Add(new ExcelFieldSpec() { FieldName = "DISTRICT_NAME", FieldType = ExcelEntityFieldType.String, IsRequireField = true });
        tb3.Fields.Add(new ExcelFieldSpec() { FieldName = "UPDATE_DATE", FieldType = ExcelEntityFieldType.DateTime });
        tb3.Fields.Add(new ExcelFieldSpec() { FieldName = "OptimisticLockField", FieldType = ExcelEntityFieldType.Number });

        var l1 = new ExcelUIViewList();
        l1.ViewName = "COMMON_MASTER_PROVINCE_List2";
        l1.ViewTitle = "PROVINCE";
        l1.ViewType = "ListView";
        l1.TableName = "COMMON_MASTER_PROVINCE,COMMON_MASTER_REGION";
        l1.EditView = "COMMON_MASTER_PROVINCE_Detail";
        l1.InputParameters = "";
        l1.IsHasNewButton = true;
        l1.IsHasSaveButton = true;
        l1.IsHasDeleteButton = true;
        l1.NewButtonCaption = "New";
        l1.SaveButtonCaption = "Save";
        l1.DeleteButtonCaption = "Delete";
        l1.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_PROVINCE.PROVINCE_CODE", Caption = "PROVINCE CODE", RowNumber = 1, TextAlignment = "left" });
        l1.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_PROVINCE.PROVINCE_NAME", Caption = "PROVINCE NAME", RowNumber = 2, TextAlignment = "left" });
        l1.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_REGION.REGION_ID", Caption = "REGION ID", RowNumber = 3, TextAlignment = "left" });
        l1.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_REGION.REGION_NAME_THA", Caption = "REGION ID", RowNumber = 4, TextAlignment = "left" });

        var l2 = new ExcelUIViewList();
        l2.ViewName = "COMMON_MASTER_DISTRICT_List";
        l2.ViewTitle = "DISTRICT";
        l2.ViewType = "ListView";
        l2.TableName = "COMMON_MASTER_DISTRICT,COMMON_MASTER_PROVINCE";
        l2.EditView = "COMMON_MASTER_DISTRICT_Detail";
        l2.InputParameters = "COMMON_MASTER_DISTRICT.PROVINCE_ID";
        l2.IsHasNewButton = true;
        l2.IsHasSaveButton = true;
        l2.IsHasDeleteButton = true;
        l2.NewButtonCaption = "New";
        l2.SaveButtonCaption = "Save";
        l2.DeleteButtonCaption = "Delete";
        l2.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_DISTRICT.DISTRICT_CODE", Caption = "code", RowNumber = 1, TextAlignment = "left" });
        l2.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_DISTRICT.DISTRICT_NAME", Caption = "name", RowNumber = 2, TextAlignment = "left" });
        l2.Items.Add(new ExcelUIViewListItem() { DataBinding = "COMMON_MASTER_DISTRICT.UPDATE_DATE", Caption = "updatetime", RowNumber = 3, TextAlignment = "left" });


        var d1 = new ExcelUIViewDetail();
        d1.ViewName = "COMMON_MASTER_PROVINCE_Detail";
        d1.ViewTitle = "PROVINCE";
        d1.TableName = "COMMON_MASTER_PROVINCE,COMMON_MASTER_REGION";
        d1.IsHasNewButton = true;
        d1.IsHasSaveButton = true;
        d1.IsHasDeleteButton = true;
        d1.InputParameters = "COMMON_MASTER_PROVINCE.PROVINCE_ID";
        d1.NewButtonCaption = "New";
        d1.SaveButtonCaption = "Save";
        d1.DeleteButtonCaption = "Delete";
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 1, ElementType = "tab", ElementId="tabMain1", Level=1, LevelValue="tab12"});
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 2, ElementType = "tabpage", ElementId="tab1", Level = 2, LevelValue = "tabpage" , Caption="Tab1", CustomStyle="active"});
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 3, ElementType = "box", Level = 3, LevelValue = "box12", Caption="Box1" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 4, ElementType = "textbox", Level=3, LevelValue="field12",
            DataBinding = "COMMON_MASTER_PROVINCE.PROVINCE_CODE", Caption = "PROVINCE CODE", Formats="0-0", TextAlignment="right" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 5, ElementType = "textbox", Level=3, LevelValue="field12",
            DataBinding = "COMMON_MASTER_PROVINCE.PROVINCE_NAME", Caption = "PROVINCE NAME"});
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 6, ElementType = "dropdown", Level=3, LevelValue="field12",
                                                   DataBinding = "COMMON_MASTER_PROVINCE.REGION_ID",
                                                   Caption = "REGION", Width=200
        });
        d1.Items.Add(new ExcelUIViewDetailItem()
        {
            RowNumber = 7,
            ElementType = "datepicker",
            Level = 3,
            LevelValue = "field12",
            DataBinding = "COMMON_MASTER_PROVINCE.UPDATE_DATE",
            Caption = "UPDATE DATE",
            Width = 200
        });
        d1.Items.Add(new ExcelUIViewDetailItem()
        {
            RowNumber = 8,
            ElementType = "textint",
            Level = 3,
            LevelValue = "field12",
            DataBinding = "COMMON_MASTER_PROVINCE.OptimisticLockField",
            Caption = "OptimisticLockField",
            Width=200,
            Formats = "N2",
            TextAlignment = "right"
        });
        d1.Items.Add(new ExcelUIViewDetailItem()
        {
            RowNumber = 9,
            ElementType = "listview",
            Level = 3,
            LevelValue = "COMMON_MASTER_DISTRICT_List",
            Caption = "DISTRICT"
        });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 7, ElementType = "endbox", Level = 3, LevelValue = "endbox" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 8, ElementType = "endtabpage", Level = 2, LevelValue = "endtabpage" });

        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 9, ElementType = "tabpage", ElementId="tab2", Level = 2, LevelValue = "tabpage", Caption="Tab2" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 10, ElementType = "box", Level = 3, LevelValue = "box12", Caption="Box2" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 11, ElementType = "button", Level = 3, LevelValue = "field12", Caption="button xxx" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 12, ElementType = "endbox", Level = 3, LevelValue = "endbox" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 13, ElementType = "endtabpage", Level = 2, LevelValue = "endtabpage" });
        d1.Items.Add(new ExcelUIViewDetailItem() { RowNumber = 14, ElementType = "endtab", Level = 1, LevelValue = "endtab" });


        var d2 = new ExcelUIViewDetail();
        d2.ViewName = "COMMON_MASTER_DISTRICT_Detail";
        d2.ViewTitle = "DISTRICT_Detail";
        d2.InputParameters = "COMMON_MASTER_DISTRICT.DISTRICT_ID,COMMON_MASTER_DISTRICT.PROVINCE_ID";
        d2.TableName = "COMMON_MASTER_DISTRICT";
        d2.IsHasNewButton = true;
        d2.IsHasSaveButton = true;
        d2.IsHasDeleteButton = true;
        d2.NewButtonCaption = "New";
        d2.SaveButtonCaption = "Save";
        d2.DeleteButtonCaption = "Delete";
        d2.Items.Add(new ExcelUIViewDetailItem()
        {
            RowNumber = 4,
            ElementType = "textbox",
            Level = 3,
            LevelValue = "field12",
            DataBinding = "COMMON_MASTER_DISTRICT.DISTRICT_CODE",
            Caption = "DISTRICT CODE",
            Formats = "00",
            TextAlignment = "right"
        });
        d2.Items.Add(new ExcelUIViewDetailItem()
        {
            RowNumber = 5,
            ElementType = "textbox",
            Level = 3,
            LevelValue = "field12",
            DataBinding = "COMMON_MASTER_DISTRICT.DISTRICT_NAME",
            Caption = "DISTRICT NAME"
        });

        xlsConf.Tables.Add(tb1);
        xlsConf.Tables.Add(tb2);
        xlsConf.Tables.Add(tb3);
        xlsConf.ViewList.Add(l1);
        xlsConf.ViewList.Add(l2);
        xlsConf.ViewDetails.Add(d1);
        xlsConf.ViewDetails.Add(d2);


        FormGenerator gen = new FormGenerator();
        gen.GenerateDetailView(xlsConf, "COMMON_MASTER_PROVINCE_Detail",
            @"C:\Users\JOJOJS\Documents\Visual Studio 2012\WebSites\eForm20\Test");
        gen.GenerateDetailView(xlsConf, "COMMON_MASTER_DISTRICT_Detail",
            @"C:\Users\JOJOJS\Documents\Visual Studio 2012\WebSites\eForm20\Test");
        if (gen.GenerateListView(xlsConf, "COMMON_MASTER_PROVINCE_List2",
            @"C:\Users\JOJOJS\Documents\Visual Studio 2012\WebSites\eForm20\Test"))
        {
            Response.Redirect("COMMON_MASTER_PROVINCE_List2.aspx");
        }

        //gen.GenerateDetailView(xlsConf, "COMMON_MASTER_PROVINCE_Detail",
        //    @"C:\Users\JOJOJS\Documents\Visual Studio 2012\WebSites\eForm20\Test");
    }

  
}