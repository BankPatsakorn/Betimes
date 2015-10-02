<%@ WebHandler Language="C#" Class="getPicRoom" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;
public class getPicRoom : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        mainClass mClass = new mainClass();
        string html = string.Empty;
        string str = @"select room_id,room_name,'../' + room_path room_path,
                     room_name + '' + 
                     case when isnull(convert(varchar(18),ROOM_WIDE),'') = '' then '' else 'กว้าง ' + isnull(convert(varchar(18),ROOM_WIDE),'') + ' ม. ' end + 
                     case when isnull(convert(varchar(18),ROOM_LONG),'') = '' then '' else 'ยาว ' + isnull(convert(varchar(18),ROOM_LONG),'') + ' ม. ' end + 
                     case when isnull(convert(varchar(18),ROOM_HIGH),'') = '' then '' else 'สูง ' + isnull(convert(varchar(18),ROOM_LONG),'') + ' ม. ' end + 
                     case when ISNULL(convert(varchar(18),ROOM_CAPACITY),'') = '' then '' else '  ความจุ ' + ISNULL(convert(varchar(18),ROOM_CAPACITY),'') + ' ที่นั่ง ' end DETAIL,
                     isnull(' เบอร์โทรห้อง ' + ROOM_TEL,'') ROOM_TEL,isnull(' ผู้รับผิดชอบห้อง ' + OST_ORG_STRUCT.PER_NAMES,'') PER_NAMES_HANDLE
                     from mt_room
                     left join dbo.getAttendeeAll() OST_ORG_STRUCT on mt_room.USER_HANDLE_ID = OST_ORG_STRUCT.ORG_STR_SEQ
	                 and OST_ORG_STRUCT.TYPE_PERSON =  mt_room.USER_HANDLE_TYPE";
        DataTable dt = mClass.GetDataTable(str);
        for (int i = 0; i < dt.Rows.Count; i += 2)
        {

            html = html + "<tr>";
            html = html + @"<td style='cursor:pointer' onclick=""getListMeetingByRoom(" + dt.Rows[i]["room_id"].ToString() + @",'" + dt.Rows[i]["room_name"].ToString()+ @"',1);"" class='layout-meetroom'>
      <img src='" + dt.Rows[i]["room_path"] + @"' height='72' title=""" + dt.Rows[i]["DETAIL"] + dt.Rows[i]["ROOM_TEL"] + dt.Rows[i]["PER_NAMES_HANDLE"] + @""" />
      <div class='tx-meetroom'>" + dt.Rows[i]["room_name"].ToString() + @"</div>
       </td>";
            if ((i + 1) < dt.Rows.Count)
            {
                html = html + @"<td style='cursor:pointer' onclick=""getListMeetingByRoom(" + dt.Rows[i + 1]["room_id"].ToString() + @",'" + dt.Rows[i + 1]["room_name"].ToString() + @"',1);"" class='layout-meetroom'>
      <img src='" + dt.Rows[i + 1]["room_path"] + @"' height='72' title=""" + dt.Rows[i+1]["DETAIL"] + dt.Rows[i+1]["ROOM_TEL"] + dt.Rows[i+1]["PER_NAMES_HANDLE"] + @"""/>
      <div class='tx-meetroom'>" + dt.Rows[i + 1]["room_name"].ToString() + @"</div>
       </td>";
            }
            html = html + "</tr>";
        }
        html = "<table width='90%' border='0' cellspacing='4' cellpadding='0'>" + html + "</table>";
        context.Response.Write(html);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}