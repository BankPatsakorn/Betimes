using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RCS_REPORT : System.Web.UI.Page
{
	public string JS="";
    System.Globalization.CultureInfo ct_en = new System.Globalization.CultureInfo("en-US");
    string mode = "n";
    //
string inputCOMMAND_ID="-1";
	string key="COMMAND_ID";
    public string title = "";


    protected void Page_Init(object sender, EventArgs e)
    {
        //
        switch (Request.QueryString["id"].ToString())
        {
            case "1": title = "รายงานการใช้ห้องประชุม";
                img2.Visible = true;
                img1.Src = "../Images/2_1.jpg";
                img2.Src = "../Images/2_2.jpg";
                break;
            case "2": title = "รายงานสถิติการใช้ห้องประชุม(รายคน)";
                img2.Visible = true;
                img1.Src = "../Images/3_1.jpg";
                img2.Src = "../Images/3_2.jpg";
                break;
            case "3": title = "รายงานสถิติการใช้ห้องประชุม(รายหน่วยงาน)";
                img2.Visible = true;
                img1.Src = "../Images/4_1.jpg";
                img2.Src = "../Images/4_2.jpg";
                break;
            case "4": title = "รายงานสถิติการใช้ห้องประชุม";
                img2.Visible = true;
                img1.Src = "../Images/5_1.jpg";
                img2.Src = "../Images/5_2.jpg";
                break;
            case "5": title = "รายงานการใช้โสตทัศนูปกรณ์การประชุม";
                img2.Visible = true;
                img1.Src = "../Images/1_1.jpg";
                img2.Src = "../Images/1_2.jpg";
                break;
            case "6": title = "รายงายการใช้บริการการประชุม";
                img2.Visible = true;
                img1.Src = "../Images/6_1.jpg";
                img2.Src = "../Images/6_2.jpg";
                break;
            case "7": title = "รายงานการจองห้องประชุม";
                img2.Visible = true;
                img1.Src = "../Images/7_1.jpg";
                img2.Src = "../Images/7_2.jpg";
                break;
        }


    }
    protected void Page_Load(object sender, EventArgs e)
    {
		JS="";
        
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