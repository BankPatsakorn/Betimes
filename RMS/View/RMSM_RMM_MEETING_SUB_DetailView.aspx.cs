﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_SUB_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainAGENDA_SUB_ID="-1";
	string key="AGENDA_SUB_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_RMM_MEETING_SUB_DetailView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_ID"] != null && Request.QueryString["AGENDA_SUB_ID"] != "-1")
        {
            inputMainAGENDA_SUB_ID = Request.QueryString["AGENDA_SUB_ID"];
        }
		dsRMSM_RMM_MEETING_SUB_DetailView.SelectParameters.Add("AGENDA_SUB_ID", System.Data.DbType.Int32, inputMainAGENDA_SUB_ID);

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

		//RMSM_RMM_MEETING_SUB_DetailView
		Title = ""; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_SUB_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlAGENDA_SUB_SEQ.Value = drv["AGENDA_SUB_SEQ"].ToString();

        ctlAGENDA_SUB_TOPIC.Value = drv["AGENDA_SUB_TOPIC"].ToString();

        ctlAGENDA_SUB_DESC.Text = drv["AGENDA_SUB_DESC"].ToString();

        ctlAGENDA_SUB_BOARD.Text = drv["AGENDA_SUB_BOARD"].ToString();


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
		ctlAGENDA_SUB_SEQ.DisplayFormatString = "n0";


    }

    void Insert()
    {
        //
		dsRMSM_RMM_MEETING_SUB_DetailView.InsertParameters.Clear();
        dsRMSM_RMM_MEETING_SUB_DetailView.InsertParameters.Add("AGENDA_SUB_SEQ", System.Data.DbType.Int32, ctlAGENDA_SUB_SEQ.Text);

        dsRMSM_RMM_MEETING_SUB_DetailView.InsertParameters.Add("AGENDA_SUB_TOPIC", System.Data.DbType.String, ctlAGENDA_SUB_TOPIC.Text);

        dsRMSM_RMM_MEETING_SUB_DetailView.InsertParameters.Add("AGENDA_SUB_DESC", System.Data.DbType.String, ctlAGENDA_SUB_DESC.Text);

        dsRMSM_RMM_MEETING_SUB_DetailView.InsertParameters.Add("AGENDA_SUB_BOARD", System.Data.DbType.String, ctlAGENDA_SUB_BOARD.Text);

		int i = dsRMSM_RMM_MEETING_SUB_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_SUB_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_SUB_DetailView.UpdateParameters.Add("AGENDA_SUB_SEQ", System.Data.DbType.Int32, ctlAGENDA_SUB_SEQ.Text);
        dsRMSM_RMM_MEETING_SUB_DetailView.UpdateParameters.Add("AGENDA_SUB_TOPIC", System.Data.DbType.String, ctlAGENDA_SUB_TOPIC.Text);
        dsRMSM_RMM_MEETING_SUB_DetailView.UpdateParameters.Add("AGENDA_SUB_DESC", System.Data.DbType.String, ctlAGENDA_SUB_DESC.Text);
        dsRMSM_RMM_MEETING_SUB_DetailView.UpdateParameters.Add("AGENDA_SUB_BOARD", System.Data.DbType.String, ctlAGENDA_SUB_BOARD.Text);
		dsRMSM_RMM_MEETING_SUB_DetailView.UpdateParameters.Add("AGENDA_SUB_ID", System.Data.DbType.Int32, inputMainAGENDA_SUB_ID);
		int i = dsRMSM_RMM_MEETING_SUB_DetailView.Update();


		JS="alert('Updated');";
    }


}