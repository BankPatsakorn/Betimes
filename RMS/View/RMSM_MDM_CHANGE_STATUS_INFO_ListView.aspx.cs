using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_CHANGE_STATUS_INFO_ListView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputCHANGE_STATUS_ID="-1";
	string key="CHANGE_STATUS_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_MDM_CHANGE_STATUS_INFO_ListView 
dsRMSM_MDM_CHANGE_STATUS_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["CHANGE_STATUS_ID"] != null && Request.QueryString["CHANGE_STATUS_ID"] != "-1")
        {
            inputCHANGE_STATUS_ID = Request.QueryString["CHANGE_STATUS_ID"];
        }
dsRMSM_MDM_CHANGE_STATUS_INFO_ListView.SelectParameters.Add("CHANGE_STATUS_ID", System.Data.DbType.Int32, inputCHANGE_STATUS_ID);

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