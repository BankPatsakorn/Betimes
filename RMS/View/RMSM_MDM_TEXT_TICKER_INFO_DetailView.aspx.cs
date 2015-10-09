using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_TEXT_TICKER_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputTEXT_TICKER_ID="-1";
	string inputMainTEXT_TICKER_ID="-1";
	string key="TEXT_TICKER_ID";
    private TickerService service = new TickerService();

    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_MDM_TEXT_TICKER_INFO_ListView 
dsRMSM_MDM_TEXT_TICKER_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["TEXT_TICKER_ID"] != null && Request.QueryString["TEXT_TICKER_ID"] != "-1")
        {
            inputTEXT_TICKER_ID = Request.QueryString["TEXT_TICKER_ID"];
        }
dsRMSM_MDM_TEXT_TICKER_INFO_ListView.SelectParameters.Add("TEXT_TICKER_ID", System.Data.DbType.Int32, inputTEXT_TICKER_ID);
		dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["TEXT_TICKER_ID"] != null && Request.QueryString["TEXT_TICKER_ID"] != "-1")
        {
            inputMainTEXT_TICKER_ID = Request.QueryString["TEXT_TICKER_ID"];
        }
		dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.SelectParameters.Add("TEXT_TICKER_ID", System.Data.DbType.Int32, inputMainTEXT_TICKER_ID);

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
           
            setDefault();
            if (mode == "e")
                PopulateEditData();
            else if (mode == "n")
                PopulateNewData();
            
        }
    }
    private void setDefault()
    {
        ctlTEXT_STATUS.SelectedIndex = 0;
        ctlTEXT_SPEED.SelectedIndex = 1;
        ctlTEXT_SIZE.SelectedIndex = 1;
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

		//RMSM_MDM_TEXT_TICKER_INFO_DetailView
		Title = "จัดการตัววิ่ง(RMS_UT0509-1)"; 
		DataView dv = (DataView)dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlTEXT_DESC.Value = drv["TEXT_DESC"].ToString();

       // ctlTEXT_STATUS.Value = drv["TEXT_STATUS"].ToString();

      //  ctlTEXT_SPEED.Value = drv["TEXT_SPEED"].ToString();

        ctlTEXT_STATUS.SelectedIndex = int.Parse(drv["TEXT_STATUS"].ToString());
        ctlTEXT_SPEED.SelectedIndex = int.Parse(drv["TEXT_SPEED"].ToString());
        ctlTEXT_SIZE.SelectedIndex = int.Parse(drv["FONT_SIZE"].ToString());

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
        if (!string.IsNullOrEmpty(ctlTEXT_DESC.Text))
        {
            try
            {
                service.Insert(ctlTEXT_DESC.Text, ctlTEXT_STATUS.SelectedIndex , ctlTEXT_SPEED.SelectedIndex , ctlTEXT_SIZE.SelectedIndex, DateTime.Now);

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
        //dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.InsertParameters.Clear();
        //dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.InsertParameters.Add("TEXT_DESC", System.Data.DbType.String, ctlTEXT_DESC.Text);

        //if (ctlTEXT_STATUS.Value != null)
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.InsertParameters.Add("TEXT_STATUS", System.Data.DbType.Int32, ctlTEXT_STATUS.Value.ToString());
        //else
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.InsertParameters.Add("TEXT_STATUS", System.Data.DbType.Int32, null); 

        //if (ctlTEXT_SPEED.Value != null)
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.InsertParameters.Add("TEXT_SPEED", System.Data.DbType.Int32, ctlTEXT_SPEED.Value.ToString());
        //else
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.InsertParameters.Add("TEXT_SPEED", System.Data.DbType.Int32, null); 

        //int i = dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.Insert();


        //JS="alert('Inserted');";
    }

    void Update()
    {
        try
        {
            service.Update(inputMainTEXT_TICKER_ID,ctlTEXT_DESC.Text, ctlTEXT_STATUS.SelectedIndex, ctlTEXT_SPEED.SelectedIndex, ctlTEXT_SIZE.SelectedIndex, DateTime.Now);

            JS = "alert('แก้ไขข้อมูลสำเร็จ');";
            btnSave.Visible = false;
            btnBack.Visible = true;
        }
        catch (Exception)
        {
            JS = "alert('ไม่สามารถแก้ไขข้อมูลได้');";

        }
        //
        //dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Clear();
        //dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Add("TEXT_DESC", System.Data.DbType.String, ctlTEXT_DESC.Text);
        //if (ctlTEXT_STATUS.Value != null)
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Add("TEXT_STATUS", System.Data.DbType.Int32, ctlTEXT_STATUS.Value.ToString());
        //else
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Add("TEXT_STATUS", System.Data.DbType.Int32, null); 

        //if (ctlTEXT_SPEED.Value != null)
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Add("TEXT_SPEED", System.Data.DbType.Int32, ctlTEXT_SPEED.Value.ToString());
        //else
        //    dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Add("TEXT_SPEED", System.Data.DbType.Int32, null); 

        //dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.UpdateParameters.Add("TEXT_TICKER_ID", System.Data.DbType.Int32, inputMainTEXT_TICKER_ID);
        //int i = dsRMSM_MDM_TEXT_TICKER_INFO_DetailView.Update();


        //JS="alert('Updated');";
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        ctlTEXT_SPEED.SelectedIndex = -1;
        ctlTEXT_STATUS.SelectedIndex = -1;
        ctlTEXT_DESC.Text = "";
    }
}