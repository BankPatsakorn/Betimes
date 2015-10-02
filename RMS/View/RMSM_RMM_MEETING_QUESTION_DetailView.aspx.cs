using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_QUESTION_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputMEETING_ID="-1";
	string inputMainMEETING_ID="-1";
	string key="MEETING_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_RMM_MEETING_QUESTION_ListView 
dsRMSM_RMM_MEETING_QUESTION_ListView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_ID"] != null && Request.QueryString["MEETING_ID"] != "-1")
        {
            inputMEETING_ID = Request.QueryString["MEETING_ID"];
        }
dsRMSM_RMM_MEETING_QUESTION_ListView.SelectParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMEETING_ID);
		dsRMSM_RMM_MEETING_QUESTION_DetailView.SelectParameters.Clear();
        if (Request.QueryString["MEETING_ID"] != null && Request.QueryString["MEETING_ID"] != "-1")
        {
            inputMainMEETING_ID = Request.QueryString["MEETING_ID"];
        }
		dsRMSM_RMM_MEETING_QUESTION_DetailView.SelectParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMainMEETING_ID);

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

		//RMSM_RMM_MEETING_QUESTION_DetailView
		Title = "สอบถามเรื่องที่ประชุม"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_QUESTION_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlROOM_ID.Value = drv["ROOM_ID"].ToString();

        ctlMEETING_SUBJECT.Value = drv["MEETING_SUBJECT"].ToString();

        ctlBOARD_ID.Value = drv["BOARD_ID"].ToString();
        ctlBOARD_ID_label.Text = drv[""].ToString();

        if (drv["MEETING_REQUEST_START_DATE"] != null && drv["MEETING_REQUEST_START_DATE"] != DBNull.Value)
            ctlMEETING_REQUEST_START_DATE.Date = (DateTime)drv["MEETING_REQUEST_START_DATE"];

        if (drv["MEETING_REQUEST_END_DATE"] != null && drv["MEETING_REQUEST_END_DATE"] != DBNull.Value)
            ctlMEETING_REQUEST_END_DATE.Date = (DateTime)drv["MEETING_REQUEST_END_DATE"];


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
		dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Clear();
        if (ctlROOM_ID.Value != null)
            dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 

        dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add("MEETING_SUBJECT", System.Data.DbType.String, ctlMEETING_SUBJECT.Text);

        dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add("BOARD_ID", System.Data.DbType.String, ctlBOARD_ID.Value);

        if (ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add("MEETING_REQUEST_START_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "MEETING_REQUEST_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add(p);
        }

        if (ctlMEETING_REQUEST_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add("MEETING_REQUEST_END_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "MEETING_REQUEST_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsRMSM_RMM_MEETING_QUESTION_DetailView.InsertParameters.Add(p);
        }

		int i = dsRMSM_RMM_MEETING_QUESTION_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Clear();
        if (ctlROOM_ID.Value != null)
            dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 
        dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("MEETING_SUBJECT", System.Data.DbType.String, ctlMEETING_SUBJECT.Text);
        dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("BOARD_ID", System.Data.DbType.String, ctlBOARD_ID.Value);
        if (ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("MEETING_REQUEST_START_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_START_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "MEETING_REQUEST_START_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add(p);
        }
        if (ctlMEETING_REQUEST_END_DATE.Date.ToString("yyyy-MM-dd", ct_en) != "0001-01-01"){
            dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("MEETING_REQUEST_END_DATE", System.Data.DbType.String, ctlMEETING_REQUEST_END_DATE.Date.ToString("yyyy-MM-dd", ct_en));
        }
        else
        {
            var p = new Parameter() { Name = "MEETING_REQUEST_END_DATE", DbType = System.Data.DbType.DateTime, DefaultValue = string.Empty, ConvertEmptyStringToNull = true };
            dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add(p);
        }
		dsRMSM_RMM_MEETING_QUESTION_DetailView.UpdateParameters.Add("MEETING_ID", System.Data.DbType.Int32, inputMainMEETING_ID);
		int i = dsRMSM_RMM_MEETING_QUESTION_DetailView.Update();


		JS="alert('Updated');";
    }


}