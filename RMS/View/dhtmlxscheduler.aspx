<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dhtmlxscheduler.aspx.cs" Inherits="view_dhtmlxscheduler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Scripts/dhtmlxscheduler_v40/dhtmlxscheduler.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.4.1.js"></script>
    <script src="../Scripts/dhtmlxscheduler_v40/dhtmlxscheduler.js"></script>
    <script src="../Scripts/dhtmlxscheduler_v40/locale/locale_th.js"></script>
    <style type="text/css" media="screen">
        html, body {
            margin: 0px;
            padding: 0px;
            height: 100%;
            overflow: hidden;
        }
        .dhx_cal_prev_button {
            border: none;
            background-image: url(../Images/icons/rnd_br_prev24.png)
        }
        .dhx_cal_next_button {
            border: none;
            background-image: url(../Images/icons/rnd_br_next24.png)
        }
    </style>
    <script type="text/javascript" charset="utf-8">
        function init() {
            var view = GetValueQueryString("view");

            scheduler.config.readonly = true;
            scheduler.config.xml_date = "%Y-%m-%d %H:%i";
            scheduler.config.first_hour = 8.00;
            scheduler.config.last_hour = 20.30;
            scheduler.init('scheduler_here', new Date(), view);
            scheduler.load("../Svc/dataEventAll.ashx?pid=<%=pid %>");
            scheduler.attachEvent("onClick", function (id, e) {
                parent.window.location = "viewMeeting.aspx?id=" + id + "&m=view";
            });
        }

        function GetValueQueryString(key, default_) {
            if (default_ == null)
                default_ = "";
            key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
            var qs = regex.exec(window.location.href);
            if (qs == null)
                return default_;
            else
                return qs[1];
        }
    </script>
</head>
<body onload="init();">
    <div id="scheduler_here" class="dhx_cal_container" style='width: 100%; height: 100%;'>
        <div class="dhx_cal_navline">
            <div class="dhx_cal_prev_button">&nbsp;</div>
            <div class="dhx_cal_next_button">&nbsp;</div>
            <div class="dhx_cal_today_button" style="display: none;"></div>
            <div class="dhx_cal_date"></div>
            <div class="dhx_cal_tab" name="day_tab" style="right: 204px; display: none;"></div>
            <div class="dhx_cal_tab" name="week_tab" style="right: 140px; display: none;"></div>
            <div class="dhx_cal_tab" name="month_tab" style="right: 76px; display: none;"></div>
        </div><%--<div style='float:right'>
<span style='font-size:small;font-weight:bold'>สัญลักษณ์การนัดหมาย</span>
<span style='font-size:small;background-color:#0199Cb' class='room_icon'>ส่วนตัว</span>
<span style='font-size:small;background-color:#ff6600' class='room_icon'>รอยืนยัน</span>
<span style='font-size:small;background-color:#339933' class='room_icon'>ยืนยันเข้าประชุม</span>
<span style='font-size:small;background-color:#66cc00' class='room_icon'>ให้คนอื่นไปแทน</span>
<span style='font-size:small;background-color:#CCCCCC' class='room_icon'>ไม่เข้าประชุม</span>
</div>--%>
        <div class="dhx_cal_header">
            
        </div>
        <div class="dhx_cal_data"></div>
    </div>
</body>
</html>