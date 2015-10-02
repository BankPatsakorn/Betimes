using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_dialogRoomSelection : System.Web.UI.Page
{
    public string id = "0";
    public string sDate = "";
    public string sNewDate = "";
    public string sRoom = "";
    public string sRoomScript = "";
    public string sDateShow = "";
    System.Globalization.CultureInfo ct = new System.Globalization.CultureInfo("en-US");
    //System.Globalization.CultureInfo ct = new System.Globalization.CultureInfo("th-TH");

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        sDate = Request.QueryString["date"];

        if (string.IsNullOrEmpty(id)) id = "0";

        if (!IsPostBack)
        {
            mainClass cls = new mainClass();
            DateTime dateShow = DateTime.Now;

            if (id != "0" && sDate == null)
            {
                System.Data.DataTable dtMeeting = cls.GetDataTable(@"SELECT MEETING_ID, MEETING_TITLE, ROOM_ID, ROOM_NAME, PERIOD_DATE_EN, PERIOD_START, PERIOD_STOP 
                                                                    FROM [dbo].[getMeetingAll]() 
                                                                    WHERE MEETING_ID = " + id + " ");

                if (dtMeeting.Rows[0]["PERIOD_DATE_EN"].ToString() != "")
                    dateShow = (DateTime)dtMeeting.Rows[0]["PERIOD_DATE_EN"];

                sDate = dateShow.ToString("yyyy-MM-dd", ct);

                Response.Redirect("dialogRoomSelection.aspx?id=" + id + "&date=" + sDate);
            }
            else if (!string.IsNullOrEmpty(sDate))
            {
                try
                {
                    dateShow = DateTime.Parse(sDate, ct);
                    if (dateShow.Year > 2500)
                    {
                        dateShow.AddYears(-543);
                    }
                }
                catch
                {
                    dateShow = DateTime.Now;
                }
                //dateShow = DateTime.Parse(sDate, ct);
            }

            sDate = dateShow.ToString("yyyy-MM-dd", ct);
            sNewDate = dateShow.ToString("yyyy", ct) + ", " + (dateShow.Month - 1) + ", " + dateShow.Day;
            //sDateShow = dateShow.ToString("d MMMM yyyy", ct);
            //sDateShow = dateShow.DayOfWeek.ToString() + " " + dateShow.ToString("d MMMM yyyy", ct);
            sDateShow = DayEN2TH(dateShow.DayOfWeek.ToString()) + " " + DateEN2TH(dateShow.Day, dateShow.Month, dateShow.Year);

            string sRoomTemplate = "{ key: %ID%, label: \"%LOCATION%\" },";
            System.Data.DataTable dt = cls.GetDataTable(@"SELECT  [ROOM_ID]
      ,[ROOM_CODE]
      ,[ROOM_NAME]
      ,[ROOM_CAPACITY]
  FROM [OPM_RMS].[dbo].[RMSM_MDM_ROOM_INFO] where RECORD_STATUS='A'");

            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                sRoom += sRoomTemplate.Replace("%ID%", dt.Rows[i]["ROOM_ID"].ToString()).Replace("%LOCATION%", dt.Rows[i]["ROOM_NAME"].ToString());
                sRoomScript += "if($(this).html()=='" + dt.Rows[i]["ROOM_NAME"].ToString() + 
                    "'){$(this).html(\"<span class='room room" + (i+1).ToString() +
                    "' style='float: left; margin-left: 5px'>" + dt.Rows[i]["ROOM_NAME"].ToString() +
                    "</span><span style='display: block; float: left; margin-left: 5px; '>ความจุ " +
                    dt.Rows[i]["ROOM_CAPACITY"].ToString() + " คน</span>\");}";
            }

            if (sRoom != "") sRoom = sRoom.Substring(0, sRoom.Length - 1);
        }
    }

    protected void btnPrev_Click(object sender, ImageClickEventArgs e)
    {
        btnPrev.ImageUrl = "../View/images/dataEvent.png";
        btnPrev.Width = 880;
        btnPrev.Height = 520;
        //DateTime dateShow = DateTime.Now;

        //if (Request.QueryString["date"] != null)
        //{
        //    dateShow = DateTime.Parse(Request.QueryString["date"].ToString());

        // // dateShow =  DateTime.ParseExact(Request.QueryString["date"], "ddd MMM dd HH:mm:ss zzzz yyyy", ct)
        //    //dateShow = DateTime.Parse(Request.QueryString["date"]);
        //}

        //dateShow = dateShow.AddDays(-1);
        //sDate = dateShow.ToString("yyyy-MM-dd", ct);
        //Response.Redirect("dialogRoomSelection.aspx?id=" + id + "&date=" + sDate);
    }

    protected void btnNext_Click(object sender, ImageClickEventArgs e)
    {
        DateTime dateShow = DateTime.Now;

        if (Request.QueryString["date"] != null && Request.QueryString["date"] != "")
        {
            dateShow = DateTime.Parse(Request.QueryString["date"].ToString());
            //dateShow = DateTime.Parse(Request.QueryString["date"]);
        }

        dateShow = dateShow.AddDays(1);
        sDate = dateShow.ToString("yyyy-MM-dd", ct);
        Response.Redirect("dialogRoomSelection.aspx?id=" + id + "&date=" + sDate);
    }

    private string DateEN2TH(int day, int month, int year)
    {
        string result = day.ToString();
        string monthName = string.Empty;

        switch (month)
        {
            case 1:
                monthName = "มกราคม";
                break;
            case 2:
                monthName = "กุมภาพันธ์";
                break;
            case 3:
                monthName = "มีนาคม";
                break;
            case 4:
                monthName = "เมษายน";
                break;
            case 5:
                monthName = "พฤษภาคม";
                break;
            case 6:
                monthName = "มิถุนายน";
                break;
            case 7:
                monthName = "กรกฎาคม";
                break;
            case 8:
                monthName = "สิงหาคม";
                break;
            case 9:
                monthName = "กันยายน";
                break;
            case 10:
                monthName = "ตุลาคม";
                break;
            case 11:
                monthName = "พฤศจิกายน";
                break;
            case 12:
                monthName = "ธันวาคม";
                break;
        }

        result += string.Format(" {0} {1}", monthName, (year + 543).ToString());

        return result;
    }

    private string DayEN2TH(string day)
    {
        string dayTH = string.Empty;

        switch (day)
        {
            case "Sunday":
                dayTH = "อาทิตย์";
                break;
            case "Monday":
                dayTH = "จันทร์";
                break;
            case "Tuesday":
                dayTH = "อังคาร";
                break;
            case "Wednesday":
                dayTH = "พุธ";
                break;
            case "Thursday":
                dayTH = "พฤหัสบดี";
                break;
            case "Friday":
                dayTH = "ศุกร์";
                break;
            case "Saturday":
                dayTH = "เสาร์";
                break;
        }
        
        return dayTH;
    }

}