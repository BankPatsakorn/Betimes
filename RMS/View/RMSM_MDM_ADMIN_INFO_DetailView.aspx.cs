using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_ADMIN_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainADMIN_ID="-1";
	string key="ADMIN_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_ADMIN_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["ADMIN_ID"] != null && Request.QueryString["ADMIN_ID"] != "-1")
        {
            inputMainADMIN_ID = Request.QueryString["ADMIN_ID"];
        }
		dsRMSM_MDM_ADMIN_INFO_DetailView.SelectParameters.Add("ADMIN_ID", System.Data.DbType.Int32, inputMainADMIN_ID);

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
            btnBack.Visible = false;
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

		//RMSM_MDM_ADMIN_INFO_DetailView
		Title = "ผู้ดูแลห้องประชุม(RMS_UT0507) "; 
		DataView dv = (DataView)dsRMSM_MDM_ADMIN_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlOFFICER_ID.Text = drv["OFFICER_ID"].ToString();
        ctlOFFICER_ID_label.Text = drv["NAME"].ToString();

        ctlUNIT_NAME.Value = drv["UNIT_NAME"].ToString();
        ctlUNIT_NAME.Attributes.Add("disabled","disabled");

        //ctlROOM_ID.Value = drv["ROOM_ID"].ToString();


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
        //dsRMSM_MDM_ADMIN_INFO_DetailView.InsertParameters.Clear();
        //dsRMSM_MDM_ADMIN_INFO_DetailView.InsertParameters.Add("OFFICER_ID", System.Data.DbType.String, ctlOFFICER_ID.Text);

        //dsRMSM_MDM_ADMIN_INFO_DetailView.InsertParameters.Add("UNIT_NAME", System.Data.DbType.String, ctlUNIT_NAME.Text);

        //if (ctlROOM_ID.Value != null)
        //    dsRMSM_MDM_ADMIN_INFO_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        //else
        //    dsRMSM_MDM_ADMIN_INFO_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 

        //int i = dsRMSM_MDM_ADMIN_INFO_DetailView.Insert();


		JS="alert('Inserted');";
        btnSave.Visible = false;
        btnBack.Visible = true;
    }

    void Update()
    {
        //
		dsRMSM_MDM_ADMIN_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_ADMIN_INFO_DetailView.UpdateParameters.Add("OFFICER_ID", System.Data.DbType.String, ctlOFFICER_ID.Text);
        dsRMSM_MDM_ADMIN_INFO_DetailView.UpdateParameters.Add("UNIT_NAME", System.Data.DbType.String, ctlUNIT_NAME.Text);
        //if (ctlROOM_ID.Value != null)
        //    dsRMSM_MDM_ADMIN_INFO_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        //else
        //    dsRMSM_MDM_ADMIN_INFO_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 
		dsRMSM_MDM_ADMIN_INFO_DetailView.UpdateParameters.Add("ADMIN_ID", System.Data.DbType.Int32, inputMainADMIN_ID);
		int i = dsRMSM_MDM_ADMIN_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}