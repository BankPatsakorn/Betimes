<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dialogRoomSelection.aspx.cs" Inherits="view_dialogRoomSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/e-office.css" rel="stylesheet" />
    <link href="../Scripts/dhtmlxscheduler/dhtmlxscheduler.css" rel="stylesheet" />
    <link href="../Scripts/qtip/jquery.qtip.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="../Scripts/dhtmlxscheduler/dhtmlxscheduler_th.js"></script>
    <script type="text/javascript" src="../Scripts/dhtmlxscheduler/ext/dhtmlxscheduler_collision.js"></script>
    <script type="text/javascript" src="../Scripts/dhtmlxscheduler/ext/dhtmlxscheduler_units.js"></script>
    <script type="text/javascript" src="../Scripts/qtip/jquery.qtip.min.js"></script>
    <script type="text/javascript">
        var MeetingId;
        var NewEventId;
        var sDate;

        $(document).ready(function () {
            init();
        });

        function init() {
            MeetingId = <%=id %>;
            NewEventId = 0;
            sDate = "<%=sDate %>";

            var sections = [
			    <%=sRoom %>
            ];

            var days = [
                { key: 0, label: '-เลือก-' },
				{ key: 1, label: 'วันอาทิตย์' },
				{ key: 2, label: 'วันจันทร์' },
				{ key: 3, label: 'วันอังคาร' },
				{ key: 4, label: 'วันพุธ'},
                {key: 5, label: 'วันพฤหัสบดี'},
                {key: 6, label: 'วันศุกร์'},
            {key: 7, label: 'วันเสาร์'}
            ];            var priorities = [
    { key: 1, label: 'High' },
    { key: 2, label: 'Medium' },
    { key: 3, label: 'Low' }
            ];
            scheduler.locale.labels.section_priority = 'Priority';
            scheduler.locale.labels.unit_tab = "Locations"
            scheduler.locale.labels.section_custom = "ห้อง";
            scheduler.locale.labels.section_days = "วัน";
            // scheduler.locale.labels.section_days = "วัน";
            scheduler.config.hour_size_px = 42;
            scheduler.config.time_step = 30;
            scheduler.config.details_on_create = true;
            scheduler.config.details_on_dblclick = true;
            scheduler.config.first_hour = 8.00;
            scheduler.config.last_hour = 20.30;
            scheduler.config.collision_limit = 10;
            scheduler.xy.scale_height = 35;
            scheduler.xy.menu_width = 0;
            scheduler.config.xml_date = "%Y-%m-%d %H:%i";
            scheduler.xy.nav_height = 0;
            scheduler.config.lightbox.sections = [
                { name: "custom", height: 23, type: "select", options: sections, map_to: "section_id" }
                ,{ name: "days", height: 23, type: "select", options: days, map_to: "days_id" },
                { name:"priority", height:58, options:priorities,  map_to:"priority", type:"radio", vertical:true},

                //{ name: "description", height: 25, map_to: "text", type: "radio" },
               { name: "time", height: 72, type: "time", map_to: "auto" }
            ];

            scheduler.attachEvent("onViewChange", function (mode, date) {
                $('.dhx_scale_bar').each(function () {
                    <%=sRoomScript %>
                });
            });

            scheduler.attachEvent("onEventAdded", function (event_id, event_object) {
                SaveEvent(event_object);
            });

            scheduler.attachEvent("onEventChanged", function (event_id, event_object) {
                SaveEvent(event_object);
            });

            scheduler.createUnitsView({
                name: "unit",
                property: "section_id",
                list: sections
            });

            scheduler.config.multi_day = true;

            scheduler.init('scheduler_here', new Date(<%=sNewDate %>), "unit");
            scheduler.load("../Svc/dataEvent.ashx?sdate=" + sDate + "&id=" + MeetingId);
            //scheduler.load("../View/images/dataEvent.png");

            $('.dhx_scale_holder').each(function () {
                $(this).attr('tooltip', 'ลากเพื่อทำการจองห้อง');
                $(this).qtip({
                    content: $(this).attr('tooltip'),
                    position: {
                        my: 'left top',
                        target: 'mouse',
                        viewport: $(window),
                        adjust: {
                            x: 20, y: 10
                        }
                    }
                });
            });
        }

        
        function DateFormat(d) {
            var curr_date = d.getDate();
            var curr_month = d.getMonth() + 1; // months are zero based
            var curr_year = d.getFullYear();
            return curr_year + "-" + GetFormatDay(curr_month) + "-" + GetFormatDay(curr_date) + 'T'+ GetFormatDay(d.getHours()) + ':' + GetFormatDay(d.getMinutes()) + ':00';
        }

        function GetFormatDay(d) {
            if (d < 10)
                return '0' + d;
            else
                return '' + d;
        }

        function SaveEvent(event_object) {

            //alert(MeetingId);

            // alert(event_object.id+","+event_object.start_date+","+
            //event_object.end_date+","+MeetingId+","+event_object.section_id+","+event_object.text);
            // alert(event_object.days_id);

            if (event_object.id > 10000000 || event_object.id == MeetingId) {
                $.get("../Svc/svcRoomSave.ashx", { 
                    start: DateFormat(event_object.start_date), 
                    end: DateFormat(event_object.end_date),            
                    id: MeetingId,
                    location: event_object.section_id,
                    roomname: event_object.text,
                    workgroup: '0',
                    days:event_object.days_id
                }, function(data) {
                    //alert(data);
                    if (data == 'False') {
                        alert('ห้องไม่ว่าง ไม่สามารถจองห้องนี้ได้');
                        scheduler.load("../data/dataEvent.ashx?sdate=" + sDate + "&id=" + MeetingId);
                    } else {
                        parent.ReturnValue('true');
                    }
                });
            }
        }
    </script>
    <style type="text/css" media="screen">
        html, body
        {
            margin: 0px;
            padding: 0px;
            height: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color: #EEEEEE">
            <tr>
                <td style="width: 24px; background-color: #FFFFCD;">
                    <asp:ImageButton ID="btnPrev" runat="server" ImageUrl="../Images/icons/rnd_br_prev24.png" Style="border: none; background-color: #FFFFCD;" OnClick="btnPrev_Click" />
                </td>
                <td valign="middle" style="height: 50px; background-color: #FFFFCD; text-align: center">
                    <span style="font: normal bold 31px tahoma"><%=sDateShow %></span>
                </td>
                <td style="width: 24px; background-color: #FFFFCD;">
                    <asp:ImageButton ID="btnNext" runat="server" ImageUrl="../Images/icons/rnd_br_next24.png" Style="border: none; background-color: #FFFFCD;" OnClick="btnNext_Click" />
                </td>
            </tr>
        </table>
    </form>
    <div id="scheduler_here" class="dhx_cal_container" style='width: 100%; height: 90%;'>
        <div class="dhx_cal_navline" style="display: none">
            <div class="dhx_cal_prev_button">&nbsp;</div>
            <div class="dhx_cal_next_button">&nbsp;</div>
            <div class="dhx_cal_today_button"></div>
            <div class="dhx_cal_date"></div>
            <div class="dhx_cal_tab" name="unit_tab" style="right: 100px;"></div>
        </div>
        <div class="dhx_cal_header"></div>
        <div class="dhx_cal_data"></div>
    </div>
</body>
</html>
