using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_V_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainCONTRACT_V_ID="-1";
	string key="CONTRACT_V_ID";
    

    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.SelectParameters.Clear();
        if (Request.QueryString["CONTRACT_V_ID"] != null && Request.QueryString["CONTRACT_V_ID"] != "-1")
        {
            inputMainCONTRACT_V_ID = Request.QueryString["CONTRACT_V_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.SelectParameters.Add("CONTRACT_V_ID", System.Data.DbType.Int32, inputMainCONTRACT_V_ID);

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

//CRMT_PMM_PROJECT_CONTRACT_V_Detail
Title = ""; 
DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlVENDOR_ID.Value = drv["VENDOR_ID"].ToString();
ctlCONTRACT_V_CODE.Value = drv["CONTRACT_V_CODE"].ToString();
ctlCONTRACT_V_NAME.Value = drv["CONTRACT_V_NAME"].ToString();
if (drv["CONTRACT_V_SIGN_DATE"] != null && drv["CONTRACT_V_SIGN_DATE"] != DBNull.Value)
            ctlCONTRACT_V_SIGN_DATE.Date = (DateTime)drv["CONTRACT_V_SIGN_DATE"];
if (drv["CONTRACT_V_START_DATE"] != null && drv["CONTRACT_V_START_DATE"] != DBNull.Value)
            ctlCONTRACT_V_START_DATE.Date = (DateTime)drv["CONTRACT_V_START_DATE"];
if (drv["CONTRACT_V_END_DATE"] != null && drv["CONTRACT_V_END_DATE"] != DBNull.Value)
            ctlCONTRACT_V_END_DATE.Date = (DateTime)drv["CONTRACT_V_END_DATE"];
ctlCONTRACT_V_AMOUNT.Value = drv["CONTRACT_V_AMOUNT"].ToString();
ctlCONTRACT_V_REMARK.Html = drv["CONTRACT_V_REMARK"].ToString();
ctlPERIOD_DURATION_TOTAL.Value = drv["PERIOD_DURATION_TOTAL"].ToString();
ctlPERIOD_DURATION_PERCENT.Value = drv["PERIOD_DURATION_PERCENT"].ToString();
ctlPERIOD_DET_NO.Value = drv["PERIOD_DET_NO"].ToString();

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


    }

    void SetFormatting()
    {
        //


    }

    void Insert()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Clear();
if (ctlVENDOR_ID.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("VENDOR_ID", System.Data.DbType.Int32, ctlVENDOR_ID.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("VENDOR_ID", System.Data.DbType.Int32, null);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_CODE", System.Data.DbType.String, ctlCONTRACT_V_CODE.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_NAME", System.Data.DbType.String, ctlCONTRACT_V_NAME.Text);
if (ctlCONTRACT_V_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_SIGN_DATE", System.Data.DbType.String, ctlCONTRACT_V_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_V_SIGN_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add(p);
        }
if (ctlCONTRACT_V_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_START_DATE", System.Data.DbType.String, ctlCONTRACT_V_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_V_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add(p);
        }
if (ctlCONTRACT_V_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_END_DATE", System.Data.DbType.String, ctlCONTRACT_V_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_V_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_AMOUNT", System.Data.DbType.String, ctlCONTRACT_V_AMOUNT.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("CONTRACT_V_REMARK", System.Data.DbType.String, ctlCONTRACT_V_REMARK.Html);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("PERIOD_DURATION_TOTAL", System.Data.DbType.String, ctlPERIOD_DURATION_TOTAL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("PERIOD_DURATION_PERCENT", System.Data.DbType.String, ctlPERIOD_DURATION_PERCENT.Text);
if (ctlPERIOD_DET_NO.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("PERIOD_DET_NO", System.Data.DbType.Int32, ctlPERIOD_DET_NO.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.InsertParameters.Add("PERIOD_DET_NO", System.Data.DbType.Int32, null);
int i = dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Clear();
if (ctlVENDOR_ID.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("VENDOR_ID", System.Data.DbType.Int32, ctlVENDOR_ID.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("VENDOR_ID", System.Data.DbType.Int32, null);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_CODE", System.Data.DbType.String, ctlCONTRACT_V_CODE.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_NAME", System.Data.DbType.String, ctlCONTRACT_V_NAME.Text);
if (ctlCONTRACT_V_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_SIGN_DATE", System.Data.DbType.String, ctlCONTRACT_V_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_V_SIGN_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add(p);
        }
if (ctlCONTRACT_V_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_START_DATE", System.Data.DbType.String, ctlCONTRACT_V_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_V_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add(p);
        }
if (ctlCONTRACT_V_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_END_DATE", System.Data.DbType.String, ctlCONTRACT_V_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_V_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_AMOUNT", System.Data.DbType.String, ctlCONTRACT_V_AMOUNT.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_REMARK", System.Data.DbType.String, ctlCONTRACT_V_REMARK.Html);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("PERIOD_DURATION_TOTAL", System.Data.DbType.String, ctlPERIOD_DURATION_TOTAL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("PERIOD_DURATION_PERCENT", System.Data.DbType.String, ctlPERIOD_DURATION_PERCENT.Text);
if (ctlPERIOD_DET_NO.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("PERIOD_DET_NO", System.Data.DbType.Int32, ctlPERIOD_DET_NO.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("PERIOD_DET_NO", System.Data.DbType.Int32, null);
		dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.UpdateParameters.Add("CONTRACT_V_ID", System.Data.DbType.Int32, inputMainCONTRACT_V_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_V_Detail.Update();


    }


}