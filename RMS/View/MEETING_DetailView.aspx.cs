using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MEETING_DetailView : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
	string inputMainROOM_ID="-1";
	string key="ROOM_ID";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
		//dsMEETING_DetailView.SelectParameters.Clear();
        if (Request.QueryString["ROOM_ID"] != null && Request.QueryString["ROOM_ID"] != "-1")
        {
            inputMainROOM_ID = Request.QueryString["ROOM_ID"];
        }
		//dsMEETING_DetailView.SelectParameters.Add("ROOM_ID", System.Data.DbType.Int32, inputMainROOM_ID);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //JS="";
        //if (Request.QueryString[key] != null && Request.QueryString[key] != "-1")
        //{
        //    mode = "e";
        //}
        //if (!IsPostBack)
        //{
        //    if (mode == "e")
        //        PopulateEditData();
        //    else if (mode == "n")
        //        PopulateNewData();
            
        //}
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
    //    //

    //    //MEETING_DetailView
    //    Title = "การประชุมของท่าน(RMS_UT0101)"; 
    //    DataView dv = (DataView)dsMEETING_DetailView.Select(DataSourceSelectArguments.Empty);
    //    DataRowView drv = dv[0];
    //    //ctlROOM_ID.Value = drv["ROOM_ID"].ToString();

    //    //ctlMONTH_ID.Value = drv["MONTH_ID"].ToString();


      //  SetValidation();
     //  SetFormatting();
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
        //dsMEETING_DetailView.InsertParameters.Clear();
        //if (ctlROOM_ID.Value != null)
        //    dsMEETING_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        //else
        //    dsMEETING_DetailView.InsertParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 

        //if (ctlMONTH_ID.Value != null)
        //    dsMEETING_DetailView.InsertParameters.Add("MONTH_ID", System.Data.DbType.Int32, ctlMONTH_ID.Value.ToString());
        //else
        //    dsMEETING_DetailView.InsertParameters.Add("MONTH_ID", System.Data.DbType.Int32, null); 

        //int i = dsMEETING_DetailView.Insert();


        //JS="alert('Inserted');";
    }

    void Update()
    {
        //
        //dsMEETING_DetailView.UpdateParameters.Clear();
        //if (ctlROOM_ID.Value != null)
        //    dsMEETING_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, ctlROOM_ID.Value.ToString());
        //else
        //    dsMEETING_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, null); 
        //if (ctlMONTH_ID.Value != null)
        //    dsMEETING_DetailView.UpdateParameters.Add("MONTH_ID", System.Data.DbType.Int32, ctlMONTH_ID.Value.ToString());
        //else
        //    dsMEETING_DetailView.UpdateParameters.Add("MONTH_ID", System.Data.DbType.Int32, null); 
        //dsMEETING_DetailView.UpdateParameters.Add("ROOM_ID", System.Data.DbType.Int32, inputMainROOM_ID);
        //int i = dsMEETING_DetailView.Update();


        //JS="alert('Updated');";
    }


}