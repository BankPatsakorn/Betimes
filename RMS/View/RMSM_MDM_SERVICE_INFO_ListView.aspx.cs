using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_MDM_SERVICE_INFO_ListView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputSERVICE_ID="-1";
	string key="SERVICE_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_MDM_SERVICE_INFO_ListView 
dsRMSM_MDM_SERVICE_INFO_ListView.SelectParameters.Clear();
        if (Request.QueryString["SERVICE_ID"] != null && Request.QueryString["SERVICE_ID"] != "-1")
        {
            inputSERVICE_ID = Request.QueryString["SERVICE_ID"];
        }
dsRMSM_MDM_SERVICE_INFO_ListView.SelectParameters.Add("SERVICE_ID", System.Data.DbType.Int32, inputSERVICE_ID);

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