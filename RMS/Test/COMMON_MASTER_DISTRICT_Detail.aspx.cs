using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class COMMON_MASTER_DISTRICT_Detail : System.Web.UI.Page
{
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainDISTRICT_ID="-1";
	string key="DISTRICT_ID";
	string inputMainPROVINCE_ID="-1";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
dsCOMMON_MASTER_DISTRICT_Detail.SelectParameters.Clear();
        if (Request.QueryString["DISTRICT_ID"] != null && Request.QueryString["DISTRICT_ID"] != "-1")
        {
            inputMainDISTRICT_ID = Request.QueryString["DISTRICT_ID"];
        }
		dsCOMMON_MASTER_DISTRICT_Detail.SelectParameters.Add("DISTRICT_ID", System.Data.DbType.Int32, inputMainDISTRICT_ID);
        if (Request.QueryString["PROVINCE_ID"] != null && Request.QueryString["PROVINCE_ID"] != "-1")
        {
            inputMainPROVINCE_ID = Request.QueryString["PROVINCE_ID"];
        }
		dsCOMMON_MASTER_DISTRICT_Detail.SelectParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, inputMainPROVINCE_ID);

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

//COMMON_MASTER_DISTRICT_Detail
Title = "DISTRICT_Detail"; 
DataView dv = (DataView)dsCOMMON_MASTER_DISTRICT_Detail.Select(DataSourceSelectArguments.Empty);
DataRowView drv = dv[0];
ctlDISTRICT_CODE.Value = drv["DISTRICT_CODE"].ToString();
ctlDISTRICT_NAME.Value = drv["DISTRICT_NAME"].ToString();

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
		ctlDISTRICT_CODE.ValidationSettings.RequiredField.IsRequired = true;
		ctlDISTRICT_CODE.ValidationSettings.RequiredField.ErrorText = "";
		ctlDISTRICT_CODE.MaxLength = 100;
		ctlDISTRICT_NAME.ValidationSettings.RequiredField.IsRequired = true;
		ctlDISTRICT_NAME.ValidationSettings.RequiredField.ErrorText = "";


    }

    void SetFormatting()
    {
        //
		ctlDISTRICT_CODE.HorizontalAlign = HorizontalAlign.Right;
		ctlDISTRICT_CODE.DisplayFormatString = "00";


    }

    void Insert()
    {
        //
		dsCOMMON_MASTER_DISTRICT_Detail.InsertParameters.Clear();
dsCOMMON_MASTER_DISTRICT_Detail.InsertParameters.Add("DISTRICT_CODE", System.Data.DbType.String, ctlDISTRICT_CODE.Text);
dsCOMMON_MASTER_DISTRICT_Detail.InsertParameters.Add("DISTRICT_NAME", System.Data.DbType.String, ctlDISTRICT_NAME.Text);
int i = dsCOMMON_MASTER_DISTRICT_Detail.Insert();


    }

    void Update()
    {
        //
		dsCOMMON_MASTER_DISTRICT_Detail.UpdateParameters.Clear();
dsCOMMON_MASTER_DISTRICT_Detail.UpdateParameters.Add("DISTRICT_CODE", System.Data.DbType.String, ctlDISTRICT_CODE.Text);
dsCOMMON_MASTER_DISTRICT_Detail.UpdateParameters.Add("DISTRICT_NAME", System.Data.DbType.String, ctlDISTRICT_NAME.Text);
		dsCOMMON_MASTER_DISTRICT_Detail.UpdateParameters.Add("DISTRICT_ID", System.Data.DbType.Int32, inputMainDISTRICT_ID);
		dsCOMMON_MASTER_DISTRICT_Detail.UpdateParameters.Add("PROVINCE_ID", System.Data.DbType.Int32, inputMainPROVINCE_ID);
int i = dsCOMMON_MASTER_DISTRICT_Detail.Update();


    }


}