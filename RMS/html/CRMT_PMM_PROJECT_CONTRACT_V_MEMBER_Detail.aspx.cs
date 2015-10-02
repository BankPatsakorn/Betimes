using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainPROJECT_V_MEMBER_ID="-1";
	string key="PROJECT_V_MEMBER_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.SelectParameters.Clear();
        if (Request.QueryString["PROJECT_V_MEMBER_ID"] != null && Request.QueryString["PROJECT_V_MEMBER_ID"] != "-1")
        {
            inputMainPROJECT_V_MEMBER_ID = Request.QueryString["PROJECT_V_MEMBER_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.SelectParameters.Add("PROJECT_V_MEMBER_ID", System.Data.DbType.Int32, inputMainPROJECT_V_MEMBER_ID);

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

//CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail
Title = ""; 
DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlCONTRACT_V_FNAME_NAME_THA.Value = drv["CONTRACT_V_FNAME_NAME_THA"].ToString();
ctlCONTRACT_V_LNAME_NAME_THA.Value = drv["CONTRACT_V_LNAME_NAME_THA"].ToString();
ctlCONTRACT_V_COMPANY_POSITION.Value = drv["CONTRACT_V_COMPANY_POSITION"].ToString();
ctlCONTRACT_V_COMPANY_NAME.Value = drv["CONTRACT_V_COMPANY_NAME"].ToString();
ctlCONTRACT_V_COMPANY_TEL.Value = drv["CONTRACT_V_COMPANY_TEL"].ToString();
ctlCONTRACT_V_COMPANY_EMAIL.Value = drv["CONTRACT_V_COMPANY_EMAIL"].ToString();

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
		dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Add("CONTRACT_V_FNAME_NAME_THA", System.Data.DbType.String, ctlCONTRACT_V_FNAME_NAME_THA.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Add("CONTRACT_V_LNAME_NAME_THA", System.Data.DbType.String, ctlCONTRACT_V_LNAME_NAME_THA.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Add("CONTRACT_V_COMPANY_POSITION", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_POSITION.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Add("CONTRACT_V_COMPANY_NAME", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Add("CONTRACT_V_COMPANY_TEL", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_TEL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.InsertParameters.Add("CONTRACT_V_COMPANY_EMAIL", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_EMAIL.Text);
int i = dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("CONTRACT_V_FNAME_NAME_THA", System.Data.DbType.String, ctlCONTRACT_V_FNAME_NAME_THA.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("CONTRACT_V_LNAME_NAME_THA", System.Data.DbType.String, ctlCONTRACT_V_LNAME_NAME_THA.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("CONTRACT_V_COMPANY_POSITION", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_POSITION.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("CONTRACT_V_COMPANY_NAME", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_NAME.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("CONTRACT_V_COMPANY_TEL", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_TEL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("CONTRACT_V_COMPANY_EMAIL", System.Data.DbType.String, ctlCONTRACT_V_COMPANY_EMAIL.Text);
		dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.UpdateParameters.Add("PROJECT_V_MEMBER_ID", System.Data.DbType.Int32, inputMainPROJECT_V_MEMBER_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_Detail.Update();


    }


}