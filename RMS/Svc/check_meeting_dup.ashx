<%@ WebHandler Language="C#" Class="check_meeting_dup" %>

using System;
using System.Web;
using System.Data;

public class check_meeting_dup : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        mainClass cls = new mainClass();
        DataSet dtsMain = new DataSet();
        string strMeetingID = context.Request.Form["id"];
        string strRoomID = context.Request.Form["roomId"];
        string strstartDate = context.Request.Form["startDate"];
        string strendDate = context.Request.Form["endDate"];
        string strstartTime = context.Request.Form["startTime"];
        string strendTime = context.Request.Form["endTime"];
        string[] arrStartDate;
        string[] arrEndDate;

        if (strRoomID == "กรุณาเลือก")
        {
            strRoomID = "0";
        }
        
        arrStartDate = strstartDate.Split('-');
        arrEndDate = strendDate.Split('-');
        strstartDate = (int.Parse(arrStartDate[2]) - 543).ToString() + "-" + arrStartDate[1] + "-" + arrStartDate[0];
        strendDate = (int.Parse(arrEndDate[2]) - 543).ToString() + "-" + arrEndDate[1] + "-" + arrEndDate[0];
        string strSqlMain = @"select dbo.CheckMeetingDuplicate(" + strMeetingID + "," + strRoomID + ",'" + strstartDate  + "','" + strstartTime + "','" + strendDate+ "','" + strendTime + "')";
        string strReturn = "";
        strReturn = cls.ExecuteSql(strSqlMain);
        cls.Dispose();
        cls = null;
        context.Response.Write(strReturn);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}