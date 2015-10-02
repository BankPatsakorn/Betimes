using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_MEETING_POSITION_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainMEETING_POSITION_ID="-1";
	string key="MEETING_POSITION_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_POSITION_ID"] != null && Request.QueryString["MEETING_POSITION_ID"] != "-1")
        {
            inputMainMEETING_POSITION_ID = Request.QueryString["MEETING_POSITION_ID"];
        }
		dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.SelectParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, inputMainMEETING_POSITION_ID);

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

		//RMSM_MDM_MEETING_POSITION_INFO_DetailView
		Title = "ตำแหน่งประชุม"; 
		DataView dv = (DataView)dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMEETING_POSITION_NAME.Value = drv["MEETING_POSITION_NAME"].ToString();


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
		dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.InsertParameters.Clear();
        dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.InsertParameters.Add("MEETING_POSITION_NAME", System.Data.DbType.String, ctlMEETING_POSITION_NAME.Text);

		int i = dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.UpdateParameters.Add("MEETING_POSITION_NAME", System.Data.DbType.String, ctlMEETING_POSITION_NAME.Text);
		dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.UpdateParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, inputMainMEETING_POSITION_ID);
		int i = dsRMSM_MDM_MEETING_POSITION_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}