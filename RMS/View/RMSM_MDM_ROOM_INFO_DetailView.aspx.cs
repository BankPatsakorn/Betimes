using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_ROOM_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputEQUIPMENT_ID="-1";
string inputSERVICE_ID="-1";
string inputADMIN_ID="-1";
	string inputMainROOM_ID="-1";
	string key="ROOM_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_MDM_EQUIPMENT_INFO_ListView 
dsRMSM_MDM_EQUIPMENT_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["EQUIPMENT_ID"] != null && Request.QueryString["EQUIPMENT_ID"] != "-1")
        {
            inputEQUIPMENT_ID = Request.QueryString["EQUIPMENT_ID"];
        }
dsRMSM_MDM_EQUIPMENT_INFO_ListView.SelectParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, inputEQUIPMENT_ID);
//Grid RMSM_MDM_SERVICE_INFO_ListView 
dsRMSM_MDM_SERVICE_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["SERVICE_ID"] != null && Request.QueryString["SERVICE_ID"] != "-1")
        {
            inputSERVICE_ID = Request.QueryString["SERVICE_ID"];
        }
dsRMSM_MDM_SERVICE_INFO_ListView.SelectParameters.Add("SERVICE_ID", System.Data.DbType.Int32, inputSERVICE_ID);
//Grid RMSM_MDM_ADMIN_INFO_ListView 
dsRMSM_MDM_ADMIN_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["ADMIN_ID"] != null && Request.QueryString["ADMIN_ID"] != "-1")
        {
            inputADMIN_ID = Request.QueryString["ADMIN_ID"];
        }
dsRMSM_MDM_ADMIN_INFO_ListView.SelectParameters.Add("ADMIN_ID", System.Data.DbType.Int32, inputADMIN_ID);
		dsRMSM_MDM_ROOM_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["ROOM_ID"] != null && Request.QueryString["ROOM_ID"] != "-1")
        {
            inputMainROOM_ID = Request.QueryString["ROOM_ID"];
        }
		dsRMSM_MDM_ROOM_INFO_DetailView.SelectParameters.Add("ROOM_ID", System.Data.DbType.Int32, inputMainROOM_ID);

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
            ctlROOM_STATUS.SelectedIndex = 0;
            if (mode == "e")
                PopulateEditData();
            else if (mode == "n")
                PopulateNewData();


           // ctlROOM_STATUS.
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

		//RMSM_MDM_ROOM_INFO_DetailView
		Title = "จัดการห้องประชุม(RMS_UT0501)"; 
		DataView dv = (DataView)dsRMSM_MDM_ROOM_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlROOM_CODE.Value = drv["ROOM_CODE"].ToString();
        ctlROOM_CODE.Attributes.Add("disabled","disabled");

        ctlROOM_NAME.Value = drv["ROOM_NAME"].ToString();

        ctlROOM_FLOOR.Value = drv["ROOM_FLOOR"].ToString();

        ctlROOM_STATUS.Value = drv["ROOM_STATUS"].ToString();

        ctlROOM_CAPACITY.Value = drv["ROOM_CAPACITY"].ToString();

        if(drv["ROOM_MAPPING"].ToString()!=""){
            linkROOM_MAPPING.Visible = true;
            linkROOM_MAPPING.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings["UploadUrl"] + "/" + drv["ROOM_MAPPING"].ToString();
            linkROOM_MAPPING.Text = drv["ROOM_MAPPING"].ToString();
        }


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
		dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Clear();
        dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_CODE", System.Data.DbType.String, ctlROOM_CODE.Text);

        dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_NAME", System.Data.DbType.String, ctlROOM_NAME.Text);

        dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_FLOOR", System.Data.DbType.Int32, ctlROOM_FLOOR.Text);

        if (ctlROOM_STATUS.Value != null)
            dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_STATUS", System.Data.DbType.Int32, ctlROOM_STATUS.Value.ToString());
        else
            dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_STATUS", System.Data.DbType.Int32, null); 

        dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_CAPACITY", System.Data.DbType.Int32, ctlROOM_CAPACITY.Text);

        if (ctlROOM_MAPPING.HasFile)
        {
            ctlROOM_MAPPING.SaveAs(System.Configuration.ConfigurationManager.AppSettings["UploadPath"] + "\\" + ctlROOM_MAPPING.FileName);
            dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_MAPPING", System.Data.DbType.String, ctlROOM_MAPPING.FileName);
        }
        else
        {
            dsRMSM_MDM_ROOM_INFO_DetailView.InsertParameters.Add("ROOM_MAPPING", System.Data.DbType.String, "");
        }

		int i = dsRMSM_MDM_ROOM_INFO_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_CODE", System.Data.DbType.String, ctlROOM_CODE.Text);
        dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_NAME", System.Data.DbType.String, ctlROOM_NAME.Text);
        dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_FLOOR", System.Data.DbType.Int32, ctlROOM_FLOOR.Text);
        if (ctlROOM_STATUS.Value != null)
            dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_STATUS", System.Data.DbType.Int32, ctlROOM_STATUS.Value.ToString());
        else
            dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_STATUS", System.Data.DbType.Int32, null); 

        dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_CAPACITY", System.Data.DbType.Int32, ctlROOM_CAPACITY.Text);
        if (ctlROOM_MAPPING.HasFile)
        {
            ctlROOM_MAPPING.SaveAs(System.Configuration.ConfigurationManager.AppSettings["UploadPath"] + "\\" + ctlROOM_MAPPING.FileName);
            dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_MAPPING", System.Data.DbType.String, ctlROOM_MAPPING.FileName);
        }
        else
        {
            //dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_MAPPING", System.Data.DbType.String, "");
        }

		dsRMSM_MDM_ROOM_INFO_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, inputMainROOM_ID);
		int i = dsRMSM_MDM_ROOM_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}