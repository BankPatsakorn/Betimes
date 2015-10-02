using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_EQUIPMENT_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainMEETING_EQUIPMENT_ID="-1";
	string key="MEETING_EQUIPMENT_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_EQUIPMENT_ID"] != null && Request.QueryString["MEETING_EQUIPMENT_ID"] != "-1")
        {
            inputMainMEETING_EQUIPMENT_ID = Request.QueryString["MEETING_EQUIPMENT_ID"];
        }
		dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.SelectParameters.Add("MEETING_EQUIPMENT_ID", System.Data.DbType.Int32, inputMainMEETING_EQUIPMENT_ID);

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

		//RMSM_RMM_MEETING_EQUIPMENT_DetailView
		Title = "โสตทัศนูปกรณ์"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlEQUIPMENT_ID.Value = drv["EQUIPMENT_ID"].ToString();

        ctlEQUIPMENT_AMOUNT.Value = drv["EQUIPMENT_AMOUNT"].ToString();

        ctlCOUNT_UNIT_NAME.Value = drv["COUNT_UNIT_NAME"].ToString();
        ctlCOUNT_UNIT_NAME.Attributes.Add("disabled","disabled");


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
		ctlEQUIPMENT_AMOUNT.HorizontalAlign = HorizontalAlign.Right;


    }

    void Insert()
    {
        //
        //dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.InsertParameters.Clear();
        //if (ctlEQUIPMENT_ID.Value != null)
        //    dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.InsertParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, ctlEQUIPMENT_ID.Value.ToString());
        //else
        //    dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.InsertParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, null); 

        //dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.InsertParameters.Add("EQUIPMENT_AMOUNT", System.Data.DbType.Int32, ctlEQUIPMENT_AMOUNT.Text);

        //dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.InsertParameters.Add("COUNT_UNIT_NAME", System.Data.DbType.String, ctlCOUNT_UNIT_NAME.Text);

        //int i = dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.Insert();


		JS="alert('Inserted');";
        btnSave.Visible = false;
        btnBack.Visible = true;
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.UpdateParameters.Clear();
        if (ctlEQUIPMENT_ID.Value != null)
            dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.UpdateParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, ctlEQUIPMENT_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.UpdateParameters.Add("EQUIPMENT_ID", System.Data.DbType.Int32, null); 
        dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.UpdateParameters.Add("EQUIPMENT_AMOUNT", System.Data.DbType.Int32, ctlEQUIPMENT_AMOUNT.Text);
        dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.UpdateParameters.Add("COUNT_UNIT_NAME", System.Data.DbType.String, ctlCOUNT_UNIT_NAME.Text);
		dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.UpdateParameters.Add("MEETING_EQUIPMENT_ID", System.Data.DbType.Int32, inputMainMEETING_EQUIPMENT_ID);
		int i = dsRMSM_RMM_MEETING_EQUIPMENT_DetailView.Update();


		JS="alert('Updated');";
    }


}