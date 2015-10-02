<%@ Page Title="รายละเอียดการประชุม - ระบบบริหารการประชุม" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="periodMeeting.aspx.cs" Inherits="view_periodMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/table.css" rel="stylesheet" />
    <script type="text/javascript">
        var popupName;

        $(document).ready(function () {
            $('#a1').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    BindValue();
                }
            });

            $("#a-equipment").fancybox({
                'type': 'iframe',
                'width': 600,
                'height': 380,
                onClosed: function () {
                    BindValue();
                }
            });

            $("#a3").fancybox({
                'type': 'iframe',
                'width': 300,
                'height': 180
            });

            $('#a-calendar').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 625,
                onClosed: function () {
                    BindValue();
                }
            });

            $('#a-meeting-info').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 400,
                onClosed: function () {
                    BindValue();
                }
            });

            $('#a-meeting').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 400,
                onClosed: function () {
                    SetMeetingCont();
                }
            });

           
            $('#btnPostpone').click(function () {
                //window.location = 'postpone.aspx?id=' + GetValueQueryString('id');
                //CallFancyBox('dialogRoomSelection.aspx', 'calendar');
                //event.preventDefault();
                $.ajax({
                    type: "post",
                    url: "../Svc/emailChangeMeeting.ashx",
                    data: "id=" + $('#ContentPlaceHolder1_txtMeetingId').val(),
                    dataType: "text",
                    async: false,
                    success: function (result) {
                        alert(result);   
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(textStatus);
                    }
                });
            });

            $('#btnEmail').click(function () {
                $.ajax({
                    type: "post",
                    url: "../Svc/emailMeeting.ashx",
                    data: "id=" + $('#ContentPlaceHolder1_txtMeetingId').val(),
                    dataType: "text",
                    async: false,
                    success: function (result) {
                        alert(result);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(textStatus);
                    }
                });
            });

            $('#btnCancel').click(function () {
                $('#a-meeting-info').attr('href', 'modalMeetingCancel.aspx?id=' + GetValueQueryString('id'));
                $('#a-meeting-info').trigger('click');
                //event.preventDefault();
				event.returnValue = false;
                event.cancelBubble = true;
            });

            $('#btnAgendaMeeting').click(function () {
                window.location = 'genAgendaDoc.aspx?id=' + GetValueQueryString('id');
               // event.preventDefault();
			   event.returnValue = false;
                event.cancelBubble = true;
            });

            $('#btnSign').click(function () {
                window.location = 'genSignFormDoc.aspx?id=' + GetValueQueryString('id');
                event.returnValue = false;event.cancelBubble = true;
            });

            $('#btnAgendaMeeetingData').click(function () {
                window.location = 'agendaMeetingData.aspx?id=' + GetValueQueryString('id');
                event.returnValue = false;event.cancelBubble = true;
            });

            $('#btnAgendaStatus').click(function () {
                window.open('agendaStatus.aspx?id=' + GetValueQueryString('id'), '_blank');
                event.returnValue = false;event.cancelBubble = true;
            });

            $('#btnAgendaMonitor').click(function () {
                window.open('agendaMonitor.aspx?id=' + GetValueQueryString('id'), '_blank');
                event.returnValue = false;event.cancelBubble = true;
            });

            $('#btnSelectHeader').click(function () {
                CallFancyBox('dialogUserSelection.aspx?user=2', 'header');
            });

            $('#btnSelectWorkgroup').click(function () {
                CallFancyBox('dialogWorkGroupSelection.aspx?user=1', 'workgroup');
                event.returnValue = false;event.cancelBubble = true;
            });

            $('#btnSelectRequestBy').click(function () {
                CallFancyBox('dialogUserSelection.aspx?user=3', 'request');
            });

           // var id = txtMeetingStartDate.ClientID;
            //alert(id);
            var id = "";
            $('#btnSelectRoom').click(function () {
               
                CallFancyBox('dialogRoomSelection.aspx', 'calendar');
            });
            //id = txtMeetingEndDate.ClientID;
            //alert(id);
            $('#btnSelectRoom2').click(function () {
               
                CallFancyBox('dialogRoomSelection.aspx', 'calendar2');
            });
            $('#btnAddEquip').click(function () {
                CallFancyBox('dialogEquipmentSelection.aspx', 'equipment');
                event.returnValue = false;event.cancelBubble = true;
            });

            $('#imgMeetingCont').css('display', 'none');
            $('#ContentPlaceHolder1_chkMeetingCont').change(function () {
                if (this.checked) {
                    $('#imgMeetingCont').css('display', 'inline');
                } else {
                    $('#imgMeetingCont').css('display', 'none');

                    $('#ContentPlaceHolder1_txtMeetingCont').val('');
                    $('#ContentPlaceHolder1_txtMeetingIdCont').val('');
                }
            });

            SetMeetingMenu();
            SetPermission();
        });

        function CallFancyBox(url, popup) {
            var id = GetValueQueryString('id');
            popupName = popup;

            if (popupName == 'header' || popupName == 'request' || popupName == 'reserve' || popupName == 'org' || popupName == 'workgroup') {
                $('#a1').attr('href', url);
                $('#a1').trigger('click');
            } else if (popupName == 'equipment') {
                $('#a-equipment').attr('href', url + '?id=' + id);
                $('#a-equipment').trigger('click');
            } else if (popupName == 'editNo') {
                $('#a3').attr('href', url);
                $('#a3').trigger('click');
            } else if (popupName == 'calendar') {
                var strDate = $('#ContentPlaceHolder1_txtMeetingDate').val();
                url = url + '?id=' + id + '&date=' + strDate;
                //alert("date=="+url);
                //console.log(url);
                $('#a-calendar').attr('href', url);
                $('#a-calendar').trigger('click');
            } else if (popupName == 'calendar2') {
                var enDate = $('#ContentPlaceHolder1_txtMeetingEndDate').val();
                //alert("enDate=" + enDate);
                url = url + '?id=' + id + '&date=' + enDate;
                //console.log(url);
                $('#a-calendar').attr('href', url);
                $('#a-calendar').trigger('click');
            }
        }

        function SetPermission() {
            if ($('#ContentPlaceHolder1_txtPermission').val() == 'false') {
                $('#ContentPlaceHolder1_taMeetingTitle').addClass('readonly');
                $('#ContentPlaceHolder1_txtMeetingCapacity').addClass('readonly');
                $('#ContentPlaceHolder1_ddlORG').addClass('readonly');
                $('#ContentPlaceHolder1_ddlService').addClass('readonly');
                $('#btnAddEquip').css('display', 'none');
                $('#btnSelectMeeting').css('display', 'none');
                $('.action-div').css('display', 'none');

                $('#btnSelectHeader').attr('disabled', 'disabled');
                $('#btnSelectRequestBy').attr('disabled', 'disabled');
                $('#btnSelectRoom').attr('disabled', 'disabled');
            }

            if ($('#ContentPlaceHolder1_txtMeetingId').val() == '0') {
                $('.menu-act-div').css('display', 'none');
                $('#style_selector').css('display', 'none');

                DisableLink('a-meeting-agenda');
                DisableLink('a-meeting-attendee');
                DisableLink('a-meeting-task');
            }
        }

        function DisableLink(id) {
            var $obj = $('#' + id);
            $obj.parent().addClass('disabled');
            $obj.attr('href', 'javascript:;');
        }

        function BindValue() {
            if (returnValue == '') return;
            arrItem = returnValue.split('^');

            if (popupName == 'header') {
                if (arrItem.length >= 4) {
                    $('#ContentPlaceHolder1_txtHeaderId').val(arrItem[0]);
                    $('#ContentPlaceHolder1_txtHeader').val(arrItem[1]);
                }
            } else if (popupName == 'request') {
                if (arrItem.length >= 4) {
                    $('#ContentPlaceHolder1_txtRequestId').val(arrItem[0]);
                    $('#ContentPlaceHolder1_txtRequestBy').val(arrItem[1]);
                    $('#ContentPlaceHolder1_txtRequestByPosition').val(arrItem[2]);
                    $('#ContentPlaceHolder1_txtRequestByTelephone').val(arrItem[4]);
                }
            } else if (popupName == 'reserve') {
                if (arrItem.length >= 4) {
                    $('#ContentPlaceHolder1_txtReverseId').val(arrItem[0]);
                    $('#ContentPlaceHolder1_txtReserveBy').val(arrItem[1]);
                    $('#ContentPlaceHolder1_txtReserveByPosition').val(arrItem[2]);
                    $('#ContentPlaceHolder1_txtReserveByTelephone').val(arrItem[4]);
                }
            } else if (popupName == 'org') {
                $('#ContentPlaceHolder1_ddlORG').val(returnValue);
            } else if (popupName == 'equipment') {
                var arrItemSet = returnValue.split("#");
                for (var i = 0; i < arrItemSet.length; i++) {
                    arrItem = arrItemSet[i].split('^');

                    if (arrItem.length == 1) continue;

                    var checkId = true;
                    var trs = $('#tableEquip tbody tr');
                    var val = '';

                    for (var j = 0; j < trs.length; j++) {
                        var tds = $(trs[j]).find('td');
                        val = tds[4].innerHTML;
                        if (arrItem[0] == val) {
                            checkId = false;
                            break;
                        }
                    }

                    if (checkId) {
                        var items = [];
                        items.push("<tr>");
                        items.push("<td><a href='javascript:void(0)' onclick='DeleteItem(\"{0}\", \"" + arrItem[0] + "\")'><span class='glyphicon glyphicon-remove'></span></a></td>");
                        items.push("<td>" + arrItem[1] + "</td>");
                        items.push("<td><input type='text' id='txtEquipQuantity_" + arrItem[0] + "' value='1' class='form-control' /></td>");
                        if (arrItem[2] != null) {
                            items.push("<td>" + arrItem[2] + "</td>");
                        } else {
                            items.push("<td></td>");
                        }
                        items.push("<td style='display: none;'>" + arrItem[0] + "</td>");
                        items.push("<td style='display: none;'></td>");
                        items.push("</tr>");

                        InsertRow(items.join(""));
                        SetTableEquipVal();
                    }
                }
            } else if (popupName == 'editNo') {
            } else if (popupName == 'calendar') {
                $.ajax({
                    type: "post",
                    url: "../Svc/getRoomPeriod.ashx",
                    data: "id=" + $('#ContentPlaceHolder1_txtMeetingId').val(),
                    dataType: "text",
                    async: false,
                    success: function (result) {
                        var dates = result.split('@');
                        result = dates[0];
                        arrItem = result.split('^');
                      //  alert("dates= " + dates + " arrItem = " + arrItem);
                       // alert(result + " ==" + arrItem.length);
                        if (arrItem.length == 3) {
                            $('#ContentPlaceHolder1_txtRoom').val(arrItem[1]);
                            //var dateTotal = arrItem[2].split('@');
                            //alert(dateTotal[0]);
                            $('#ContentPlaceHolder1_txtMeetingStartDate').val(arrItem[2]);
                            var dateEnd = dates[1].split('^');
                          //  alert(dateEnd[2]);
                            $('#ContentPlaceHolder1_txtMeetingEndDate').val(dateEnd[2]);

                            SetServiceByRoom(arrItem[0]);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(textStatus);
                    }
                });
            } else if (popupName == 'calendar2') {
                $.ajax({
                    type: "post",
                    url: "../Svc/getRoomPeriod.ashx",
                    data: "id=" + $('#ContentPlaceHolder1_txtMeetingId').val(),
                    dataType: "text",
                    async: false,
                    success: function (result) {
                        arrItem = result.split('^');
                        if (arrItem.length == 3) {
                            $('#ContentPlaceHolder1_txtRoom').val(arrItem[1]);
                           // alert("test==" + arrItem[2]);
                            $('#ContentPlaceHolder1_txtMeetingEndDate').val(arrItem[2]);

                            SetServiceByRoom(arrItem[0]);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(textStatus);
                    }
                });
            }

            else if (popupName == 'workgroup') {

                if (arrItem.length >= 4) {
                    $('#ContentPlaceHolder1_txtHeaderId').val(arrItem[0]);
                    $('#ContentPlaceHolder1_txtHeader').val(arrItem[1]);
                    $('#ContentPlaceHolder1_txtMeetingCapacity').val(arrItem[6]);
                    $('#ContentPlaceHolder1_txtMeetingDate').val(arrItem[7]);
                    $('#ContentPlaceHolder1_workgroupid').val(arrItem[8]);
                    $('#ContentPlaceHolder1_txtRoom').val(arrItem[9]);
                }

                //$.ajax({
                //    type: "post",
                //    url: "../Svc/getRoomPeriod.ashx",
                //    data: "id=" + $('#ContentPlaceHolder1_txtMeetingId').val(),
                //    dataType: "text",
                //    async: false,
                //    success: function (result) {
                //        var data = result.split('^');
                //        if (data.length == 3) {
                //            //$('#ContentPlaceHolder1_txtRoom').val(data[1]);
                //            $('#ContentPlaceHolder1_txtMeetingStartDate').val(data[2]);

                //            SetServiceByRoom(data[0]);
                //        }
                //    },
                //    error: function (jqXHR, textStatus, errorThrown) {
                //        //console.log(textStatus);
                //    }
                //});

                $.ajax({
                    type: "post",
                    url: "../Svc/getRoomPeriod.ashx",
                    data: "id=" + $('#ContentPlaceHolder1_txtMeetingId').val(),
                    dataType: "text",
                    async: false,
                    success: function (result) {
                        var dates = result.split('@');
                        result = dates[0];
                        arrItem = result.split('^');
                        //  alert("dates= " + dates + " arrItem = " + arrItem);
                        // alert(result + " ==" + arrItem.length);
                        if (arrItem.length == 3) {
                            $('#ContentPlaceHolder1_txtRoom').val(arrItem[1]);
                            //var dateTotal = arrItem[2].split('@');
                            //alert(dateTotal[0]);
                            $('#ContentPlaceHolder1_txtMeetingStartDate').val(arrItem[2]);
                            var dateEnd = dates[1].split('^');
                            //  alert(dateEnd[2]);
                            $('#ContentPlaceHolder1_txtMeetingEndDate').val(dateEnd[2]);

                            SetServiceByRoom(arrItem[0]);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(textStatus);
                    }
                });
            }

            returnValue = '';
        }

        function SetMeetingCont() {
            if (returnValue == '') return;

            arrItem = returnValue.split('^');

            if (arrItem.length >= 3) {
                if (arrItem[1].indexOf("ครั้งที่") >= 0) {
                    $('#ContentPlaceHolder1_taMeetingTitle').val(arrItem[1]);
                } else {
                    $('#ContentPlaceHolder1_taMeetingTitle').val(arrItem[1] + ' (ครั้งที่...)');
                }
                
                $('#ContentPlaceHolder1_txtMeetingCont').val(arrItem[1]);

                $('#ContentPlaceHolder1_txtHeaderId').val(arrItem[5]);
                $('#ContentPlaceHolder1_txtHeader').val(arrItem[6]);
                $('#ContentPlaceHolder1_txtMeetingCapacity').val(arrItem[7]);

                $('#ContentPlaceHolder1_txtMeetingIdCont').val(arrItem[0]);
            }

            returnValue = '';
        }

        function ValidateScreen() {
            SetTableEquipVal();

            var flag = false;

            if ($('#ddlService1 option:selected').index() == 0) {
                $('#ContentPlaceHolder1_txtServiceId').val($('#ddlService1 option:selected').val());
            }

            if ($('#ContentPlaceHolder1_taMeetingTitle').val() == '') {
                alert('กรุณาระบุชื่อหัวข้อ!');
                $('#ContentPlaceHolder1_taMeetingTitle').focus();
            } else if ($('#ContentPlaceHolder1_txtHeader').val() == '') {
                alert('กรุณาเลือกประธานการประชุม!');
                $('#ContentPlaceHolder1_txtHeader').focus();
            } else if ($('#ContentPlaceHolder1_txtMeetingCapacity').val() == '') {
                alert('กรุณาระบุจำนวนผู้เข้าร่วมประชุม!');
                $('#ContentPlaceHolder1_ddlORG').focus();
            } else if ($('#ContentPlaceHolder1_ddlORG option:selected').index() == 0) {
                alert('กรุณาเลือกหน่วยงานที่จอง!');
                $('#ContentPlaceHolder1_ddlORG').focus();
            } else if ($('#ContentPlaceHolder1_txtRoom').val() == '') {
                alert('กรุณาเลือกห้องประชุม!');
                $('#ContentPlaceHolder1_txtRoom').focus();
            } else {
                flag = true;
            }

            return flag;
        }

        function InsertRow(newRow) {
            var temp = $('#tableEquip');
            var fc = temp[0].firstChild;
            var lc = temp[0].lastChild;
            var html = lc.innerHTML + newRow;
            var table = fc.outerHTML + '<tbody>' + html + '</tbody>';
            $('#tableEquip').html(table);
        }

        function SetTableEquipVal() {
            var lst_val = '';
            var trs = $('#tableEquip tbody tr');

            for (var i = 0; i < trs.length; i++) {
                var tds = $(trs[i]).find('td');
                var equipId = tds[4].innerHTML;
                lst_val += tds[5].innerHTML + ',' + equipId + ',' + $('#txtEquipQuantity_' + equipId).val() + '#';
            }
           // console.log(lst_val);
            $('#ContentPlaceHolder1_txtTableEquip').val(lst_val);
        }

        function DeleteItem(meeting_equip_id, equip_id) {
            if (meeting_equip_id == "0") {
                RemoveRow('tableEquip', equip_id, 4);
                CreateNotify('Delete success!');
                return;
            }

            if (confirm('ยืนยันการลบข้อมูล?')) {
                $.ajax({
                    type: "post",
                    url: "../ajax/deleteMeetingEquip.aspx",
                    data: { 'id': meeting_equip_id },
                    dataType: "text",
                    async: false,
                    success: function (result) {
                        if (result == "true") {
                            RemoveRow('tableEquip', meeting_equip_id, 5);
                            CreateNotify('Delete success!');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(textStatus);
                    }
                });
            }
        }

        function SetServiceByRoom(id) {
            $('#ContentPlaceHolder1_txtRoomId').val(id);
            $('#<%= btnLoadDDLService.ClientID %>').click();
        }


        $(document).ready(function () {
            var txtName = '<%= ddlORG.ClientID %>';
           //alert(txtName);
            $("#"+txtName).select2();
        });


    </script>
    <style type="text/css">
        /*.action-btn {
            width: 110px;
        }*/
        .box-title, .input-box {
            text-align: left;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- start: PAGE HEADER -->
    <div class="row">
        <div class="col-sm-12">
            <!-- start: STYLE SELECTOR BOX -->
            <div id="style_selector" class="hidden-xs">
                <div id="style_selector_container" style="display: block;">
                    <div class="style-main-title">Quick Panel</div>
                    <div class="box-title"><span class="glyphicon glyphicon-flash"></span> ดำเนินการ</div>
                    <div class="input-box">
                        <div class="input">
                            <button id="btnEmail" class="btn btn-default btn-xs">email เชิญประชุม</button>
                            <button id="btnPostpone" class="btn btn-default btn-xs">email เลื่อนการประชุม</button>
                            <button id="btnCancel" class="btn btn-default btn-xs">ยกเลิกการประชุม</button>
                        </div>
                    </div>
                    <div class="box-title"><span class="glyphicon glyphicon-th-list"></span> สถานะการประชุม</div>
                    <div class="input-box">
                        <div class="input">
                            <button id="btnAgendaStatus" class="btn btn-default btn-xs">จัดการสถานะ</button>
                            <button id="btnAgendaMonitor" class="btn btn-default btn-xs">Monitor</button>
                        </div>
                    </div>
                    <div class="box-title"><span class="glyphicon glyphicon-print"></span> พิมพ์เอกสาร</div>
                    <div class="input-box">
                        <div class="input">
                            <button id="btnAgendaMeeting" class="btn btn-default btn-xs">วาระการประชุม</button>
                            <button id="btnSign" class="btn btn-default btn-xs">ใบเซ็นต์ชื่อ</button>
                            <button id="btnMOM" class="btn btn-default btn-xs" disabled="disabled">สรุปรายงาน</button>
                        </div>
                    </div>
                    <div class="box-title"><span class="glyphicon glyphicon-file"></span> รายการข้อมูล</div>
                    <div class="input-box">
                        <div class="input">
                            <button id="btnAgendaMeeetingData" class="btn btn-default btn-xs">ดาว์นโหลดวาระการประชุม</button>
                        </div>
                    </div>
                </div>
                <div class="style-toggle open"></div>
            </div>
            <!-- end: STYLE SELECTOR BOX -->
        </div>
    </div>
    <!-- end: PAGE HEADER -->

    <div>
        <h3>รายละเอียดการประชุม</h3>
        <div>
            <ul class="nav nav-tabs">
                <li class="active"><a id="a-meeting-detail" href="periodMeeting.aspx">รายละเอียดการประชุม</a></li>
                <li><a id="a-meeting-agenda" href="agenda.aspx">วาระการประชุม</a></li>
                <li><a id="a-meeting-attendee" href="attendee.aspx">ผู้เข้าร่วมการประชุม</a></li>
                <li><a id="a-meeting-task" href="task.aspx">งานที่มอบหมาย</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
            <div class="form-horizontal" role="form">
                <div class="form-group" id="grpSelectWorkgroup" runat="server">
                    <label for="" class="col-sm-3 control-label">เลือกคณะทำงาน:</label>
                    <div class="col-sm-3">
                        <button id="btnSelectWorkgroup" class="btn btn-primary" type="button" title="เลือกคณะทำงาน"><span class="glyphicon glyphicon-user"></span>เลือกคณะทำงาน</button>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">ครั้งที่:</label>
                    <div class="col-sm-3">
                        <input runat="server" type="text" id="txtMeetingNo" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtMeetingStartDate" class="col-sm-3 control-label">จากวันที่-เวลา:</label>
                    <div class="col-sm-6">
                        <div class="input-group">
                            <input type="text" id="txtMeetingStartDate" class="form-control" readonly="readonly" runat="server" />
                            <span class="input-group-btn">
                                <button id="btnSelectRoom" class="btn btn-primary" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtMeetingStartDate" class="col-sm-3 control-label">ถึงวันที่-เวลา:</label>
                    <div class="col-sm-6">
                       <%-- <div class="input-group">
                            <input type="text" id="txtMeetingEndDate" class="form-control" readonly="readonly" runat="server" />
                          <span class="input-group-btn">
                                <button id="btnSelectRoom2" class="btn btn-primary" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
                            </span>
                        </div>--%>
                         
                        <input type="text" id="txtMeetingEndDate" class="form-control" runat="server" readonly="readonly" required="required" />
                   

                    </div>
                </div>
                <div class="form-group">
                    <label for="txtRoom" class="col-sm-3 control-label">ห้องประชุม:</label>
                    <div class="col-sm-6">
                        <input type="text" id="txtRoom" class="form-control" runat="server" readonly="readonly" required="required" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="taMeetingTitle" class="col-sm-3 control-label">ชื่อหัวข้อ:</label>
                    <div class="col-sm-6">
                        <textarea id="taMeetingTitle" rows="3" class="form-control" runat="server"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">ประเภทหัวข้อ:</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" id="inlineCheckbox1" value="option1" name="meeting_type" checked="checked">การประชุม
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="inlineCheckbox2" value="option2" name="meeting_type">ฝึกอบรม
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="inlineCheckbox3" value="option3" name="meeting_type">สัมมนา
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtHeader" class="col-sm-3 control-label">ประธานการประชุม:</label>
                    <div class="col-sm-6">
                        <div class="input-group">
                            <input type="hidden" id="workgroupid" runat="server" value="" />
                            <input type="text" id="txtHeader" class="form-control" runat="server" readonly="readonly" required="required" />
                            <span class="input-group-btn">
                                <button id="btnSelectHeader" class="btn btn-primary" type="button" title="เลือกประธานการประชุม"><span class="glyphicon glyphicon-search"></span></button>
                                
                            </span>
                        </div>
                        <!--<img src="../Images/icons/zoom16.png" title="เลือกประธานการประชุม" alt="search" class="image-search" onclick="CallFancyBox('dialogUserSelection.aspx', 'header');" />&nbsp;-->
                        <!--<img src="../Images/icons/users16.png" title="เลือกคณะทำงาน" alt="workgroup" class="image-search" onclick="CallFancyBox('dialogWorkGroupSelection.aspx', 'workgroup');" />-->
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtMeetingCapacity" class="col-sm-3 control-label">ผู้เข้าร่วมประชุม จำนวน:</label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" id="txtMeetingCapacity" class="form-control" runat="server" />
                            <span class="input-group-addon">คน</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtRequestBy" class="col-sm-3 control-label">ผู้ขอใช้ห้องประชุม:</label>
                    <div class="col-sm-6">
                        <div class="input-group">
                            <input type="text" id="txtRequestBy" class="form-control" runat="server" readonly="readonly" required="required" />
                            <span class="input-group-btn">
                                <button id="btnSelectRequestBy" class="btn btn-primary" type="button"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                        </div>
                        <!--<img src="../Images/icons/zoom16.png" title="เลือกผู้ขอใช้ห้องประชุม" alt="search" class="image-search" onclick="CallFancyBox('dialogUserSelection.aspx', 'request');" />-->
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtRequestByPosition" class="col-sm-3 control-label">ตำแหน่ง:</label>
                    <div class="col-sm-6">
                        <input type="text" id="txtRequestByPosition" class="form-control" readonly="readonly" runat="server"  />
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtRequestByTelephone" class="col-sm-3 control-label">เบอร์โทรศัพท์:</label>
                    <div class="col-sm-6">
                        <input type="text" id="txtRequestByTelephone" class="form-control" readonly="readonly" runat="server"  />
                    </div>
                </div>
                <div class="form-group">
                    <label for="ddlORG" class="col-sm-3 control-label">หน่วยงานที่จอง:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="ddlORG" runat="server" CssClass="form-control" style="display: inline;"></asp:DropDownList>
                        
                         </div>
                </div>
                <div class="form-group">
                    <label for="divTableEquip" class="col-sm-3 control-label">อุปกรณ์การประชุม:</label>
                    <div class="col-sm-8">
                        <div id="divTableEquip" runat="server"></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-6">
                        <button id="btnAddEquip" class="btn btn-primary">เพิ่มอุปกรณ์การประชุม</button>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ddlService" class="col-sm-3 control-label">บริการการประชุม:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="ddlService" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtServiceNote" class="col-sm-3 control-label">หมายเหตุบริการการประชุม:</label>
                    <div class="col-sm-6">
                        <input type="text" id="txtServiceNote" class="form-control" runat="server"  />
                    </div>
                </div>
                <div class="form-group" style="margin-top: 20px;">
                    <div class="col-sm-offset-3 col-sm-6">
                        <!--<button id="btnSave1" class="btn btn-success" runat="server" onserverclick="btnSave_Click"><span class="glyphicon glyphicon-floppy-disk"></span> บันทึก</button>-->
                        <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ValidateScreen();" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <ul>
            <!--<li>
                <div style="margin-left: 10em;">
                    <asp:CheckBox ID="chkMeetingCont" runat="server" />ประชุมต่อเนื่อง
                </div>
            </li>
            <li id="li-meeting-cont">
                <div style="margin-left: 10em; margin-bottom: 1.2em;">
                    <input type="text" id="txtMeetingCont" class="textinput readonly" readonly="readonly" runat="server" />
                    <img id="imgMeetingCont" src="../Images/icons/zoom16.png" alt="search" title="เลือกการประชุมต่อเนื่อง" class="image-search" onclick="javascript: $('#a-meeting').trigger('click');" />
                </div>
            </li>
            <li>
                <label for="txtReserveBy">ผู้ทำรายการแทน:</label>
                <input type="text" id="txtReserveBy" class="textinput readonly" readonly="readonly" runat="server"  />
                <img src="../Images/icons/zoom16.png" title="เลือกผู้ทำรายการแทน" alt="search" class="image-search" onclick="CallFancyBox('dialogUserSelection.aspx', 'reserve');" />
            </li>
            <li>
                <ul>
                    <li style="float: left;">
                        <label for="txtReserveByPosition">ตำแหน่ง:</label>
                        <input type="text" id="txtReserveByPosition" class="textinput textinput110 readonly" readonly="readonly" runat="server"  />
                    </li>
                    <li>
                        <label for="txtReserveByTelephone" class="label-sub">เบอร์โทรศัพท์:</label>
                        <input type="text" id="txtReserveByTelephone" class="textinput textinput110 readonly" readonly="readonly" runat="server"  />
                    </li>
                </ul>
            </li>-->
        </ul>
    </div>
    <div style="display: none;">
        <input type="hidden" id="txtMeetingId" runat="server" />
        <input type="hidden" id="txtHeaderId" runat="server" />
        <input type="hidden" id="txtRequestId" runat="server" />
        <input type="hidden" id="txtReserveId" runat="server" />
        <input type="hidden" id="txtTableEquip" runat="server" />
        <input type="hidden" id="txtPermission" runat="server" />
        <input type="hidden" id="txtServiceId" runat="server" />
        <input type="hidden" id="txtRoomId" runat="server" />
        <input type="hidden" id="txtMeetingIdCont" runat="server" />
        <input type="hidden" id="txtMeetingDate" runat="server" />
        <a id="a1" href="#">fancybox</a>
        <a id="a-calendar" href="#">fancybox</a>
        <a id="a-equipment" href="#">fancybox</a>
        <a id="a-meeting-info" href="#">fancybox</a>
        <a id="a-meeting" href="dialogMeetingSelection.aspx">fancybox</a>
        <asp:Button ID="btnLoadDDLService" runat="server" OnClick="btnLoadDDLService_Click" />
    </div>
</asp:Content>