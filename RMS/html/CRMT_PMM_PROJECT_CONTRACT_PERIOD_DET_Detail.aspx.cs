using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainPERIOD_DET_ID="-1";
	string key="PERIOD_DET_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.SelectParameters.Clear();
        if (Request.QueryString["PERIOD_DET_ID"] != null && Request.QueryString["PERIOD_DET_ID"] != "-1")
        {
            inputMainPERIOD_DET_ID = Request.QueryString["PERIOD_DET_ID"];
        }
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.SelectParameters.Add("PERIOD_DET_ID", System.Data.DbType.Int32, inputMainPERIOD_DET_ID);

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

//CRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail
Title = ""; 
DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlPERIOD_DET_DESC.Value = drv["PERIOD_DET_DESC"].ToString();
ctlPERIOD_DET_QUANTITY.Value = drv["PERIOD_DET_QUANTITY"].ToString();
ctlUNIT_ID.Value = drv["UNIT_ID"].ToString();
ctlPERIOD_DET_REMARK.Html = drv["PERIOD_DET_REMARK"].ToString();

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
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.InsertParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.InsertParameters.Add("PERIOD_DET_DESC", System.Data.DbType.String, ctlPERIOD_DET_DESC.Text);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.InsertParameters.Add("PERIOD_DET_QUANTITY", System.Data.DbType.String, ctlPERIOD_DET_QUANTITY.Text);
if (ctlUNIT_ID.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.InsertParameters.Add("UNIT_ID", System.Data.DbType.Int32, ctlUNIT_ID.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.InsertParameters.Add("UNIT_ID", System.Data.DbType.Int32, null);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.InsertParameters.Add("PERIOD_DET_REMARK", System.Data.DbType.String, ctlPERIOD_DET_REMARK.Html);
int i = dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.Insert();


    }

    void Update()
    {
        //
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Clear();
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Add("PERIOD_DET_DESC", System.Data.DbType.String, ctlPERIOD_DET_DESC.Text);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Add("PERIOD_DET_QUANTITY", System.Data.DbType.String, ctlPERIOD_DET_QUANTITY.Text);
if (ctlUNIT_ID.Value != null)
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Add("UNIT_ID", System.Data.DbType.Int32, ctlUNIT_ID.Value.ToString());
        else
            dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Add("UNIT_ID", System.Data.DbType.Int32, null);
dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Add("PERIOD_DET_REMARK", System.Data.DbType.String, ctlPERIOD_DET_REMARK.Html);
		dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.UpdateParameters.Add("PERIOD_DET_ID", System.Data.DbType.Int32, inputMainPERIOD_DET_ID);
int i = dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_DET_Detail.Update();


    }


}