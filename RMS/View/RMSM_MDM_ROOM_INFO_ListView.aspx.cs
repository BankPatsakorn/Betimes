using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_ROOM_INFO_ListView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputROOM_ID="-1";
	string key="ROOM_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_MDM_ROOM_INFO_ListView 
dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["ROOM_ID"] != null && Request.QueryString["ROOM_ID"] != "-1")
        {
            inputROOM_ID = Request.QueryString["ROOM_ID"];
        }

dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters.Add("ROOM_ID", System.Data.DbType.String, string.Empty);
dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters["ROOM_ID"].ConvertEmptyStringToNull = false;
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ctlROOM_ID.SelectedIndex > 0)
        {
            string index = ctlROOM_ID.SelectedItem.Value.ToString();
            dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters["ROOM_ID"].DefaultValue = index;
        }
        else
        {
            dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters.Clear();
            dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters.Add("ROOM_ID", System.Data.DbType.String, string.Empty);
            dsRMSM_MDM_ROOM_INFO_ListView.SelectParameters["ROOM_ID"].ConvertEmptyStringToNull = false;
        }
        dsRMSM_MDM_ROOM_INFO_ListView.DataBind();
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

		JS="alert('Inserted');";
    }

    void Update()
    {
        //{Update}

		JS="alert('Updated');";
    }


}