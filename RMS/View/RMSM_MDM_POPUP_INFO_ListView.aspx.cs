using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_POPUP_INFO_ListView : System.Web.UI.Page
{
    public string JS = "";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
    string inputPOPUP_ID = "-1";
    string key = "POPUP_ID";
    private PopUpService service = new PopUpService();
    DataSet ds = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        //
        //Grid RMSM_MDM_POPUP_INFO_ListView 

        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["POPUP_ID"] != null && Request.QueryString["POPUP_ID"] != "-1")
        {
            inputPOPUP_ID = Request.QueryString["POPUP_ID"];
        }

        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("POPUP_ID", System.Data.DbType.Int32, inputPOPUP_ID);
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("POPUP_NAME", System.Data.DbType.String, string.Empty);
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("POPUP_MESSAGE", System.Data.DbType.String, string.Empty);
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("ROOM_ID", System.Data.DbType.String, string.Empty);
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("MENU_ID", System.Data.DbType.String, string.Empty);
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters.Add("POPUP_STATUS", System.Data.DbType.String, string.Empty);


        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["POPUP_NAME"].ConvertEmptyStringToNull = false;
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["POPUP_MESSAGE"].ConvertEmptyStringToNull = false;
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["POPUP_STATUS"].ConvertEmptyStringToNull = false;
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["ROOM_ID"].ConvertEmptyStringToNull = false;
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["MENU_ID"].ConvertEmptyStringToNull = false;
       
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        JS = "";
        if (Request.QueryString[key] != null && Request.QueryString[key] != "-1")
        {
            mode = "e";
        }
        if (!IsPostBack)
        {
            ctlPOPUP_STATUS.SelectedIndex = 0;
            //BindDefaultDataGridView();
            if (mode == "e")
                PopulateEditData();
            else if (mode == "n")
                PopulateNewData();

        }
    }
    private void BindDefaultDataGridView()
    {
        ds = new DataSet();
        ds = service.Select();
        Session["DataSet"] = ds;
        viewRMSM_MDM_POPUP_INFO_ListView.DataSource = ds;
        viewRMSM_MDM_POPUP_INFO_ListView.DataBind();
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

        SetValidation();
        SetFormatting();
    }

    void PopulateNewData()
    {
        //{PopulateNewDataStr}
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
        //{Insert}

        JS = "alert('Inserted');";
    }

    void Update()
    {
        //{Update}

        JS = "alert('Updated');";
    }

    //protected void viewRMSM_MDM_POPUP_INFO_ListView_Row_Command_Deleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    //{
    //   // int i = viewRMSM_MDM_POPUP_INFO_ListView.FindVisibleIndexByKeyValue(e.Keys[viewRMSM_MDM_POPUP_INFO_ListView.KeyFieldName]); 
    //    int i = viewRMSM_MDM_POPUP_INFO_ListView.FindVisibleIndexByKeyValue(e.Keys[viewRMSM_MDM_POPUP_INFO_ListView.KeyFieldName]);

       
    //    try
    //    {
    //        service.Delete(i);
    //    }
    //    catch (Exception)
    //    {

    //    }
    //}
    
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
      
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //viewRMSM_MDM_POPUP_INFO_ListView.DataSource = service.Search(ctlPOPUP_NAME.Text, ctlPOPUP_DETAIL.Text);
        //viewRMSM_MDM_POPUP_INFO_ListView.DataBind();
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["POPUP_NAME"].DefaultValue = ctlPOPUP_NAME.Text.Trim();
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["POPUP_MESSAGE"].DefaultValue = ctlPOPUP_DETAIL.Text.Trim();
        if (ctlROOM_ID.SelectedIndex > 0)
        {
            dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["ROOM_ID"].DefaultValue = ctlROOM_ID.SelectedItem.Value.ToString();
        

        }
        
        if (ctlMENU_ID.SelectedIndex > 0)
        {

            dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["MENU_ID"].DefaultValue = ctlMENU_ID.SelectedItem.Value.ToString();
        }
        dsRMSM_MDM_POPUP_INFO_ListView.SelectParameters["POPUP_STATUS"].DefaultValue = ctlPOPUP_STATUS.SelectedIndex.ToString();
        dsRMSM_MDM_POPUP_INFO_ListView.DataBind();
    
    }
}