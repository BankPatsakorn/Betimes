using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainPERIOD_ID="-1";
	string key="PERIOD_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.SelectParameters.Clear();
        if (Request.QueryString["PERIOD_ID"] != null && Request.QueryString["PERIOD_ID"] != "-1")
        {
            inputMainPERIOD_ID = Request.QueryString["PERIOD_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.SelectParameters.Add("PERIOD_ID", System.Data.DbType.Int32, inputMainPERIOD_ID);

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

//CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail
Title = ""; 
DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlPERIOD_NO.Value = drv["PERIOD_NO"].ToString();
ctlPERIOD_DESC.Value = drv["PERIOD_DESC"].ToString();
if (drv["PERIOD_DateTime"] != null && drv["PERIOD_DateTime"] != DBNull.Value)
            ctlPERIOD_DateTime.Date = (DateTime)drv["PERIOD_DateTime"];
ctlPERIOD_AMOUNT.Value = drv["PERIOD_AMOUNT"].ToString();
ctlPERIOD_PERCENT.Value = drv["PERIOD_PERCENT"].ToString();
if (drv["PERIOD_START_DateTime"] != null && drv["PERIOD_START_DateTime"] != DBNull.Value)
            ctlPERIOD_START_DateTime.Date = (DateTime)drv["PERIOD_START_DateTime"];
if (drv["PERIOD_END_DateTime"] != null && drv["PERIOD_END_DateTime"] != DBNull.Value)
            ctlPERIOD_END_DateTime.Date = (DateTime)drv["PERIOD_END_DateTime"];
ctlPERIOD_DURATION_DateTime.Value = drv["PERIOD_DURATION_DateTime"].ToString();
if (drv["PERIOD_DELIVERY_DateTime"] != null && drv["PERIOD_DELIVERY_DateTime"] != DBNull.Value)
            ctlPERIOD_DELIVERY_DateTime.Date = (DateTime)drv["PERIOD_DELIVERY_DateTime"];
if (drv["PERIOD_BORAD_DateTime"] != null && drv["PERIOD_BORAD_DateTime"] != DBNull.Value)
            ctlPERIOD_BORAD_DateTime.Date = (DateTime)drv["PERIOD_BORAD_DateTime"];
ctlPERIOD_STATUS.Value = drv["PERIOD_STATUS"].ToString();

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
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_NO", System.Data.DbType.String, ctlPERIOD_NO.Text);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_DESC", System.Data.DbType.String, ctlPERIOD_DESC.Text);
if (ctlPERIOD_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_DateTime", System.Data.DbType.String, ctlPERIOD_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_AMOUNT", System.Data.DbType.String, ctlPERIOD_AMOUNT.Text);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_PERCENT", System.Data.DbType.String, ctlPERIOD_PERCENT.Text);
if (ctlPERIOD_START_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_START_DateTime", System.Data.DbType.String, ctlPERIOD_START_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_START_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add(p);
        }
if (ctlPERIOD_END_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_END_DateTime", System.Data.DbType.String, ctlPERIOD_END_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_END_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_DURATION_DateTime", System.Data.DbType.String, ctlPERIOD_DURATION_DateTime.Text);
if (ctlPERIOD_DELIVERY_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_DELIVERY_DateTime", System.Data.DbType.String, ctlPERIOD_DELIVERY_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_DELIVERY_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add(p);
        }
if (ctlPERIOD_BORAD_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_BORAD_DateTime", System.Data.DbType.String, ctlPERIOD_BORAD_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_BORAD_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add(p);
        }
if (ctlPERIOD_STATUS.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_STATUS", System.Data.DbType.Int32, ctlPERIOD_STATUS.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.InsertParameters.Add("PERIOD_STATUS", System.Data.DbType.Int32, null);
int i = dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_NO", System.Data.DbType.String, ctlPERIOD_NO.Text);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_DESC", System.Data.DbType.String, ctlPERIOD_DESC.Text);
if (ctlPERIOD_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_DateTime", System.Data.DbType.String, ctlPERIOD_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_AMOUNT", System.Data.DbType.String, ctlPERIOD_AMOUNT.Text);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_PERCENT", System.Data.DbType.String, ctlPERIOD_PERCENT.Text);
if (ctlPERIOD_START_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_START_DateTime", System.Data.DbType.String, ctlPERIOD_START_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_START_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add(p);
        }
if (ctlPERIOD_END_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_END_DateTime", System.Data.DbType.String, ctlPERIOD_END_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_END_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add(p);
        }
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_DURATION_DateTime", System.Data.DbType.String, ctlPERIOD_DURATION_DateTime.Text);
if (ctlPERIOD_DELIVERY_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_DELIVERY_DateTime", System.Data.DbType.String, ctlPERIOD_DELIVERY_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_DELIVERY_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add(p);
        }
if (ctlPERIOD_BORAD_DateTime.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_BORAD_DateTime", System.Data.DbType.String, ctlPERIOD_BORAD_DateTime.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PERIOD_BORAD_DateTime", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add(p);
        }
if (ctlPERIOD_STATUS.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_STATUS", System.Data.DbType.Int32, ctlPERIOD_STATUS.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_STATUS", System.Data.DbType.Int32, null);
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.UpdateParameters.Add("PERIOD_ID", System.Data.DbType.Int32, inputMainPERIOD_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.Update();


    }


}