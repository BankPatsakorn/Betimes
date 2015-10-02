<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_CANCLE_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_CANCLE_DetailView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .dis-ctl
        {
            background-color: #DDDDDD;
        }

        .control-label
        {
            width: 150px;
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        var lkuValueId = "";
        var lkuLabelId = "";
        var selectedPopupView;
        $(document).ready(function () {
            $('.fancyBox').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    //location.reload();
                    selectedPopupView.Refresh();
                }
            });
            $('.fancyBoxLku').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {

                }
            });

            $('#btnCalendar').click(function () {
                //alert(44);
                CallFancyBox('dialogRoomSelection.aspx', 'calendar');
            });


            $('#a-calendar').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 625,
                onClosed: function () {
                    // BindValue();
                }
            });


			<%=JS %>
        });

        function ClientValidation() {
            return ASPxClientEdit.ValidateGroup("");
        }

        function OpenLku(id, href, valId, lblId) {
            lkuValueId = valId;
            lkuLabelId = lblId;
            $("#" + id).attr("href", href);
            $("#" + id).click();
        }
        function SetLku(val, label) {
            $("#" + lkuValueId).val(val);
            $("#" + lkuLabelId).val(label);
        }

        function OpenChildDetail(id, href, viewName) {
            $("#" + id).attr("href", href);
            $("#" + id).click();
            selectedPopupView = viewName;
        }


        //function OpenCalendar()
        //{
        //    CallFancyBox('dialogRoomSelection.aspx', 'calendar');
        //}

        function CallFancyBox(url, popup) {
            //alert(url + popup);
            var id = "1";// GetValueQueryString('id');
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
                var strDate = "";//= $('#ContentPlaceHolder1_txtMeetingDate').val();
                url = url + '?id=' + id + '&date=' + strDate;
                //alert("date=="+url);
                // console.log(url);
                $('#a-calendar').attr('href', url);
                $('#a-calendar').trigger('click');
            } else if (popupName == 'calendar2') {
                var enDate = $('#ContentPlaceHolder1_txtMeetingEndDate').val();
                //alert("enDate=" + enDate);
                url = url + '?id=' + id + '&date=' + enDate;
                // console.log(url);
                $('#a-calendar').attr('href', url);
                $('#a-calendar').trigger('click');
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <div>&nbsp;</div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 0em">
        <span style="font-size: 23px">แก้ไข/ยกเลิกการจองห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0301)</span>
    </div>
    <div class="form-group col-sm-12" style="margin-top: 10px;">
        <div class="col-sm-offset-10 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
     <div  class="col-sm-12" ><input type="button" value="ยกเลิกการจอง" class="btn btn-primary" /></div>
    <div>&nbsp;</div>
    <div class="col-sm-12">
        <!--button18-->
       
        
        <div class="col-sm-12">
            <div>
                <!--open tabhead 19-->
                <ul id="ultab19" class="nav nav-tabs tab-bricky">
                    <li class="active">
                        <!--open tabpage 20-->
                        <a href="#tabpage1" data-toggle="tab">รายละเอียดการประชุม
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 99-->
                        <a href="#tabpage2" data-toggle="tab">ผู้เข้าร่วมการประชุม
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 109-->
                        <a href="#tabpage3" data-toggle="tab">ผังที่นั่ง
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 112-->
                        <a href="#tabpage4" data-toggle="tab">ระเบียบวาระการประชุม
                        </a>
                    </li>
                </ul>
                <!--end tabhead 153-->
            </div>
            <!--end tabhead 153-->
            <div class="tab-content">
                <!--open tab content 19-->
                <div class="tab-pane active" id="tabpage1">
                    <!--open tabpage 20-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <!--row 21-->
                                <div class="col-sm-12">
                                    <!--col 22-->
                                    <div id="MEETING_REQUEST_OFFICER" class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">ชื่อ-นามสกุล ผู้จอง:</label>
                                        <div class="col-sm-10">
                                            <dx:ASPxTextBox ID="ctlMEETING_REQUEST_OFFICER" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 24-->
                            </div>
                            <!--end row 25-->
                            <div class="row">
                                <!--row 26-->
                                <div class="col-sm-6">
                                    <!--col 27-->
                                    <div id="REQUEST_DATE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">วันที่ใช้ห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlREQUEST_DATE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>

                                    </div>
                                </div>
                                <!--end col 29-->
                                <div class="col-sm-6">
                                    <!--col 30-->
                                    <div id="REQUEST_START_TIME" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">เวลาในการประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlREQUEST_START_TIME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 32-->
                            </div>
                            <!--end row 33-->
                            <div class="row">
                                <!--row 34-->
                                <div class="col-sm-6">
                                    <!--col 35-->
                                    <div id="REQUEST_ROOM" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlREQUEST_ROOM" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 37-->
                                <div class="col-sm-6">
                                    <!--col 38-->
                                    <div id="MEETING_CODE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">รหัสการประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_CODE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 40-->
                            </div>
                            <!--end row 41-->
                            <div class="row">
                                <!--row 42-->
                                <div class="col-sm-12">
                                    <!--col 43-->
                                    <div id="MEETING_SUBJECT" class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">ชื่อหัวข้อ/ชื่อเรื่อง:</label>
                                        <div class="col-sm-10">
                                            <dx:ASPxMemo ID="ctlMEETING_SUBJECT" runat="server"
                                                Width="100%" Height="100">
                                            </dx:ASPxMemo>
                                        </div>
                                    </div>

                                </div>
                                <!--end col 46-->
                            </div>
                            <!--end row 47-->
                            <div class="row">
                                <div class="col-sm-6">
                                    <div id="MEETING_AMOUNT" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4">จำนวนผู้เข้าร่วม:</label>
                                        <div class="col-sm-4">
                                            <dx:ASPxSpinEdit ID="ctlMEETING_AMOUNT" runat="server" Height="30" Width="100%">
                                                <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                            </dx:ASPxSpinEdit>
                                           
                                        </div>
                                         <div class="col-sm-2">คน</div>
                                    </div>
                                   
                                </div>
                                   
                            </div>
                            <div class="panel panel-default">
                                <!--open box 48-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    การแก้ไขการประชุม
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body48-->
                                    <div class="row">
                                        <!--row 49-->
                                        <div class="col-sm-6">
                                            <!--col 50-->
                                            <div id="ROOM_ID" class="form-group col-sm-12">
                                                <label for="" class="col-sm-4">ห้องประชุม <span style="color: red">*</span> :</label>
                                                <div class="col-sm-8">
                                                    <dx:ASPxComboBox
                                                        ID="ctlROOM_ID" runat="server"
                                                        DropDownStyle="DropDown" Height="30"
                                                        DataSourceID="dsRMSM_MDM_ROOM_INFO"
                                                        TextField="ROOM_NAME" ValueField="ROOM_ID"
                                                        Width="100%" IncrementalFilteringMode="StartsWith" />
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col 52-->
                                    </div>
                                    <!--end row 53-->
                                    <div class="row">
                                        <!--row 54-->
                                        <div class="col-sm-6">
                                            <!--col 55-->
                                            <div id="EDIT_START_DATE" class="form-group col-sm-12">
                                                <label for="" class="col-sm-4">วันที่ใช้ห้องประชุม <span style="color: red">*</span>:</label>
                                                <%-- <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelEDIT_START_DATE" runat="server">
                        <contenttemplate>
                            <dx:ASPxDateEdit ID="ctlEDIT_START_DATE" Height="30"  AutoPostBack="true" DisplayFormatString="d MMM yyyy"  runat="server" EditFormat="Custom" Width="300">
                            </dx:ASPxDateEdit>
                          </contenttemplate>
                         </asp:UpdatePanel>
                        </div>--%>

                                                <div class="col-sm-8">
                                                    <asp:UpdatePanel ID="UpdatePanelEDIT_START_DATE" runat="server">
                                                        <ContentTemplate>
                                                            <dx:ASPxDateEdit ID="ctlEDIT_START_DATE" Height="30" DropDownButton-Image-IconID="scheduling_calendar_16x16" AutoPostBack="true" DisplayFormatString="d MMM yyyy" runat="server" EditFormat="Custom" Width="100%">
                                                            </dx:ASPxDateEdit>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col 57-->
                                        <div class="col-sm-6">
                                            <!--col 58-->
                                            <div id="EDIT_REQUEST_START_TIME" class="form-group col-sm-12">
                                                <label for="" class="col-sm-4">เวลาในการประชุม <span style="color: red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <%--  <asp:UpdatePanel ID="UpdatePanelEDIT_REQUEST_START_TIME" runat="server">
                        <contenttemplate>
                            <dx:ASPxDateEdit ID="ctlEDIT_REQUEST_START_TIME" Height="30"  AutoPostBack="true" DisplayFormatString="d MMM yyyy"  runat="server" EditFormat="Custom" Width="300">
                            </dx:ASPxDateEdit>
                          </contenttemplate>
                         </asp:UpdatePanel>--%>

                                                    <dx:ASPxTextBox ID="ctlEDIT_REQUEST_START_TIME" Width="100%" Height="30"
                                                        runat="server">
                                                    </dx:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col 60-->
                                    </div>
                                    <!--end row 61-->
                                    <!--button62-->
                                    <%--<input type="button" id="btnCalendar" value="ตรวจสอบวันและเวลาใหม่" class="btn btn-primary" />--%>
                                </div>
                                <!--end box body 63-->
                            </div>
                            <!--end box 63-->
                            <div class="row">
                                <!--row 64-->
                                <div class="col-sm-6">
                                    <!--col 65-->
                                    <div id="MEETING_CANCEL_OFFICER" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 ">ผู้ขอใช้ห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <asp:HiddenField ID="ctlMEETING_CANCEL_OFFICER" runat="server"></asp:HiddenField>
                                                <dx:ASPxTextBox ID="ctlMEETING_CANCEL_OFFICER_label" Width="100%" Height="30"
                                                    runat="server">
                                                </dx:ASPxTextBox>
                                                <span class="input-group-btn">
                                                    <button id="btnMEETING_CANCEL_OFFICER" class="btn btn-primary" style="width: 30px; height: 30px"
                                                        onclick="OpenLku('lkuMEETING_CANCEL_OFFICER', 'VIEW_PERSONAL_LookupListView.aspx', 'ContentPlaceHolder1_ctlMEETING_CANCEL_OFFICER', 'ContentPlaceHolder1_ctlMEETING_CANCEL_OFFICER_label_I')" type="button">
                                                        <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <a id="lkuMEETING_CANCEL_OFFICER" href="#" class="fancyBoxLku" style="display: none"></a>
                                </div>
                                <!--end col 67-->
                            </div>
                            <!--end row 68-->
                            <div class="row">
                                <!--row 69-->
                                <div class="col-sm-6">
                                    <!--col 70-->
                                    <div id="CANCEL_OPSITION_NAME" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ตำแหน่ง:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlCANCEL_OPSITION_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 72-->
                                <div class="col-sm-6">
                                    <!--col 73-->
                                    <div id="MEETING_CANCEL_TEL" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_CANCEL_TEL" Enabled="false" runat="server" Height="30" ForeColor="#000000" BackColor="#DDDDDD" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 75-->
                            </div>
                            <!--end row 76-->
                            <div class="row">
                                <!--row 77-->
                                <div class="col-sm-6">
                                    <!--col 78-->
                                    <div id="CANCEL_ORG" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">หน่วยงานที่จอง:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlCANCEL_ORG" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 80-->
                                <div class="col-sm-6">
                                    <!--col 81-->
                                    <div id="MEETING_ADMIN" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ผู้ดูแลห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_ADMIN" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 83-->
                            </div>
                            <!--end row 84-->
                            <div class="panel panel-default">
                                <!--open box 85-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    โสตทัศนูปกรณ์
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body85-->
                                    <!--button86-->
                                    <input type="button" value="เพิ่มโสตทัศนูปกรณ์" class="btn btn-primary" />
                                    <div>&nbsp;</div>
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_EQUIPMENT_ListView" runat="server" Width="100%"
                                                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                DataSourceID="dsRMSM_RMM_MEETING_EQUIPMENT_ListView" KeyFieldName="MEETING_EQUIPMENT_ID" ClientInstanceName="viewRMSM_RMM_MEETING_EQUIPMENT_ListView" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MEETING_EQUIPMENT_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1"  Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                        <DataItemTemplate>
                                                            <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_EQUIPMENT_ListView','RMSM_RMM_MEETING_EQUIPMENT_DetailView.aspx?MEETING_EQUIPMENT_ID=<%#Eval("MEETING_EQUIPMENT_ID") %>', viewRMSM_RMM_MEETING_EQUIPMENT_ListView);">
                                                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ชื่ออุปกรณ์" FieldName="EQUIPMENT_NAME" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="จำนวน" FieldName="EQUIPMENT_AMOUNT" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="หน่วย" FieldName="COUNT_UNIT_NAME" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                <SettingsCommandButton>
                                                    <DeleteButton>
                                                        <Image ToolTip="ลบ" Url="Images/del.png" />
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                            </dx:ASPxGridView>
                                            <a id="fancyBoxRMSM_RMM_MEETING_EQUIPMENT_ListView" class='fancyBox' style="display: none"></a>

                                        </div>
                                    </div>
                                </div>
                                <!--end box body 88-->
                            </div>
                            <!--end box 88-->
                            <div class="panel panel-default">
                                <!--open box 89-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    บริการการประชุม
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body89-->
                                    <!--button90-->
                                    <input type="button" value="เพิ่มบริการการประชุม" class="btn btn-primary" />
                                    <div>&nbsp;</div>
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_SERVICE_ListView" runat="server" Width="100%"
                                                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                DataSourceID="dsRMSM_RMM_MEETING_SERVICE_ListView" KeyFieldName="MEETING_SERVICE_ID" ClientInstanceName="viewRMSM_RMM_MEETING_SERVICE_ListView" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True"  Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center"  ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MEETING_SERVICE_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                        <DataItemTemplate>
                                                            <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_SERVICE_ListView','RMSM_RMM_MEETING_SERVICE_DetailView.aspx?MEETING_SERVICE_ID=<%#Eval("MEETING_SERVICE_ID") %>', viewRMSM_RMM_MEETING_SERVICE_ListView);">
                                                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="บริการ" FieldName="SERVICE_NAME" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                <SettingsCommandButton>
                                                    <DeleteButton>
                                                        <Image ToolTip="ลบ" Url="Images/del.png" />
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                            </dx:ASPxGridView>
                                            <a id="fancyBoxRMSM_RMM_MEETING_SERVICE_ListView" class='fancyBox' style="display: none"></a>

                                        </div>
                                    </div>
                                </div>
                                <!--end box body 92-->
                            </div>
                            <!--end box 92-->
                            <div class="row">
                                <!--row 93-->
                                <div class="col-sm-12">
                                    <!--col 94-->
                                    <div id="MEETING_NOTE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">หมายเหตุ:</label>
                                        <div class="col-sm-10">
                                            <dx:ASPxMemo ID="ctlMEETING_NOTE" runat="server"
                                                Width="100%" Height="100">
                                            </dx:ASPxMemo>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 96-->
                            </div>
                            <!--end row 97-->
                        </div>
                    </div>
                </div>
                <!--end tabpage 98-->
                <div class="tab-pane " id="tabpage2">
                    <!--open tabpage 99-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel panel-default">
                                <!--open box 100-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>

                                    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body100-->
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" runat="server" Width="100%"
                                                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                DataSourceID="dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" KeyFieldName="MEETING_MEMBER_ID" ClientInstanceName="viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" Caption="แก้ไข" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MEETING_MEMBER_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1"  Width="5%" CellStyle-HorizontalAlign="Center"  Caption="แก้ไข">
                                                        <DataItemTemplate>
                                                            <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_MEMBER_MANAGER_ListView','RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.aspx?MEETING_MEMBER_ID=<%#Eval("MEETING_MEMBER_ID") %>', viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView);">
                                                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ชื่อ-นามสกุล" FieldName="NAME" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ตำแหน่ง" FieldName="OFFICER_OPSITION_NAME" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="หน่วยงาน" FieldName="ORG" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="ตำแหน่งประชุม" FieldName="MEETING_POSITION_NAME" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataSpinEditColumn Caption="สถานะของบุคคล" FieldName="MEETING_MEMBER_TYPE" VisibleIndex="7">
                                                    </dx:GridViewDataSpinEditColumn>

                                                    <dx:GridViewDataTextColumn Caption="สถานะการเข้าร่วม" FieldName="MEETING_STATUS_NAME" VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                <SettingsCommandButton>
                                                    <DeleteButton>
                                                        <Image ToolTip="ลบ" Url="Images/del.png" />
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                            </dx:ASPxGridView>
                                            <a id="fancyBoxRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" class='fancyBox' style="display: none"></a>

                                        </div>
                                    </div>
                                    <br />
                                    <!--button102-->
                                    <input type="button" value="เพิ่มผู้เข้าร่วมประชุม" class="btn btn-primary"  onclick="location = 'RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.aspx';" />
                                    <!--button103-->
                                    <input type="button" style="display:none;" value="บุคคลภายในสปน." class="btn btn-primary" />
                                    <!--button104-->
                                    <input type="button" style="display:none;" value="บุคคลภายนอกสปน." class="btn btn-primary" />
                                    <!--button105-->
                                    <input type="button" value="พิมพ์ใบสรุปการจอง" class="btn btn-primary" />
                                    <!--button106-->
                                    <input type="button" value="พิมพ์ป้ายชื่อเข้าร่วมประชุม" class="btn btn-primary" />
                                </div>
                                <!--end box body 107-->
                            </div>
                            <!--end box 107-->
                        </div>
                    </div>
                </div>
                <!--end tabpage 108-->
                <div class="tab-pane " id="tabpage3">
                    <!--open tabpage 109-->
                      <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group col-sm-12">
                                <div class="navbar navbar-inverse " style="background-image: url(../Images/seating.png); background-repeat: no-repeat; min-height: 577px; background-size: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 111-->
                <div class="tab-pane " id="tabpage4">
                    <!--open tabpage 112-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-sm-12">
                                <div>
                                    <!--open tabhead 113-->
                                    <ul id="ultab113" class="nav nav-tabs tab-bricky">
                                        <li class="active">
                                            <!--open tabpage 114-->
                                            <a href="#tabpage5" data-toggle="tab">หัวข้อระเบียบวาระการประชุม
                                            </a>
                                        </li>
                                        <li class="">
                                            <!--open tabpage 118-->
                                            <a href="#tabpage6" data-toggle="tab">รายละเอียดระเบียบวาระการประชุม
                                            </a>
                                        </li>
                                        <li class="">
                                            <!--open tabpage 134-->
                                            <a href="#tabpage7" data-toggle="tab">รายละเอียดระเบียบวาระการประชุมย่อย
                                            </a>
                                        </li>
                                    </ul>
                                    <!--end tabhead 151-->
                                </div>
                                <!--end tabhead 151-->
                                <div class="tab-content">
                                    <!--open tab content 113-->
                                    <div class="tab-pane active" id="tabpage5">
                                        <!--open tabpage 114-->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <!--button115-->
                                                <input type="button" value="เพิ่มวาระการประชุม" class="btn btn-primary" />
                                                <div>&nbsp;</div>
                                                <div>
                                                    <div>


                                                        <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_ListView" runat="server" Width="100%"
                                                            AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                            DataSourceID="dsRMSM_RMM_MEETING_AGENDA_ListView" KeyFieldName="AGENDA_SUB_ID" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_ListView" Theme="Metropolis">
                                                            <Columns>

                                                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                    ShowDeleteButton="True" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                                    <DataItemTemplate>
                                                                        <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_ListView','RMSM_RMM_MEETING_AGENDA_DetailView.aspx?AGENDA_SUB_ID=<%#Eval("AGENDA_SUB_ID") %>', viewRMSM_RMM_MEETING_AGENDA_ListView);">
                                                                            <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="ระเบียบวาระที่" Width="10%" FieldName="AGENDA_SUB_SEQ" VisibleIndex="3">
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="เรื่อง" FieldName="AGENDA_SUB_TOPIC" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                            <SettingsCommandButton>
                                                                <DeleteButton>
                                                                    <Image ToolTip="ลบ" Url="Images/del.png" />
                                                                </DeleteButton>
                                                            </SettingsCommandButton>
                                                        </dx:ASPxGridView>
                                                        <a id="fancyBoxRMSM_RMM_MEETING_AGENDA_ListView" class='fancyBox' style="display: none"></a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tabpage 117-->
                                    <div class="tab-pane " id="tabpage6">
                                        <!--open tabpage 118-->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <!--row 119-->
                                                    <div class="col-sm-12">
                                                        <!--col 120-->
                                                        <div id="MEETING_AGENDA_ID" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">ระเบียบวาระการประชุม:</label>
                                                            <div class="col-sm-3">
                                                                <dx:ASPxTextBox ID="ctlMEETING_AGENDA_ID" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_SUB_TOPIC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">เรื่อง:</label>
                                                            <div class="col-sm-10">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_SUB_TOPIC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_SUB_DESC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">รายละเอียด:</label>
                                                            <div class="col-sm-10">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_SUB_DESC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_SUB_BOARD" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">มติที่ประชุม:</label>
                                                            <div class="col-sm-10">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_SUB_BOARD" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col 125-->
                                                </div>
                                                <!--end row 126-->
                                                <div class="panel panel-default">
                                                    <!--open box 127-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body127-->
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" KeyFieldName="AGENDA_SUB_DOC" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" ShowSelectCheckbox="False" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ButtonType="Image" VisibleIndex="0">
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_DOC" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                                            <DataItemTemplate>
                                                                                <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView','RMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView.aspx?AGENDA_SUB_DOC=<%#Eval("AGENDA_SUB_DOC") %>', viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView);">
                                                                                    <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn Caption="ชื่อเอกสาร" FieldName="DOC_LOGICAL_NAME" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn Caption="วันที่นำเข้า" FieldName="DOC_IMPORT_DATE" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                                    <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                                    <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                                    <SettingsCommandButton>
                                                                        <DeleteButton>
                                                                            <Image ToolTip="ลบ" Url="Images/del.png" />
                                                                        </DeleteButton>
                                                                    </SettingsCommandButton>
                                                                </dx:ASPxGridView>
                                                                <a id="fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" class='fancyBox' style="display: none"></a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end box body 129-->
                                                </div>
                                                <!--end box 129-->
                                                <div class="panel panel-default">
                                                    <!--open box 130-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body130-->
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" KeyFieldName="AGENDA_SUB_URL_ID" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" ShowSelectCheckbox="False" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ButtonType="Image" VisibleIndex="0">
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_URL_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="แก้ไข" Width="5%" CellStyle-HorizontalAlign="Center">
                                                                            <DataItemTemplate>
                                                                                <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView','RMSM_RMM_MEETING_AGENDA_SUB_URL_DetailView.aspx?AGENDA_SUB_URL_ID=<%#Eval("AGENDA_SUB_URL_ID") %>', viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView);">
                                                                                    <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn Caption="URL" FieldName="URL_LINK" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataDateColumn Caption="วันที่นำเข้า" FieldName="CREATE_DATE" VisibleIndex="4">
                                                                        </dx:GridViewDataDateColumn>
                                                                    </Columns>
                                                                    <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                                    <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                                    <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                                    <SettingsCommandButton>
                                                                        <DeleteButton>
                                                                            <Image ToolTip="ลบ" Url="Images/del.png" />
                                                                        </DeleteButton>
                                                                    </SettingsCommandButton>
                                                                </dx:ASPxGridView>
                                                                <a id="fancyBoxRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" class='fancyBox' style="display: none"></a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end box body 132-->
                                                </div>
                                                <!--end box 132-->
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tabpage 133-->
                                    <div class="tab-pane " id="tabpage7">
                                        <!--open tabpage 134-->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <!--row 135-->
                                                    <div class="col-sm-12">
                                                        <!--col 136-->
                                                        <div id="AGENDA_SUB_ID" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">ระเบียบวาระการประชุม:</label>
                                                            <div class="col-sm-3">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_SUB_ID" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_SEQ" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">ระเบียบวาระที่:</label>
                                                            <div class="col-sm-3">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_SEQ" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_TOPIC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">เรื่อง:</label>
                                                            <div class="col-sm-10">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_TOPIC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_DESC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">รายละเอียด:</label>
                                                            <div class="col-sm-10">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_DESC" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_BOARD" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-2">มติที่ประชุม:</label>
                                                            <div class="col-sm-10">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_BOARD" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col 142-->
                                                </div>
                                                <!--end row 143-->
                                                <div class="panel panel-default">
                                                    <!--open box 144-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body144-->
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" KeyFieldName="AGENDA_DETAIL_DOC" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" ShowSelectCheckbox="False" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ButtonType="Image" VisibleIndex="0">
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA_DETAIL_DOC" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                                            <DataItemTemplate>
                                                                                <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView','RMSM_RMM_MEETING_AGENDA_DETAIL_DOC_DetailView.aspx?AGENDA_DETAIL_DOC=<%#Eval("AGENDA_DETAIL_DOC") %>', viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView);">
                                                                                    <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn Caption="ชื่อเอกสาร" FieldName="DOC_LOGICAL_NAME" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn Caption="วันที่นำเข้า" FieldName="DOC_IMPORT_DATE" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                                    <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                                    <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                                    <SettingsCommandButton>
                                                                        <DeleteButton>
                                                                            <Image ToolTip="ลบ" Url="Images/del.png" />
                                                                        </DeleteButton>
                                                                    </SettingsCommandButton>
                                                                </dx:ASPxGridView>
                                                                <a id="fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" class='fancyBox' style="display: none"></a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end box body 146-->
                                                </div>
                                                <!--end box 146-->
                                                <div class="panel panel-default">
                                                    <!--open box 147-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body147-->
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" KeyFieldName="AGENDA_DETAIL_URL_ID" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" ShowSelectCheckbox="False" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ButtonType="Image" VisibleIndex="0">
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA_DETAIL_URL_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="แก้ไข" Width="5%" CellStyle-HorizontalAlign="Center">
                                                                            <DataItemTemplate>
                                                                                <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView','RMSM_RMM_MEETING_AGENDA_DETAIL_URL_DetailView.aspx?AGENDA_DETAIL_URL_ID=<%#Eval("AGENDA_DETAIL_URL_ID") %>', viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView);">
                                                                                    <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                                            </DataItemTemplate>
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn Caption="URL" FieldName="URL_LINK" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataDateColumn Caption="วันที่นำเข้า" FieldName="CREATE_DATE" VisibleIndex="4">
                                                                        </dx:GridViewDataDateColumn>
                                                                    </Columns>
                                                                    <Settings ShowFilterRow="false" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                                    <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                                    <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                                    <SettingsCommandButton>
                                                                        <DeleteButton>
                                                                            <Image ToolTip="ลบ" Url="Images/del.png" />
                                                                        </DeleteButton>
                                                                    </SettingsCommandButton>
                                                                </dx:ASPxGridView>
                                                                <a id="fancyBoxRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" class='fancyBox' style="display: none"></a>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end box body 149-->
                                                </div>
                                                <!--end box 149-->
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tabpage 150-->
                                </div>
                                <!--end tab 151-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 152-->
            </div>
            <!--end tab 153-->
        </div>

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_EQUIPMENT_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_EQUIPMENT WHERE [MEETING_EQUIPMENT_ID] = @MEETING_EQUIPMENT_ID"
            SelectCommand="SELECT [dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_ID
,[dbo].[RMSM_RMM_MEETING_EQUIPMENT].MEETING_EQUIPMENT_ID
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_NAME
,[dbo].[RMSM_MDM_EQUIPMENT_INFO].[EQUIPMENT_AMOUNT]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_NAME
FROM [dbo].[RMSM_RMM_MEETING_EQUIPMENT]
LEFT JOIN [dbo].[RMSM_MDM_EQUIPMENT_INFO] on
[dbo].[RMSM_RMM_MEETING_EQUIPMENT].EQUIPMENT_ID = [dbo].[RMSM_MDM_EQUIPMENT_INFO].EQUIPMENT_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO] on
[dbo].[RMSM_MDM_EQUIPMENT_INFO].[COUNT_UNIT_ID] = [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
WHERE [dbo].[RMSM_RMM_MEETING_EQUIPMENT].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_EQUIPMENT_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SERVICE_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_SERVICE WHERE [MEETING_SERVICE_ID] = @MEETING_SERVICE_ID"
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING_SERVICE].MEETING_SERVICE_ID
,[dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_ID 
,[dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_NAME 
FROM [dbo].[RMSM_RMM_MEETING_SERVICE]
LEFT JOIN [dbo].[RMSM_MDM_SERVICE_INFO] on
[dbo].[RMSM_RMM_MEETING_SERVICE].SERVICE_ID = [dbo].[RMSM_MDM_SERVICE_INFO].SERVICE_ID 
WHERE [dbo].[RMSM_RMM_MEETING_SERVICE].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_SERVICE_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_MEMBER WHERE [MEETING_MEMBER_ID] = @MEETING_MEMBER_ID"
            SelectCommand="SELECT [dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
,[dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_ID]
,[dbo].[RMSM_MDM_MEETING_STATUS_INFO].[MEETING_STATUS_ID]
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_OPSITION_NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].ORG
,[dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_NAME]
,case when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 0 then 'ผู้บริหาร สปน.' 
 when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 1 then 'บุลลคภายใน สปน.' 
 when[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_TYPE = 2 then 'บุลลคภายนอก สปน.' end as MEETING_MEMBER_TYPE
,[dbo].[RMSM_MDM_MEETING_STATUS_INFO].MEETING_STATUS_NAME
FROM [dbo].[RMSM_RMM_MEETING_MEMBER]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEMBER_OWNER_OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [dbo].[RMSM_MDM_MEETING_POSITION_INFO] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_POSITION_ID = [dbo].[RMSM_MDM_MEETING_POSITION_INFO].[MEETING_POSITION_ID]
LEFT JOIN [dbo].[RMSM_MDM_MEETING_STATUS_INFO] on
[dbo].[RMSM_RMM_MEETING_MEMBER].MEETING_MEMBER_STATUS = [dbo].[RMSM_MDM_MEETING_STATUS_INFO].[MEETING_STATUS_ID]
WHERE [dbo].[RMSM_RMM_MEETING_MEMBER].RECORD_STATUS = 'A' ">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB WHERE [AGENDA_SUB_ID] = @AGENDA_SUB_ID"
            SelectCommand="SELECT RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_ID
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
FROM  [dbo].[RMSM_RMM_MEETING_AGENDA_SUB]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_DOC WHERE [AGENDA_SUB_DOC] = @AGENDA_SUB_DOC"
            SelectCommand="SELECT [AGENDA_SUB_DOC]
,[DOC_LOGICAL_NAME]
,[DOC_IMPORT_DATE]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO] on
[dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC].DOC_TYPE_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_DOC].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_DOC" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB_URL WHERE [AGENDA_SUB_URL_ID] = @AGENDA_SUB_URL_ID"
            SelectCommand="SELECT [AGENDA_SUB_URL_ID]
,[URL_NO]
,[URL_LINK]
,[CREATE_DATE]
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_URL]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_SUB_URL].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_URL_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_DETAIL_DOC WHERE [AGENDA_DETAIL_DOC] = @AGENDA_DETAIL_DOC"
            SelectCommand="SELECT [AGENDA_DETAIL_DOC]
,[DOC_LOGICAL_NAME]
,[DOC_IMPORT_DATE]
,[OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_DOC]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO] on
[dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_DOC].DOC_TYPE_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_DOC_TYPE_INFO].DOC_TYPE_ID
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_DOC].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_DETAIL_DOC" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_DETAIL_URL WHERE [AGENDA_DETAIL_URL_ID] = @AGENDA_DETAIL_URL_ID"
            SelectCommand="SELECT [AGENDA_DETAIL_URL_ID]
,[URL_NO]
,[URL_LINK]
,[CREATE_DATE]
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_URL]
WHERE [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL_URL].RECORD_STATUS = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_DETAIL_URL_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_CANCLE_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT DISTINCT RMSM_RMM_MEETING.MEETING_REQUEST_OFFICER
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME as REQUEST_NAME
,RMSM_RMM_MEETING.MEETING_RESERVE_DATE as REQUEST_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_START_TIME as REQUEST_START_TIME
,RMSM_MDM_ROOM_INFO.ROOM_ID as REQUEST_ROOM
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME
,RMSM_RMM_MEETING.MEETING_CODE
,RMSM_RMM_MEETING.MEETING_SUBJECT
,RMSM_RMM_MEETING.[MEETING_AMOUNT]
,RMSM_RMM_MEETING.ROOM_ID 
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME as EDIT_ROOM_NAME
,RMSM_RMM_MEETING.MEETING_REQUEST_START_DATE as EDIT_START_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_START_TIME as EDIT_REQUEST_START_TIME
,RMSM_RMM_MEETING.[MEETING_CANCEL_OFFICER]
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME as CANCEL_NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_OPSITION_NAME as CANCEL_OPSITION_NAME
,RMSM_RMM_MEETING.[MEETING_CANCEL_TEL]
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].ORG as CANCEL_ORG
,RMSM_RMM_MEETING.[MEETING_ADMIN]
,RMSM_RMM_MEETING.MEETING_NOTE
,RMSM_RMM_MEETING_AGENDA_SUB.MEETING_AGENDA_ID
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_SUB_ID
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_SEQ
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_TOPIC
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_DESC
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_BOARD
FROM [dbo].[RMSM_RMM_MEETING]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_RMM_MEETING].MEETING_REQUEST_OFFICER = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_RMM_MEETING].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA] on
[dbo].[RMSM_RMM_MEETING].MEETING_ID = [dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA_SUB] on
[dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_AGENDA_ID = [dbo].[RMSM_RMM_MEETING_AGENDA_SUB].MEETING_AGENDA_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL] on
[dbo].[RMSM_RMM_MEETING_AGENDA_SUB].AGENDA_SUB_ID = [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL].AGENDA_SUB_ID
WHERE [dbo].[RMSM_RMM_MEETING].MEETING_ID = @MEETING_ID
"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_AGENDA_TOPIC,MEETING_AGENDA_ID from RMSM_RMM_MEETING_AGENDA"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select AGENDA_SUB_TOPIC,AGENDA_SUB_ID from RMSM_RMM_MEETING_AGENDA_SUB"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_DETAIL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select AGENDA_DETAIL_TOPIC,AGENDA_DETAIL_ID from RMSM_RMM_MEETING_AGENDA_DETAIL"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsVIEW_PERSONAL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select NAME, from VIEW_PERSONAL"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SERVICE" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_SERVICE_ID,MEETING_SERVICE_ID from RMSM_RMM_MEETING_SERVICE"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_EQUIPMENT" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_EQUIPMENT_ID,MEETING_EQUIPMENT_ID from RMSM_RMM_MEETING_EQUIPMENT"></asp:SqlDataSource>

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

    </div>
</asp:Content>

