using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;

public partial class RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView : System.Web.UI.Page
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
		dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_MEMBER_ID"] != null && Request.QueryString["MEETING_MEMBER_ID"] != "-1")
        {
            inputMainMEETING_MEMBER_ID = Request.QueryString["MEETING_MEMBER_ID"];
        }
		dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.SelectParameters.Add("MEETING_MEMBER_ID", System.Data.DbType.Int32, inputMainMEETING_MEMBER_ID);

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
            ctlOFFICER_OPSITION_NAME_OUT.Visible = false;
            ctlORGOUT.Visible = false;

            initView();
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

		//RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView
		Title = "ผู้บริหาร สปน."; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlMEMBER_OWNER_OFFICER_ID.Value = drv["MEMBER_OWNER_OFFICER_ID"].ToString();
        ctlMEMBER_OWNER_OFFICER_ID_label.Text = drv["NAME"].ToString();

        ctlOFFICER_OPSITION_NAME.Value = drv["OFFICER_OPSITION_NAME"].ToString();
        ctlOFFICER_OPSITION_NAME.Attributes.Add("disabled","disabled");

        ctlORG.Value = drv["ORG"].ToString();
        ctlORG.Attributes.Add("disabled","disabled");

        ctlMEETING_POSITION_ID.Value = drv["MEETING_POSITION_ID"].ToString();

        ctlMEETING_MEMBER_TYPE.Value = drv["MEETING_MEMBER_TYPE"].ToString();
        ctlMEETING_MEMBER_TYPE.Attributes.Add("disabled","disabled");

        ctlMEETING_MEMBER_STATUS.Value = drv["MEETING_MEMBER_STATUS"].ToString();
        ctlMEETING_MEMBER_STATUS.Attributes.Add("disabled","disabled");


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
    void initView()
    {
        MEMBER_OWNER_OFFICER_ID.Visible = true;
        ctlOFFICER_OPSITION_NAME.Visible = true;
        ctlORG.Visible = true;
        MEETING_MEMBER_STATUS.Visible = true;

        ctlOFFICER_OPSITION_NAME_OUT.Visible = false;
        ctlORGOUT.Visible = false;

        divEmail.Visible = false;
        divname.Visible = false;
        divlastname.Visible = false;
        divPhone.Visible = false;
        divPrename.Visible = false;
    }
    protected void dropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox cmb = (ASPxComboBox)sender;
        Session["SelectedIndex"] = cmb.SelectedIndex;
        if (cmb.SelectedIndex == 2)
        {
            MEMBER_OWNER_OFFICER_ID.Visible = false;
            ctlOFFICER_OPSITION_NAME.Visible = false;
            ctlORG.Visible = false;
            MEETING_MEMBER_STATUS.Visible = false;


            ctlOFFICER_OPSITION_NAME_OUT.Visible = true;
            ctlORGOUT.Visible = true;

            divEmail.Visible = true;
            divname.Visible = true;
            divlastname.Visible = true;
            divPhone.Visible = true;
            divPrename.Visible = true;
        }
        else
        {
            initView();
        }
    }
    void Insert()
    {
        //
        //dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Clear();
        //dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("MEMBER_OWNER_OFFICER_ID", System.Data.DbType.String, ctlMEMBER_OWNER_OFFICER_ID.Text);

        //dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("OFFICER_OPSITION_NAME", System.Data.DbType.String, ctlOFFICER_OPSITION_NAME.Text);

        //dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("ORG", System.Data.DbType.String, ctlORG.Text);

        //if (ctlMEETING_POSITION_ID.Value != null)
        //    dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, ctlMEETING_POSITION_ID.Value.ToString());
        //else
        //    dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, null); 

        ////dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("MEETING_MEMBER_TYPE", System.Data.DbType.String, ctlMEETING_MEMBER_TYPE.Text);

        ////dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.InsertParameters.Add("MEETING_MEMBER_STATUS", System.Data.DbType.String, ctlMEETING_MEMBER_STATUS.Text);

        //int i = dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.Insert();


		JS="alert('Inserted');";
        btnSave.Visible = false;
        btnBack.Visible = true;
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("MEMBER_OWNER_OFFICER_ID", System.Data.DbType.String, ctlMEMBER_OWNER_OFFICER_ID.Text);
        dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("OFFICER_OPSITION_NAME", System.Data.DbType.String, ctlOFFICER_OPSITION_NAME.Text);
        dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("ORG", System.Data.DbType.String, ctlORG.Text);
        if (ctlMEETING_POSITION_ID.Value != null)
            dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, ctlMEETING_POSITION_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("MEETING_POSITION_ID", System.Data.DbType.Int32, null); 
        dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("MEETING_MEMBER_TYPE", System.Data.DbType.String, ctlMEETING_MEMBER_TYPE.Text);
        //dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("MEETING_MEMBER_STATUS", System.Data.DbType.String, ctlMEETING_MEMBER_STATUS.Text);
        //dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.UpdateParameters.Add("MEETING_MEMBER_ID", System.Data.DbType.Int32, inputMainMEETING_MEMBER_ID);
		int i = dsRMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.Update();


		JS="alert('Updated');";
    }


}