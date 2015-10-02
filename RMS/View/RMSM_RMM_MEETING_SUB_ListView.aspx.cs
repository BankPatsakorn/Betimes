using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RMSM_RMM_MEETING_SUB_ListView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputAGENDA_SUB_ID="-1";
	string key="AGENDA_SUB_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
//Grid RMSM_RMM_MEETING_SUB_ListView 
dsRMSM_RMM_MEETING_SUB_ListView.SelectParameters.Clear();
        if (Request.QueryString["AGENDA_SUB_ID"] != null && Request.QueryString["AGENDA_SUB_ID"] != "-1")
        {
            inputAGENDA_SUB_ID = Request.QueryString["AGENDA_SUB_ID"];
        }
dsRMSM_RMM_MEETING_SUB_ListView.SelectParameters.Add("AGENDA_SUB_ID", System.Data.DbType.Int32, inputAGENDA_SUB_ID);

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