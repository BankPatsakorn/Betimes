using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_CHANGE_STATUS_INFO_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainCHANGE_STATUS_ID="-1";
	string key="CHANGE_STATUS_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.SelectParameters.Clear();
        if (Request.QueryString["CHANGE_STATUS_ID"] != null && Request.QueryString["CHANGE_STATUS_ID"] != "-1")
        {
            inputMainCHANGE_STATUS_ID = Request.QueryString["CHANGE_STATUS_ID"];
        }
		dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.SelectParameters.Add("CHANGE_STATUS_ID", System.Data.DbType.Int32, inputMainCHANGE_STATUS_ID);

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

		//RMSM_MDM_CHANGE_STATUS_INFO_DetailView
		Title = "การเปลี่ยนสถานะห้องประชุม(RMS_UT0507)"; 
		DataView dv = (DataView)dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlROOM_ID.Value = drv["ROOM_ID"].ToString();

        if (drv["CHANGE_START_DATE"] != null && drv["CHANGE_START_DATE"] != DBNull.Value)
            ctlCHANGE_START_DATE.Date = (DateTime)drv["CHANGE_START_DATE"];

        if (drv["CHANGE_END_DATE"] != null && drv["CHANGE_END_DATE"] != DBNull.Value)
            ctlCHANGE_END_DATE.Date = (DateTime)drv["CHANGE_END_DATE"];

        //ctlCHANGE_STATUS.Value = drv["CHANGE_STATUS"].ToString();


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
      //  dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Clear();
      //  if (ctlROOM_ID.Value != null)
      //      dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
      //  else
      //      dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 

      //  if (ctlCHANGE_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
      //      dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add("CHANGE_START_DATE", System.Data.DbType.String, ctlCHANGE_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
      //  }
      //  else
      //  {
      //      var p = new Parameter() { Name = "CHANGE_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
      //      dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add(p);
      //  }

      //  if (ctlCHANGE_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
      //      dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add("CHANGE_END_DATE", System.Data.DbType.String, ctlCHANGE_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
      //  }
      //  else
      //  {
      //      var p = new Parameter() { Name = "CHANGE_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
      //      dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add(p);
      //  }

      // // if (ctlCHANGE_STATUS.Value != null)
      // //     dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add("CHANGE_STATUS", System.Data.DbType.Int32, ctlCHANGE_STATUS.Value.ToString());
      ////  else
      // //     dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.InsertParameters.Add("CHANGE_STATUS", System.Data.DbType.Int32, null); 

      //  int i = dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.Insert();


		JS="alert('Inserted');";
        btnSave.Visible = false;
        btnBack.Visible = true;
    }

    void Update()
    {
        //
        //dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Clear();
        //if (ctlROOM_ID.Value != null)
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        //else
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 
        //if (ctlCHANGE_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("CHANGE_START_DATE", System.Data.DbType.String, ctlCHANGE_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        //}
        //else
        //{
        //    var p = new Parameter() { Name = "CHANGE_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add(p);
        //}
        //if (ctlCHANGE_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("CHANGE_END_DATE", System.Data.DbType.String, ctlCHANGE_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        //}
        //else
        //{
        //    var p = new Parameter() { Name = "CHANGE_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add(p);
        //}
        //if (ctlCHANGE_STATUS.Value != null)
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("CHANGE_STATUS", System.Data.DbType.Int32, ctlCHANGE_STATUS.Value.ToString());
        //else
        //    dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("CHANGE_STATUS", System.Data.DbType.Int32, null); 
        //dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.UpdateParameters.Add("CHANGE_STATUS_ID", System.Data.DbType.Int32, inputMainCHANGE_STATUS_ID);
        //int i = dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView.Update();


		JS="alert('Updated');";
    }


}