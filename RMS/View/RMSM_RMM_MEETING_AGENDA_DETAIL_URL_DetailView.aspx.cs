using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainAGENDA_DETAIL_URL_ID="-1";
	string key="AGENDA_DETAIL_URL_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_DETAIL_URL_ID"] != null && Request.QueryString["AGENDA_DETAIL_URL_ID"] != "-1")
        {
            inputMainAGENDA_DETAIL_URL_ID = Request.QueryString["AGENDA_DETAIL_URL_ID"];
        }
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.SelectParameters.Add("AGENDA_DETAIL_URL_ID", System.Data.DbType.Int32, inputMainAGENDA_DETAIL_URL_ID);

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

		//RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView
		Title = "แนบ URL"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        ctlURL_LINK.Value = drv["URL_LINK"].ToString();

        ctlCREATE_DATE.Value = drv["CREATE_DATE"].ToString();
        ctlCREATE_DATE.Attributes.Add("disabled","disabled");


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
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.InsertParameters.Clear();
        dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.InsertParameters.Add("URL_LINK", System.Data.DbType.String, ctlURL_LINK.Text);

        dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.InsertParameters.Add("CREATE_DATE", System.Data.DbType.String, ctlCREATE_DATE.Text);

		int i = dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.UpdateParameters.Clear();
        dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.UpdateParameters.Add("URL_LINK", System.Data.DbType.String, ctlURL_LINK.Text);
        dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.UpdateParameters.Add("CREATE_DATE", System.Data.DbType.String, ctlCREATE_DATE.Text);
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.UpdateParameters.Add("AGENDA_DETAIL_URL_ID", System.Data.DbType.Int32, inputMainAGENDA_DETAIL_URL_ID);
		int i = dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.Update();


		JS="alert('Updated');";
    }


}