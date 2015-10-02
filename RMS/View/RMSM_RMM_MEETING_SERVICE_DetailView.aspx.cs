using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_SERVICE_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainMEETING_SERVICE_ID="-1";
	string key="MEETING_SERVICE_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_RMM_MEETING_SERVICE_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_SERVICE_ID"] != null && Request.QueryString["MEETING_SERVICE_ID"] != "-1")
        {
            inputMainMEETING_SERVICE_ID = Request.QueryString["MEETING_SERVICE_ID"];
        }
		dsRMSM_RMM_MEETING_SERVICE_DetailView.SelectParameters.Add("MEETING_SERVICE_ID", System.Data.DbType.Int32, inputMainMEETING_SERVICE_ID);

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

		//RMSM_RMM_MEETING_SERVICE_DetailView
		Title = "บริการการประชุม"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_SERVICE_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlSERVICE_ID.Value = drv["SERVICE_ID"].ToString();
        ctlSERVICE_ID_label.Text = drv["SERVICE_NAME"].ToString();


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
		dsRMSM_RMM_MEETING_SERVICE_DetailView.InsertParameters.Clear();
        dsRMSM_RMM_MEETING_SERVICE_DetailView.InsertParameters.Add("SERVICE_ID", System.Data.DbType.String, ctlSERVICE_ID.Text);

		int i = dsRMSM_RMM_MEETING_SERVICE_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_SERVICE_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_SERVICE_DetailView.UpdateParameters.Add("SERVICE_ID", System.Data.DbType.String, ctlSERVICE_ID.Text);
		dsRMSM_RMM_MEETING_SERVICE_DetailView.UpdateParameters.Add("MEETING_SERVICE_ID", System.Data.DbType.Int32, inputMainMEETING_SERVICE_ID);
		int i = dsRMSM_RMM_MEETING_SERVICE_DetailView.Update();


		JS="alert('Updated');";
    }


}