using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainPROJECT_MEMBER_ID="-1";
	string key="PROJECT_MEMBER_ID";
    string Fkkey = "CONTRACT_ID";

    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.SelectParameters.Clear();
        if (Request.QueryString["PROJECT_MEMBER_ID"] != null && Request.QueryString["PROJECT_MEMBER_ID"] != "-1")
        {
            inputMainPROJECT_MEMBER_ID = Request.QueryString["PROJECT_MEMBER_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.SelectParameters.Add("PROJECT_MEMBER_ID", System.Data.DbType.Int32, inputMainPROJECT_MEMBER_ID);

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

//CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail
Title = ""; 
DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlPROJECT_MEMBER_NAME.Value = drv["PROJECT_MEMBER_NAME"].ToString();
ctlPROJECT_MEMBER_LNAME.Value = drv["PROJECT_MEMBER_LNAME"].ToString();
ctlPROJECT_MEMBER_ORG.Value = drv["PROJECT_MEMBER_ORG"].ToString();
ctlPROJECT_MEMBER_TEL.Value = drv["PROJECT_MEMBER_TEL"].ToString();
if (drv["PROJECT_MEMBER_START_DATE"] != null && drv["PROJECT_MEMBER_START_DATE"] != DBNull.Value)
            ctlPROJECT_MEMBER_START_DATE.Date = (DateTime)drv["PROJECT_MEMBER_START_DATE"];
if (drv["PROJECT_MEMBER_END_DATE"] != null && drv["PROJECT_MEMBER_END_DATE"] != DBNull.Value)
            ctlPROJECT_MEMBER_END_DATE.Date = (DateTime)drv["PROJECT_MEMBER_END_DATE"];

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
		dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add("PROJECT_MEMBER_NAME", System.Data.DbType.String, ctlPROJECT_MEMBER_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add("PROJECT_MEMBER_LNAME", System.Data.DbType.String, ctlPROJECT_MEMBER_LNAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add("PROJECT_MEMBER_ORG", System.Data.DbType.String, ctlPROJECT_MEMBER_ORG.Text);
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add("PROJECT_MEMBER_TEL", System.Data.DbType.String, ctlPROJECT_MEMBER_TEL.Text);
if (ctlPROJECT_MEMBER_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add("PROJECT_MEMBER_START_DATE", System.Data.DbType.String, ctlPROJECT_MEMBER_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PROJECT_MEMBER_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add(p);
        }
if (ctlPROJECT_MEMBER_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add("PROJECT_MEMBER_END_DATE", System.Data.DbType.String, ctlPROJECT_MEMBER_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PROJECT_MEMBER_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.InsertParameters.Add(p);
        }
int i = dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_NAME", System.Data.DbType.String, ctlPROJECT_MEMBER_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_LNAME", System.Data.DbType.String, ctlPROJECT_MEMBER_LNAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_ORG", System.Data.DbType.String, ctlPROJECT_MEMBER_ORG.Text);
dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_TEL", System.Data.DbType.String, ctlPROJECT_MEMBER_TEL.Text);
if (ctlPROJECT_MEMBER_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_START_DATE", System.Data.DbType.String, ctlPROJECT_MEMBER_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PROJECT_MEMBER_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add(p);
        }
if (ctlPROJECT_MEMBER_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_END_DATE", System.Data.DbType.String, ctlPROJECT_MEMBER_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "PROJECT_MEMBER_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add(p);
        }
		dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.UpdateParameters.Add("PROJECT_MEMBER_ID", System.Data.DbType.Int32, inputMainPROJECT_MEMBER_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.Update();


    }


}