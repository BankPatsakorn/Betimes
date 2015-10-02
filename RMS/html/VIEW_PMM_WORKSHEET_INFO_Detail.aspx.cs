using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VIEW_PMM_WORKSHEET_INFO_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainOPEN_ID="-1";
    string key="OPEN_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
        //Grid CRMT_PMM_PROJECT_CONTRACT_List 
        dsCRMT_PMM_PROJECT_CONTRACT_List.SelectParameters.Clear();
        //Grid CRMT_PMM_PROJECT_CONTRACT_MEMBER_List 
        dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.SelectParameters.Clear();
        //Grid CRMT_PMM_PROJECT_CONTRACT_V_List 
        dsCRMT_PMM_PROJECT_CONTRACT_V_List.SelectParameters.Clear();
        //Grid CRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List 
        dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List.SelectParameters.Clear();
        dsVIEW_PMM_WORKSHEET_INFO_Detail.SelectParameters.Clear();
        if (Request.QueryString["OPEN_ID"] != null && Request.QueryString["OPEN_ID"] != "-1")
        {
            inputMainOPEN_ID = Request.QueryString["OPEN_ID"];
        }
        dsVIEW_PMM_WORKSHEET_INFO_Detail.SelectParameters.Add("OPEN_ID", System.Data.DbType.Int32, inputMainOPEN_ID);
        dsCRMT_PMM_PROJECT_CONTRACT_List.SelectParameters.Add("OPEN_ID", System.Data.DbType.Int32, inputMainOPEN_ID);
        dsCRMT_PMM_PROJECT_CONTRACT_V_List.SelectParameters.Add("OPEN_ID", System.Data.DbType.Int32, inputMainOPEN_ID);
        dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.SelectParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, "-1");
        dsCRMT_PMM_PROJECT_CONTRACT_V_MEMBER_List.SelectParameters.Add("OPEN_ID", System.Data.DbType.Int32, inputMainOPEN_ID);
        string xx = dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.SelectCommand;
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

        //VIEW_PMM_WORKSHEET_INFO_Detail
        Title = "";
        DataView dv = (DataView)dsVIEW_PMM_WORKSHEET_INFO_Detail.Select(DataSourceSelectArguments.Empty);
        if (dv.Count > 0)
        {
            DataRowView drv = dv[0];
            if (drv["OPEN_REQUEST_DATE"] != null && drv["OPEN_REQUEST_DATE"] != DBNull.Value)
                ctlOPEN_REQUEST_DATE.Date = (DateTime)drv["OPEN_REQUEST_DATE"];
            ctlPROJECT_CODE.Value = drv["PROJECT_CODE"].ToString();
            ctlOPEN_STATUS.Value = drv["OPEN_STATUS"].ToString();
            ctlPROJECT_NAME.Value = drv["PROJECT_NAME"].ToString();
            ctlORGANIZE_NAME_THA.Value = drv["ORGANIZE_NAME_THA"].ToString();
            ctlCREATE_USER_ID.Value = drv["CREATE_USER_ID"].ToString();
            ctlORGANIZE_NAME_THA.Value = drv["ORGANIZE_NAME_THA"].ToString();
            ctlORGANIZE_NAME_THA.Value = drv["ORGANIZE_NAME_THA"].ToString();

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
		dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Clear();
if (ctlOPEN_REQUEST_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("OPEN_REQUEST_DATE", System.Data.DbType.String, ctlOPEN_REQUEST_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "OPEN_REQUEST_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add(p);
        }
dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("PROJECT_CODE", System.Data.DbType.String, ctlPROJECT_CODE.Text);
if (ctlOPEN_STATUS.Value != null)
            dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("OPEN_STATUS", System.Data.DbType.Int32, ctlOPEN_STATUS.Value.ToString());
        else
            dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("OPEN_STATUS", System.Data.DbType.Int32, null);
dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("PROJECT_NAME", System.Data.DbType.String, ctlPROJECT_NAME.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("ORGANIZE_NAME_THA", System.Data.DbType.String, ctlORGANIZE_NAME_THA.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("CREATE_USER_ID", System.Data.DbType.String, ctlCREATE_USER_ID.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("ORGANIZE_NAME_THA", System.Data.DbType.String, ctlORGANIZE_NAME_THA.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.InsertParameters.Add("ORGANIZE_NAME_THA", System.Data.DbType.String, ctlORGANIZE_NAME_THA.Text);
int i = dsVIEW_PMM_WORKSHEET_INFO_Detail.Insert();


    }

    void Update()
    {
        //
		dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Clear();
if (ctlOPEN_REQUEST_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("OPEN_REQUEST_DATE", System.Data.DbType.String, ctlOPEN_REQUEST_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "OPEN_REQUEST_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add(p);
        }
dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("PROJECT_CODE", System.Data.DbType.String, ctlPROJECT_CODE.Text);
if (ctlOPEN_STATUS.Value != null)
            dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("OPEN_STATUS", System.Data.DbType.Int32, ctlOPEN_STATUS.Value.ToString());
        else
            dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("OPEN_STATUS", System.Data.DbType.Int32, null);
dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("PROJECT_NAME", System.Data.DbType.String, ctlPROJECT_NAME.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("ORGANIZE_NAME_THA", System.Data.DbType.String, ctlORGANIZE_NAME_THA.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("CREATE_USER_ID", System.Data.DbType.String, ctlCREATE_USER_ID.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("ORGANIZE_NAME_THA", System.Data.DbType.String, ctlORGANIZE_NAME_THA.Text);
dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("ORGANIZE_NAME_THA", System.Data.DbType.String, ctlORGANIZE_NAME_THA.Text);
		dsVIEW_PMM_WORKSHEET_INFO_Detail.UpdateParameters.Add("OPEN_ID", System.Data.DbType.Int32, inputMainOPEN_ID);
int i = dsVIEW_PMM_WORKSHEET_INFO_Detail.Update();


    }


    protected void viewCRMT_PMM_PROJECT_CONTRACT_List_SelectionChanged(object sender, EventArgs e)
    {
        var s = sender;
        string[] param = { "CONTRACT_ID" };
        List<object> o = viewCRMT_PMM_PROJECT_CONTRACT_List.GetSelectedFieldValues(param);
        string o2 = o[0].ToString();
        dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.SelectParameters.Clear();
        dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.SelectParameters.Add("CONTRACT_ID", System.Data.DbType.Int32, o2);
        CONTRACT_ID_SELECTED.Value = o2;
        string xx = dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.SelectCommand;
        DataView dv = (DataView)dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.Select(DataSourceSelectArguments.Empty);

        //viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.DataSource = dv.Table;
        //viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.DataBind();
        //viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List.;
     }
}