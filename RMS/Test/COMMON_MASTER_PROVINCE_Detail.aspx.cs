using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class COMMON_MASTER_PROVINCE_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputPROVINCE_ID="-1";
	string inputMainPROVINCE_ID="-1";
	string key="PROVINCE_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid COMMON_MASTER_DISTRICT_List 
dsCOMMON_MASTER_DISTRICT_List.SelectParameters.Clear();
        if (Request.QueryString["PROVINCE_ID"] != null && Request.QueryString["PROVINCE_ID"] != "-1")
        {
            inputPROVINCE_ID = Request.QueryString["PROVINCE_ID"];
        }
dsCOMMON_MASTER_DISTRICT_List.SelectParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, inputPROVINCE_ID);
dsCOMMON_MASTER_PROVINCE_Detail.SelectParameters.Clear();
        if (Request.QueryString["PROVINCE_ID"] != null && Request.QueryString["PROVINCE_ID"] != "-1")
        {
            inputMainPROVINCE_ID = Request.QueryString["PROVINCE_ID"];
        }
		dsCOMMON_MASTER_PROVINCE_Detail.SelectParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, inputMainPROVINCE_ID);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString[key] != null && Request.QueryString[key] != "-1")
        {
            mode = "e";
        }
        if (!IsPostBack)
        {
            if (mode == "e")
                PopulateEditData();
            else if (mode == "n")
                PopulateNewData();
            
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (mode == "e")
            Update();
        else if (mode == "n")
            Insert();

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {

    }

    void PopulateEditData()
    {
        //

        //COMMON_MASTER_PROVINCE_Detail
        Title = "PROVINCE";
        DataView dv = (DataView)dsCOMMON_MASTER_PROVINCE_Detail.Select(DataSourceSelectArguments.Empty);
        DataRowView drv = dv[0];
        ctlPROVINCE_CODE.Value = drv["PROVINCE_CODE"].ToString();
        ctlPROVINCE_NAME.Value = drv["PROVINCE_NAME"].ToString();
        ctlREGION_ID.Value = drv["REGION_ID"].ToString();
        if (drv["UPDATE_DATE"] != null && drv["UPDATE_DATE"] != DBNull.Value)
            ctlUPDATE_DATE.Date = (DateTime)drv["UPDATE_DATE"];
        ctlOptimisticLockField.Value = drv["OptimisticLockField"].ToString();

        SetValidation();
        SetFormatting();
    }

    void PopulateNewData()
    {
        //

        SetValidation();
        SetFormatting();
    }

    void SetValidation()
    {
        //
		ctlPROVINCE_CODE.ValidationSettings.RequiredField.IsRequired = true;
		ctlPROVINCE_CODE.ValidationSettings.RequiredField.ErrorText = "";
		ctlPROVINCE_CODE.MaxLength = 2;
		ctlPROVINCE_NAME.ValidationSettings.RequiredField.IsRequired = true;
		ctlPROVINCE_NAME.ValidationSettings.RequiredField.ErrorText = "";


    }

    void SetFormatting()
    {
        //
		ctlPROVINCE_CODE.HorizontalAlign = HorizontalAlign.Right;
		ctlPROVINCE_CODE.DisplayFormatString = "0-0";
		ctlOptimisticLockField.HorizontalAlign = HorizontalAlign.Right;
		ctlOptimisticLockField.DisplayFormatString = "N2";


    }

    void Insert()
    {
        //
        dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Clear();
        dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add("PROVINCE_CODE", System.Data.DbType.String, ctlPROVINCE_CODE.Text);
        dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add("PROVINCE_NAME", System.Data.DbType.String, ctlPROVINCE_NAME.Text);
        if (ctlREGION_ID.Value != null)
            dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add("REGION_ID", System.Data.DbType.Int32, ctlREGION_ID.Value.ToString());
        else
            dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add("REGION_ID", System.Data.DbType.Int32, null);
        if (ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01")
        {
            dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add("UPDATE_DATE", System.Data.DbType.String, ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "UPDATE_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add(p);
        }
        dsCOMMON_MASTER_PROVINCE_Detail.InsertParameters.Add("OptimisticLockField", System.Data.DbType.Int32, ctlOptimisticLockField.Text);
        int i = dsCOMMON_MASTER_PROVINCE_Detail.Insert();


    }

    void Update()
    {
        //
		dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Clear();
dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("PROVINCE_CODE", System.Data.DbType.String, ctlPROVINCE_CODE.Text);
dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("PROVINCE_NAME", System.Data.DbType.String, ctlPROVINCE_NAME.Text);
if (ctlREGION_ID.Value != null)
            dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("REGION_ID", System.Data.DbType.Int32, ctlREGION_ID.Value.ToString());
        else
            dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("REGION_ID", System.Data.DbType.Int32, null);
if (ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("UPDATE_DATE", System.Data.DbType.String, ctlUPDATE_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "UPDATE_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add(p);
        }
dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("OptimisticLockField", System.Data.DbType.Int32, ctlOptimisticLockField.Text);
		dsCOMMON_MASTER_PROVINCE_Detail.UpdateParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, inputMainPROVINCE_ID);
int i = dsCOMMON_MASTER_PROVINCE_Detail.Update();


    }


}