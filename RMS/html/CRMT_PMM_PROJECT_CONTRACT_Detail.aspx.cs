using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainCONTRACT_ID="-1";
	string key="CONTRACT_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_Detail.SelectParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_List.SelectParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_List.SelectParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List.SelectParameters.Clear();
        if (Request.QueryString["CONTRACT_ID"] != null && Request.QueryString["CONTRACT_ID"] != "-1")
        {
            inputMainCONTRACT_ID = Request.QueryString["CONTRACT_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_Detail.SelectParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, inputMainCONTRACT_ID);
        dsCRMT_PMM_PROJECT_CONTRACT_BORAD_List.SelectParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, inputMainCONTRACT_ID);
        dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_List.SelectParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, inputMainCONTRACT_ID);
        dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_List.SelectParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, inputMainCONTRACT_ID);
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

        //CRMT_PMM_PROJECT_CONTRACT_Detail
        //Title = "";
        DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_Detail.Select(DataSourceSelectArguments.Empty);
        if (dv.Count > 0)
        {
            DataRowView drv = dv[0];
            ctlMINISTRY_NAME.Value = drv["MINISTRY_NAME"].ToString();
            ctlGOVERNMENT_NAME.Value = drv["GOVERNMENT_NAME"].ToString();
            ctlCONTRACT_CODE.Value = drv["CONTRACT_CODE"].ToString();
            ctlCONTRACT_NAME.Value = drv["CONTRACT_NAME"].ToString();
            if (drv["CONTRACT_SIGN_DATE"] != null && drv["CONTRACT_SIGN_DATE"] != DBNull.Value)
                ctlCONTRACT_SIGN_DATE.Date = (DateTime)drv["CONTRACT_SIGN_DATE"];
            if (drv["CONTRACT_START_DATE"] != null && drv["CONTRACT_START_DATE"] != DBNull.Value)
                ctlCONTRACT_START_DATE.Date = (DateTime)drv["CONTRACT_START_DATE"];
            if (drv["CONTRACT_END_DATE"] != null && drv["CONTRACT_END_DATE"] != DBNull.Value)
                ctlCONTRACT_END_DATE.Date = (DateTime)drv["CONTRACT_END_DATE"];
            ctlCONTRACT_AMOUNT.Value = drv["CONTRACT_AMOUNT"].ToString();
            ctlCONTRACT_REMARK.Text = drv["CONTRACT_REMARK"].ToString();
            ctlPERIOD_DURATION_TOTAL.Value = drv["PERIOD_DURATION_TOTAL"].ToString();
            ctlPERIOD_DURATION_PERCENT.Value = drv["PERIOD_DURATION_PERCENT"].ToString();
            ctlPERIOD_NO.Value = drv["PERIOD_NO"].ToString();

            SetValidation();
            SetFormatting();
        }
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
		dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("MINISTRY_NAME", System.Data.DbType.String, ctlMINISTRY_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("GOVERNMENT_NAME", System.Data.DbType.String, ctlGOVERNMENT_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_CODE", System.Data.DbType.String, ctlCONTRACT_CODE.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_NAME", System.Data.DbType.String, ctlCONTRACT_NAME.Text);
if (ctlCONTRACT_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_SIGN_DATE", System.Data.DbType.String, ctlCONTRACT_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_SIGN_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add(p);
        }
if (ctlCONTRACT_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_START_DATE", System.Data.DbType.String, ctlCONTRACT_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add(p);
        }
if (ctlCONTRACT_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_END_DATE", System.Data.DbType.String, ctlCONTRACT_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_AMOUNT", System.Data.DbType.String, ctlCONTRACT_AMOUNT.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("CONTRACT_REMARK", System.Data.DbType.String, ctlCONTRACT_REMARK.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("PERIOD_DURATION_TOTAL", System.Data.DbType.String, ctlPERIOD_DURATION_TOTAL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("PERIOD_DURATION_PERCENT", System.Data.DbType.String, ctlPERIOD_DURATION_PERCENT.Text);
if (ctlPERIOD_NO.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("PERIOD_NO", System.Data.DbType.Int32, ctlPERIOD_NO.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.InsertParameters.Add("PERIOD_NO", System.Data.DbType.Int32, null);
int i = dsCRMT_PMM_PROJECT_CONTRACT_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("MINISTRY_NAME", System.Data.DbType.String, ctlMINISTRY_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("GOVERNMENT_NAME", System.Data.DbType.String, ctlGOVERNMENT_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_CODE", System.Data.DbType.String, ctlCONTRACT_CODE.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_NAME", System.Data.DbType.String, ctlCONTRACT_NAME.Text);
if (ctlCONTRACT_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_SIGN_DATE", System.Data.DbType.String, ctlCONTRACT_SIGN_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_SIGN_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add(p);
        }
if (ctlCONTRACT_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_START_DATE", System.Data.DbType.String, ctlCONTRACT_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add(p);
        }
if (ctlCONTRACT_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_END_DATE", System.Data.DbType.String, ctlCONTRACT_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "CONTRACT_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_AMOUNT", System.Data.DbType.String, ctlCONTRACT_AMOUNT.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_REMARK", System.Data.DbType.String, ctlCONTRACT_REMARK.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("PERIOD_DURATION_TOTAL", System.Data.DbType.String, ctlPERIOD_DURATION_TOTAL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("PERIOD_DURATION_PERCENT", System.Data.DbType.String, ctlPERIOD_DURATION_PERCENT.Text);
if (ctlPERIOD_NO.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("PERIOD_NO", System.Data.DbType.Int32, ctlPERIOD_NO.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("PERIOD_NO", System.Data.DbType.Int32, null);
		dsCRMT_PMM_PROJECT_CONTRACT_Detail.UpdateParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, inputMainCONTRACT_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_Detail.Update();


    }


}