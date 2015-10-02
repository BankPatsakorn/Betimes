<%@ WebHandler Language="C#" Class="get_meeting" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class get_meeting : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        mainClass cls = new mainClass();
        DataSet dtsMain = new DataSet();
        string strRoomID = context.Request.QueryString["RoomID"];
        string strMeetingID = context.Request.QueryString["MeetingId"];
        string strCondition = string.Empty;
        
        if (strRoomID != null && strRoomID != "กรุณาเลือก")
        {
            strCondition = " AND TR_MEETING_PERIOD.ROOM_ID = " + strRoomID;
        }
        
        if (string.IsNullOrEmpty(strMeetingID))
        {
            strMeetingID = "0";
        }
        
        string strSqlMain = string.Format(@"SELECT PERIOD_ID, PERIOD_DATE, PERIOD_START, PERIOD_STOP,
                                                CONVERT(datetime, (SUBSTRING(CONVERT(varchar(20), PERIOD_DATE, 120), 1, 10) + ' ' + REPLACE(CONVERT(varchar(5), PERIOD_START), '.', ':') + ':00:000')) DATE_TIMESTART,
                                                CONVERT(datetime, (SUBSTRING(CONVERT(varchar(20), PERIOD_DATE, 120), 1, 10) + ' ' + REPLACE(CONVERT(varchar(5), PERIOD_STOP), '.', ':') + ':00:000')) DATE_TIMEEND,
                                                TR_MEETING.MEETING_TITLE + ' ' + MT_ROOM.ROOM_NAME MEETING_NAME, GETDATE() AAA, GETDATE() + 1 BBB,
                                                CONVERT(varchar(10), TR_MEETING_PERIOD.PERIOD_START) + ' - ' + CONVERT(varchar(10), TR_MEETING_PERIOD.PERIOD_STOP) + ' ' + ISNULL(TR_MEETING.MEETING_TITLE, '') + ' ' + 
                                                ISNULL(TR_MEETING.MEETING_NAME, '') + ' ' + MT_ROOM.ROOM_NAME MEETING_DESCRITION, 
                                                'yellow' COLOR_, 'Blue' TEXT_COLOR, 
                                                CASE WHEN TR_MEETING.MEETING_ID = {0} THEN 'yellow' ELSE 'Linen' END  BACKGROUND_COLOR
                                            FROM TR_MEETING_PERIOD
                                                INNER JOIN TR_MEETING ON TR_MEETING_PERIOD.MEETING_ID = TR_MEETING.MEETING_ID 
                                                INNER JOIN MT_ROOM ON TR_MEETING_PERIOD.ROOM_ID = MT_ROOM.ROOM_ID
                                            WHERE TR_MEETING_PERIOD.DEL_FLAG = 'N' AND TR_MEETING.DEL_FLAG = 'N' {1}", strMeetingID, strCondition);

        dtsMain = cls.GetDataSet(strSqlMain, "TR_MEETING_PERIOD");

        IList<CalendarDTO> tasksList = new List<CalendarDTO>();

        if (dtsMain.Tables["TR_MEETING_PERIOD"].Rows.Count > 0)
        {
            foreach (DataRow dr in dtsMain.Tables["TR_MEETING_PERIOD"].Rows)
            {
                tasksList.Add(new CalendarDTO
                {
                    id = int.Parse(dr["PERIOD_ID"].ToString()),
                    title = dr["MEETING_NAME"].ToString(),
                    start = ConvertToTimestamp(DateTime.Parse(dr["DATE_TIMESTART"].ToString())),
                    end = ConvertToTimestamp(DateTime.Parse(dr["DATE_TIMEEND"].ToString())),
                    url = "",
                    allDay = false,
                    timeFormat = "",
                    color = dr["COLOR_"].ToString(),
                    textColor = dr["TEXT_COLOR"].ToString(),
                    backgroundColor = dr["BACKGROUND_COLOR"].ToString(),
                    description = dr["MEETING_DESCRITION"].ToString()
                });
            }
        }

        System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(tasksList);
        context.Response.Write(sJSON);
    }
    
    private double ConvertToTimestamp(DateTime value) 
    {
        var date = new DateTime(1970, 1, 1, 0, 0, 0, 0);      
        TimeSpan span = (value - date.ToLocalTime());      
  
        return (double)span.TotalSeconds; 
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    
    public class CalendarDTO
    {
        public int id { get; set; }
        public string title { get; set; }
        public double start { get; set; }
        public double end { get; set; }
        public string url { get; set; }
        public Boolean allDay { get; set; }
        public string color { get; set; }
        public string textColor { get; set; }
        public string backgroundColor { get; set; }
        public string timeFormat { get; set; }
        public string description { get; set; }
    } 

}