using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainBORAD_ID="-1";
	string key="BORAD_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.SelectParameters.Clear();
        if (Request.QueryString["BORAD_ID"] != null && Request.QueryString["BORAD_ID"] != "-1")
        {
            inputMainBORAD_ID = Request.QueryString["BORAD_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.SelectParameters.Add("BORAD_ID", System.Data.DbType.Int32, inputMainBORAD_ID);

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

//CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail
Title = ""; 
DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlPERSONAL_CARD_ID.Value = drv["PERSONAL_CARD_ID"].ToString();
ctlPERSONAL_ID.Value = drv["PERSONAL_ID"].ToString();
ctlSECTION.Value = drv["SECTION"].ToString();
ctlBORAD_POSITION.Value = drv["BORAD_POSITION"].ToString();
ctlTEL.Value = drv["TEL"].ToString();
ctlEMAIL.Value = drv["EMAIL"].ToString();

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
		dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Add("PERSONAL_CARD_ID", System.Data.DbType.String, ctlPERSONAL_CARD_ID.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Add("PERSONAL_ID", System.Data.DbType.String, ctlPERSONAL_ID.Value);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Add("SECTION", System.Data.DbType.String, ctlSECTION.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Add("BORAD_POSITION", System.Data.DbType.String, ctlBORAD_POSITION.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Add("TEL", System.Data.DbType.String, ctlTEL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.InsertParameters.Add("EMAIL", System.Data.DbType.String, ctlEMAIL.Text);
int i = dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("PERSONAL_CARD_ID", System.Data.DbType.String, ctlPERSONAL_CARD_ID.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("PERSONAL_ID", System.Data.DbType.String, ctlPERSONAL_ID.Value);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("SECTION", System.Data.DbType.String, ctlSECTION.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("BORAD_POSITION", System.Data.DbType.String, ctlBORAD_POSITION.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("TEL", System.Data.DbType.String, ctlTEL.Text);
dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("EMAIL", System.Data.DbType.String, ctlEMAIL.Text);
		dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.UpdateParameters.Add("BORAD_ID", System.Data.DbType.Int32, inputMainBORAD_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.Update();


    }


}