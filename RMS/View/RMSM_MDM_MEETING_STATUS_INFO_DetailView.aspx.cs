using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_MEETING_STATUS_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainMEETING_STATUS_ID="-1";
	string key="MEETING_STATUS_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_STATUS_ID"] != null && Request.QueryString["MEETING_STATUS_ID"] != "-1")
        {
            inputMainMEETING_STATUS_ID = Request.QueryString["MEETING_STATUS_ID"];
        }
		dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.SelectParameters.Add("MEETING_STATUS_ID", System.Data.DbType.Int32, inputMainMEETING_STATUS_ID);

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

		//RMSM_MDM_MEETING_STATUS_INFO_DetailView
		Title = "สถานะยืนยันการเข้าประชุม"; 
		DataView dv = (DataView)dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMEETING_STATUS_NAME.Value = drv["MEETING_STATUS_NAME"].ToString();


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
		dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.InsertParameters.Clear();
        dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.InsertParameters.Add("MEETING_STATUS_NAME", System.Data.DbType.String, ctlMEETING_STATUS_NAME.Text);

		int i = dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.UpdateParameters.Add("MEETING_STATUS_NAME", System.Data.DbType.String, ctlMEETING_STATUS_NAME.Text);
		dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.UpdateParameters.Add("MEETING_STATUS_ID", System.Data.DbType.Int32, inputMainMEETING_STATUS_ID);
		int i = dsRMSM_MDM_MEETING_STATUS_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}