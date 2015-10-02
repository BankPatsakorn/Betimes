using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_MEMBER_OUT_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainMEETING_MEMBER_ID="-1";
	string key="MEETING_MEMBER_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_MEMBER_ID"] != null && Request.QueryString["MEETING_MEMBER_ID"] != "-1")
        {
            inputMainMEETING_MEMBER_ID = Request.QueryString["MEETING_MEMBER_ID"];
        }
		dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.SelectParameters.Add("MEETING_MEMBER_ID", System.Data.DbType.Int32, inputMainMEETING_MEMBER_ID);

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

		//RMSM_RMM_MEETING_MEMBER_OUT_DetailView
		Title = "บุคคลภายนอก สปน."; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMEETING_MEMBER_FULL_NAME_OUT.Value = drv["MEETING_MEMBER_FULL_NAME_OUT"].ToString();

        ctlMEETING_MEMBER_POSITION_OUT.Value = drv["MEETING_MEMBER_POSITION_OUT"].ToString();

        ctlMEETING_MEMBER_ORG_OUT.Value = drv["MEETING_MEMBER_ORG_OUT"].ToString();

        ctlMEETING_MEMBER_EMAIL_OUT.Value = drv["MEETING_MEMBER_EMAIL_OUT"].ToString();

        ctlMEETING_MEMBER_TEL_OUT.Value = drv["MEETING_MEMBER_TEL_OUT"].ToString();

        ctlMEETING_POSITION_ID.Value = drv["MEETING_POSITION_ID"].ToString();

        ctlMEETING_MEMBER_TYPE.Value = drv["MEETING_MEMBER_TYPE"].ToString();
        ctlMEETING_MEMBER_TYPE.Attributes.Add("disabled","disabled");


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
		dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Clear();
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_MEMBER_FULL_NAME_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_FULL_NAME_OUT.Text);

        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_MEMBER_POSITION_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_POSITION_OUT.Text);

        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_MEMBER_ORG_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_ORG_OUT.Text);

        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_MEMBER_EMAIL_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_EMAIL_OUT.Text);

        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_MEMBER_TEL_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_TEL_OUT.Text);

        if (ctlMEETING_POSITION_ID.Value != null)
            dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, ctlMEETING_POSITION_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, null); 

        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.InsertParameters.Add("MEETING_MEMBER_TYPE", System.Data.DbType.String, ctlMEETING_MEMBER_TYPE.Text);

		int i = dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_FULL_NAME_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_FULL_NAME_OUT.Text);
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_POSITION_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_POSITION_OUT.Text);
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_ORG_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_ORG_OUT.Text);
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_EMAIL_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_EMAIL_OUT.Text);
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_TEL_OUT", System.Data.DbType.String, ctlMEETING_MEMBER_TEL_OUT.Text);
        if (ctlMEETING_POSITION_ID.Value != null)
            dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, ctlMEETING_POSITION_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, null); 
        dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_TYPE", System.Data.DbType.String, ctlMEETING_MEMBER_TYPE.Text);
		dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.UpdateParameters.Add("MEETING_MEMBER_ID", System.Data.DbType.Int32, inputMainMEETING_MEMBER_ID);
		int i = dsRMSM_RMM_MEETING_MEMBER_OUT_DetailView.Update();


		JS="alert('Updated');";
    }


}