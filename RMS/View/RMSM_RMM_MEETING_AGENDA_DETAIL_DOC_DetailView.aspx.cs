using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainAGENDA_DETAIL_DOC="-1";
	string key="AGENDA_DETAIL_DOC";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_DETAIL_DOC"] != null && Request.QueryString["AGENDA_DETAIL_DOC"] != "-1")
        {
            inputMainAGENDA_DETAIL_DOC = Request.QueryString["AGENDA_DETAIL_DOC"];
        }
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.SelectParameters.Add("AGENDA_DETAIL_DOC", System.Data.DbType.Int32, inputMainAGENDA_DETAIL_DOC);

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

		//RMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView
		Title = "แนบเอกสารประกอบ"; 
		DataView dv = (DataView)dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.Select(DataSourceSelectArguments.Empty);
		DataRowView drv = dv[0];
        if(drv["DOC_TAG"].ToString()!=""){
            linkDOC_TAG.Visible = true;
            linkDOC_TAG.NavigateUrl = System.Configuration.ConfigurationManager.AppSettings["UploadUrl"] + "/" + drv["DOC_TAG"].ToString();
            linkDOC_TAG.Text = drv["DOC_TAG"].ToString();
        }

        ctlDOC_LOGICAL_NAME.Value = drv["DOC_LOGICAL_NAME"].ToString();

        ctlDOC_IMPORT_DATE.Value = drv["DOC_IMPORT_DATE"].ToString();
        ctlDOC_IMPORT_DATE.Attributes.Add("disabled","disabled");

        ctlDOC_TYPE_ID.Value = drv["DOC_TYPE_ID"].ToString();


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
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Clear();
        if (ctlDOC_TAG.HasFile)
        {
            ctlDOC_TAG.SaveAs(System.Configuration.ConfigurationManager.AppSettings["UploadPath"] + "\\" + ctlDOC_TAG.FileName);
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Add("DOC_TAG", System.Data.DbType.String, ctlDOC_TAG.FileName);
        }
        else
        {
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Add("DOC_TAG", System.Data.DbType.String, "");
        }

        dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Add("DOC_LOGICAL_NAME", System.Data.DbType.String, ctlDOC_LOGICAL_NAME.Text);

        dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Add("DOC_IMPORT_DATE", System.Data.DbType.String, ctlDOC_IMPORT_DATE.Text);

        if (ctlDOC_TYPE_ID.Value != null)
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Add("DOC_TYPE_ID", System.Data.DbType.Int32, ctlDOC_TYPE_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.InsertParameters.Add("DOC_TYPE_ID", System.Data.DbType.Int32, null); 

		int i = dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.Insert();


		JS="alert('Inserted');";
    }

    void Update()
    {
        //
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Clear();
        if (ctlDOC_TAG.HasFile)
        {
            ctlDOC_TAG.SaveAs(System.Configuration.ConfigurationManager.AppSettings["UploadPath"] + "\\" + ctlDOC_TAG.FileName);
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("DOC_TAG", System.Data.DbType.String, ctlDOC_TAG.FileName);
        }
        else
        {
            //dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("DOC_TAG", System.Data.DbType.String, "");
        }

        dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("DOC_LOGICAL_NAME", System.Data.DbType.String, ctlDOC_LOGICAL_NAME.Text);
        dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("DOC_IMPORT_DATE", System.Data.DbType.String, ctlDOC_IMPORT_DATE.Text);
        if (ctlDOC_TYPE_ID.Value != null)
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("DOC_TYPE_ID", System.Data.DbType.Int32, ctlDOC_TYPE_ID.Value.ToString());
        else
            dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("DOC_TYPE_ID", System.Data.DbType.Int32, null); 
		dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.UpdateParameters.Add("AGENDA_DETAIL_DOC", System.Data.DbType.Int32, inputMainAGENDA_DETAIL_DOC);
		int i = dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.Update();


		JS="alert('Updated');";
    }


}