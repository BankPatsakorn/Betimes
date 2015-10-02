using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_EQUIPMENT_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainEQUIPMENT_ID="-1";
	string key="EQUIPMENT_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_EQUIPMENT_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["EQUIPMENT_ID"] != null && Request.QueryString["EQUIPMENT_ID"] != "-1")
        {
            inputMainEQUIPMENT_ID = Request.QueryString["EQUIPMENT_ID"];
        }
		dsRMSM_MDM_EQUIPMENT_INFO_DetailView.SelectParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, inputMainEQUIPMENT_ID);

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

		//RMSM_MDM_EQUIPMENT_INFO_DetailView
		Title = "จัดการอุปกรณ์การประชุม(RMS_UT0503)"; 
		DataView dv = (DataView)dsRMSM_MDM_EQUIPMENT_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlEQUIPMENT_CODE.Value = drv["EQUIPMENT_CODE"].ToString();
        ctlEQUIPMENT_CODE.Attributes.Add("disabled","disabled");

        ctlEQUIPMENT_NAME.Value = drv["EQUIPMENT_NAME"].ToString();

        ctlCOUNT_UNIT_ID.Value = drv["COUNT_UNIT_ID"].ToString();

        if(drv["EQUIPMENT_PATH"].ToString()!=""){
            linkEQUIPMENT_PATH.Visible = true;
            linkEQUIPMENT_PATH.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings["UploadUrl"] + "/" + drv["EQUIPMENT_PATH"].ToString();
            linkEQUIPMENT_PATH.Text = drv["EQUIPMENT_PATH"].ToString();
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
		dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Clear();
        dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Add("EQUIPMENT_CODE", System.Data.DbType.String, ctlEQUIPMENT_CODE.Text);

        dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Add("EQUIPMENT_NAME", System.Data.DbType.String, ctlEQUIPMENT_NAME.Text);

        if (ctlCOUNT_UNIT_ID.Value != null)
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, ctlCOUNT_UNIT_ID.Value.ToString());
        else
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, null); 

        if (ctlEQUIPMENT_PATH.HasFile)
        {
            ctlEQUIPMENT_PATH.SaveAs(System.Configuration.ConfigurationManager.AppSettings["UploadPath"] + "\\" + ctlEQUIPMENT_PATH.FileName);
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Add("EQUIPMENT_PATH", System.Data.DbType.String, ctlEQUIPMENT_PATH.FileName);
        }
        else
        {
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.InsertParameters.Add("EQUIPMENT_PATH", System.Data.DbType.String, "");
        }

		int i = dsRMSM_MDM_EQUIPMENT_INFO_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Clear();
        dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("EQUIPMENT_CODE", System.Data.DbType.String, ctlEQUIPMENT_CODE.Text);
        dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("EQUIPMENT_NAME", System.Data.DbType.String, ctlEQUIPMENT_NAME.Text);
        if (ctlCOUNT_UNIT_ID.Value != null)
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, ctlCOUNT_UNIT_ID.Value.ToString());
        else
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, null); 
        if (ctlEQUIPMENT_PATH.HasFile)
        {
            ctlEQUIPMENT_PATH.SaveAs(System.Configuration.ConfigurationManager.AppSettings["UploadPath"] + "\\" + ctlEQUIPMENT_PATH.FileName);
            dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("EQUIPMENT_PATH", System.Data.DbType.String, ctlEQUIPMENT_PATH.FileName);
        }
        else
        {
            //dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("EQUIPMENT_PATH", System.Data.DbType.String, "");
        }

		dsRMSM_MDM_EQUIPMENT_INFO_DetailView.UpdateParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, inputMainEQUIPMENT_ID);
		int i = dsRMSM_MDM_EQUIPMENT_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}