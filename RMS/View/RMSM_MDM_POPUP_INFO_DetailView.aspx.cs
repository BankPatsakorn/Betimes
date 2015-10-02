using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_POPUP_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputPOPUP_ID="-1";
	string inputMainPOPUP_ID="-1";
	string key="POPUP_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_MDM_POPUP_INFO_ListView 
//dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Clear();
//        if (Request.QueryString["POPUP_ID"] != null && Request.QueryString["POPUP_ID"] != "-1")
//        {
//            inputPOPUP_ID = Request.QueryString["POPUP_ID"];
//        }
//dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("POPUP_ID", System.Data.DbType.Int32, inputPOPUP_ID);
		dsRMSM_MDM_POPUP_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["POPUP_ID"] != null && Request.QueryString["POPUP_ID"] != "-1")
        {
            inputMainPOPUP_ID = Request.QueryString["POPUP_ID"];
        }
		dsRMSM_MDM_POPUP_INFO_DetailView.SelectParameters.Add("POPUP_ID", System.Data.DbType.Int32, inputMainPOPUP_ID);

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
            ctlPOPUP_STATUS.SelectedIndex = 0;
            ctlTEXT_SIZE.SelectedIndex = 1;
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

		//RMSM_MDM_POPUP_INFO_DetailView
		Title = "จัดการ Pop Up(RMS_UT0508-1)"; 
		DataView dv = (DataView)dsRMSM_MDM_POPUP_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlPOPUP_NAME.Value = drv["POPUP_NAME"].ToString();

        ctlMENU_ID.Value = drv["MENU_ID"].ToString();

        ctlPOPUP_STATUS.Value = drv["POPUP_STATUS"].ToString();


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
		dsRMSM_MDM_POPUP_INFO_DetailView.InsertParameters.Clear();
        dsRMSM_MDM_POPUP_INFO_DetailView.InsertParameters.Add("POPUP_NAME", System.Data.DbType.String, ctlPOPUP_NAME.Text);

        if (ctlMENU_ID.Value != null)
            dsRMSM_MDM_POPUP_INFO_DetailView.InsertParameters.Add("MENU_ID", System.Data.DbType.Int32, ctlMENU_ID.Value.ToString());
        else
            dsRMSM_MDM_POPUP_INFO_DetailView.InsertParameters.Add("MENU_ID", System.Data.DbType.Int32, null); 

        if (ctlPOPUP_STATUS.Value != null)
            dsRMSM_MDM_POPUP_INFO_DetailView.InsertParameters.Add("POPUP_STATUS", System.Data.DbType.Int32, ctlPOPUP_STATUS.Value.ToString());
        else
            dsRMSM_MDM_POPUP_INFO_DetailView.InsertParameters.Add("POPUP_STATUS", System.Data.DbType.Int32, null); 

		int i = dsRMSM_MDM_POPUP_INFO_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Add("POPUP_NAME", System.Data.DbType.String, ctlPOPUP_NAME.Text);
        if (ctlMENU_ID.Value != null)
            dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Add("MENU_ID", System.Data.DbType.Int32, ctlMENU_ID.Value.ToString());
        else
            dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Add("MENU_ID", System.Data.DbType.Int32, null); 
        if (ctlPOPUP_STATUS.Value != null)
            dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Add("POPUP_STATUS", System.Data.DbType.Int32, ctlPOPUP_STATUS.Value.ToString());
        else
            dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Add("POPUP_STATUS", System.Data.DbType.Int32, null); 

		dsRMSM_MDM_POPUP_INFO_DetailView.UpdateParameters.Add("POPUP_ID", System.Data.DbType.Int32, inputMainPOPUP_ID);
		int i = dsRMSM_MDM_POPUP_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        ctlPOPUP_NAME.Text = "";
        ctlMENU_ID.SelectedIndex = -1;
        ctlPOPUP_STATUS.SelectedIndex = -1;
    }
}