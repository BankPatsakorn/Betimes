using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_SERVICE_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainSERVICE_ID="-1";
	string key="SERVICE_ID";
    private ServiceInfoService service = new ServiceInfoService();


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_SERVICE_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["SERVICE_ID"] != null && Request.QueryString["SERVICE_ID"] != "-1")
        {
            inputMainSERVICE_ID = Request.QueryString["SERVICE_ID"];
        }
		dsRMSM_MDM_SERVICE_INFO_DetailView.SelectParameters.Add("SERVICE_ID", System.Data.DbType.Int32, inputMainSERVICE_ID);

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
            {
                ctlSERVICE_CODE.Text = service.GetServiceCode();
                PopulateNewData();
            }
                
            
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

		//RMSM_MDM_SERVICE_INFO_DetailView
		Title = "จัดการบริการการประชุม(RMS_UT0505)"; 
		DataView dv = (DataView)dsRMSM_MDM_SERVICE_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlSERVICE_CODE.Value = drv["SERVICE_CODE"].ToString();
        ctlSERVICE_CODE.Attributes.Add("disabled","disabled");

        ctlSERVICE_NAME.Value = drv["SERVICE_NAME"].ToString();

        ctlCOUNT_UNIT_ID.Value = drv["COUNT_UNIT_ID"].ToString();


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
        if (!string.IsNullOrEmpty(ctlSERVICE_NAME.Text))
        {
            try
            {
                service.Insert(ctlSERVICE_CODE.Text, ctlSERVICE_NAME.Text, ctlCOUNT_UNIT_ID.SelectedIndex + 1, DateTime.Now);

                JS = "alert('บันทึกข้อมูลสำเร็จ');";
                btnSave.Visible = false;
                btnBack.Visible = true;
            }
            catch (Exception)
            {
                JS = "alert('ไม่สามารถบันทึกข้อมูลได้');";

            }
        }
        //
        //dsRMSM_MDM_SERVICE_INFO_DetailView.InsertParameters.Clear();
        //dsRMSM_MDM_SERVICE_INFO_DetailView.InsertParameters.Add("SERVICE_CODE", System.Data.DbType.String, ctlSERVICE_CODE.Text);

        //dsRMSM_MDM_SERVICE_INFO_DetailView.InsertParameters.Add("SERVICE_NAME", System.Data.DbType.String, ctlSERVICE_NAME.Text);

        //if (ctlCOUNT_UNIT_ID.Value != null)
        //    dsRMSM_MDM_SERVICE_INFO_DetailView.InsertParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, ctlCOUNT_UNIT_ID.Value.ToString());
        //else
        //    dsRMSM_MDM_SERVICE_INFO_DetailView.InsertParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, null); 

        //int i = dsRMSM_MDM_SERVICE_INFO_DetailView.Insert();


        //JS="alert('Inserted');";
    }

    void Update()
    {
        //
        //dsRMSM_MDM_SERVICE_INFO_DetailView.UpdateParameters.Clear();
        //dsRMSM_MDM_SERVICE_INFO_DetailView.UpdateParameters.Add("SERVICE_CODE", System.Data.DbType.String, ctlSERVICE_CODE.Text);
        //dsRMSM_MDM_SERVICE_INFO_DetailView.UpdateParameters.Add("SERVICE_NAME", System.Data.DbType.String, ctlSERVICE_NAME.Text);
        //if (ctlCOUNT_UNIT_ID.Value != null)
        //    dsRMSM_MDM_SERVICE_INFO_DetailView.UpdateParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, ctlCOUNT_UNIT_ID.Value.ToString());
        //else
        //    dsRMSM_MDM_SERVICE_INFO_DetailView.UpdateParameters.Add("COUNT_UNIT_ID", System.Data.DbType.Int32, null); 
        //dsRMSM_MDM_SERVICE_INFO_DetailView.UpdateParameters.Add("SERVICE_ID", System.Data.DbType.Int32, inputMainSERVICE_ID);
        //int i = dsRMSM_MDM_SERVICE_INFO_DetailView.Update();


        //JS="alert('Updated');";
        try
        {
            service.Update(ctlSERVICE_CODE.Text, ctlSERVICE_NAME.Text, ctlCOUNT_UNIT_ID.SelectedIndex + 1, DateTime.Now);

            JS = "alert('แก้ไขข้อมูลสำเร็จ');";
        }
        catch (Exception)
        {
            JS = "alert('ไม่สามารถแก้ไขข้อมูลได้');";

        }
    }


}