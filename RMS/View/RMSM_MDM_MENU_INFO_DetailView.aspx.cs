using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_MENU_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainMENU_ID="-1";
	string key="MENU_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_MENU_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MENU_ID"] != null && Request.QueryString["MENU_ID"] != "-1")
        {
            inputMainMENU_ID = Request.QueryString["MENU_ID"];
        }
		dsRMSM_MDM_MENU_INFO_DetailView.SelectParameters.Add("MENU_ID", System.Data.DbType.Int32, inputMainMENU_ID);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
		JS="";
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

		//RMSM_MDM_MENU_INFO_DetailView
		Title = "ข้อมูลเมนู"; 
		DataView dv = (DataView)dsRMSM_MDM_MENU_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMENU_NAME.Value = drv["MENU_NAME"].ToString();


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
		dsRMSM_MDM_MENU_INFO_DetailView.InsertParameters.Clear();
        dsRMSM_MDM_MENU_INFO_DetailView.InsertParameters.Add("MENU_NAME", System.Data.DbType.String, ctlMENU_NAME.Text);

		int i = dsRMSM_MDM_MENU_INFO_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_MDM_MENU_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_MENU_INFO_DetailView.UpdateParameters.Add("MENU_NAME", System.Data.DbType.String, ctlMENU_NAME.Text);
		dsRMSM_MDM_MENU_INFO_DetailView.UpdateParameters.Add("MENU_ID", System.Data.DbType.Int32, inputMainMENU_ID);
		int i = dsRMSM_MDM_MENU_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}