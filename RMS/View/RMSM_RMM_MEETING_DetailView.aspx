<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_DetailView.aspx.cs" Inherits="RMSM_RMM_MEETING_DetailView" %>

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
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />

    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 0em">
        <span style="font-size: 23px">บันทึกการจองห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0102)</span>
    </div>
    <div class="form-group col-sm-12" style="margin-top: 10px;">
        <div class="col-sm-12 text-right">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>

    <div class="col-sm-12">
        <div class="col-sm-12">
            <div>
                <!--open tabhead 18-->
                <ul id="ultab18" class="nav nav-tabs tab-bricky">
                    <li class="active">
                        <!--open tabpage 19-->
                        <a href="#tabpage1" data-toggle="tab">รายละเอียดการประชุม
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 92-->
                        <a href="#tabpage2" data-toggle="tab">ผู้เข้าร่วมการประชุม
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 102-->
                        <a href="#tabpage3" data-toggle="tab">ผังที่นั่ง
                        </a>
                    </li>
                    <li class="">
                        <!--open tabpage 105-->
                        <a href="#tabpage4" data-toggle="tab">ระเบียบวาระการประชุม
                        </a>
                    </li>
                </ul>
                <!--end tabhead 150-->
            </div>
            <!--end tabhead 150-->
            <div class="tab-content">
                <!--open tab content 18-->
                <div class="tab-pane active" id="tabpage1">
                    <!--open tabpage 19-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <!--row 20-->
                                <div class="col-sm-6">
                                    <!--col 21-->
                                    <div id="MEETING_RESERVE_DATE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">วันที่จองห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_RESERVE_DATE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 23-->
                                <div class="col-sm-6">
                                    <!--col 24-->
                                    <div id="MEETING_REQUEST_START_DATE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">วันที่ใช้ห้องประชุม <span style="color: red">*</span>:</label>
                                        <div class="col-sm-8">
                                            <asp:UpdatePanel ID="UpdatePanelMEETING_REQUEST_START_DATE" runat="server">
                                                <ContentTemplate>
                                                    <dx:ASPxDateEdit ID="ctlMEETING_REQUEST_START_DATE" Height="30" DropDownButton-Image-IconID="scheduling_calendar_16x16" AutoPostBack="true" DisplayFormatString="d MMM yyyy" runat="server" EditFormat="Custom" Width="100%">
                                                    </dx:ASPxDateEdit>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                           <%-- <div>
                                                <label style="margin: 0px;" for="ctlMEETING_REQUEST_START_DATE">ตัวอย่าง 01/07/2015</label>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 26-->
                            </div>
                            <!--end row 27-->
                            <div class="row">
                                <!--row 28-->
                                <div class="col-sm-6">
                                    <!--col 29-->
                                    <div id="MEETING_REQUEST_START_TIME" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">เวลาเริ่มต้นที่ประชุม <span style="color: red">*</span>:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxComboBox
                                                ID="ctlMEETING_REQUEST_START_TIME" runat="server"
                                                DropDownStyle="DropDown" Height="30"
                                                DataSourceID="dsRMSM_MDM_HOURS"
                                                TextField="HOURS_VALUE" ValueField="HOURS_ID"
                                                Width="100%" IncrementalFilteringMode="StartsWith" />
                                        </div>
                                    </div>
                                </div>
                                <!--end col 31-->
                                <div class="col-sm-6">
                                    <!--col 32-->
                                    <div id="MEETING_REQUEST_END_TIME" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">เวลาสิ้นสุดที่ประชุม <span style="color: red">*</span>:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxComboBox
                                                ID="ctlMEETING_REQUEST_END_TIME" runat="server"
                                                DropDownStyle="DropDown" Height="30"
                                                DataSourceID="dsRMSM_MDM_HOURS"
                                                TextField="HOURS_VALUE" ValueField="HOURS_ID"
                                                Width="100%" IncrementalFilteringMode="StartsWith" />
                                        </div>
                                    </div>
                                </div>
                                <!--end col 34-->
                            </div>
                            <!--end row 35-->
                            <div class="row">
                                <!--row 36-->
                                <div class="col-sm-6">
                                    <!--col 37-->
                                    <div id="ROOM_ID" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ห้องประชุม:</label>
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
                                <!--end col 39-->
                                <div class="col-sm-6">
                                    <!--col 40-->
                                    <div id="MEETING_CODE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">รหัสการประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_CODE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 42-->
                            </div>
                            <!--end row 43-->
                            <div class="row" style="display:none;">
                                <div class="col-sm-6">
                                    <!--col 50-->
                                    <div id="OFFICER_ID" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label" style="Width: 151px;">คณะกรรมการที่ประชุม:</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <dx:ASPxTextBox ID="ctlOFFICER_ID" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                                                <dx:ASPxTextBox ID="ctlOFFICER_ID_label" Width="100%" Height="30"
                                                    runat="server">
                                                </dx:ASPxTextBox>
                                                <span class="input-group-btn">
                                                    <button id="btnOFFICER_ID" class="btn btn-primary" style="width: 30px; height: 30px"
                                                        onclick="OpenLku('lkuOFFICER_ID', 'VIEW_PERSONAL_LookupListView.aspx', '<%=ctlOFFICER_ID.ClientID %>_I', '<%=ctlOFFICER_ID_label.ClientID %>_I')" type="button">
                                                        <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <a id="lkuOFFICER_ID" href="#" class="fancyBoxLku" style="display: none"></a>
                                </div>
                                <!--end col 52-->
                            </div>
                            <div class="row">
                                <!--row 44-->

                                <div class="col-sm-12">
                                    <!--col 45-->
                                    <div id="MEETING_SUBJECT" class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">เรื่อง/คณะที่ประชุม <span style="color: red">*</span>:</label>
                                        <div class="col-sm-10">
                                            <dx:ASPxMemo ID="ctlMEETING_SUBJECT" runat="server"
                                                Width="100%" Height="100">
                                            </dx:ASPxMemo>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 47-->
                            </div>
                            <!--end row 48-->
                            <div class="row">
                                <!--row 49-->

                                <div class="col-sm-6">
                                    <!--col 53-->
                                    <div id="MEETING_AMOUNT" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4">จำนวนผู้เข้าร่วม <span style="color: red">*</span>:</label>
                                        <div class="col-sm-4">
                                            <dx:ASPxSpinEdit ID="ctlMEETING_AMOUNT" runat="server" Height="30" Width="100%">
                                                <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                            </dx:ASPxSpinEdit>

                                        </div>
                                         <div class="col-sm-2">
                                        <label for="">คน</label></div>

                                    </div>
                                </div>
                               

                            </div>
                            <!--end row 56-->
                            <div class="row">
                                <!--row 57-->
                                <div class="col-sm-6">
                                    <!--col 58-->
                                    <div id="MEETING_REQUEST_OFFICER" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ผู้ขอใช้ห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <dx:ASPxTextBox ID="ctlMEETING_REQUEST_OFFICER" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                                                <dx:ASPxTextBox ID="ctlMEETING_REQUEST_OFFICER_label" Width="100%" Height="30"
                                                    runat="server">
                                                </dx:ASPxTextBox>
                                                <span class="input-group-btn">
                                                    <button id="btnMEETING_REQUEST_OFFICER" class="btn btn-primary" style="width: 30px; height: 30px"
                                                        onclick="OpenLku('lkuMEETING_REQUEST_OFFICER', 'VIEW_PERSONAL_LookupListView.aspx', '<%=ctlMEETING_REQUEST_OFFICER.ClientID %>_I', '<%=ctlMEETING_REQUEST_OFFICER_label.ClientID %>_I')" type="button">
                                                        <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <a id="lkuMEETING_REQUEST_OFFICER" href="#" class="fancyBoxLku" style="display: none"></a>
                                </div>
                                <!--end col 60-->
                                <div class="col-sm-6">
                                    <!--col 61-->
                                    <div id="OFFICER_OPSITION_NAME" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ตำแหน่ง:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlOFFICER_OPSITION_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 63-->
                            </div>
                            <!--end row 64-->
                            <div class="row">
                                <!--row 65-->
                                <div class="col-sm-6">
                                    <!--col 66-->
                                    <div id="MEETING_REQUEST_OFFICER_TEL" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_REQUEST_OFFICER_TEL" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 68-->
                                <div class="col-sm-6">
                                    <!--col 69-->
                                    <div id="ORG" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">หน่วยงานที่จอง:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlORG" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 71-->
                            </div>
                            <!--end row 72-->
                             <div class="row">
                                <!--row 73-->
                                <div class="col-sm-6">
                                    <!--col 74-->
                                    <div id="Div1" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ผู้ทำการจอง:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ASPxTextBox5" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 76-->
                                <div class="col-sm-6">
                                    <!--col 61-->
                                    <div id="Div2" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">ตำแหน่ง:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ASPxTextBox6" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-6">
                                    <!--col 66-->
                                    <div id="Div3" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ASPxTextBox7" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            <div class="row">
                                <!--row 73-->
                                <div class="col-sm-12">
                                    <!--col 74-->
                                    <div id="MEETING_ADMIN" class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">ผู้ดูแลห้องประชุม:</label>
                                        <div class="col-sm-10">
                                            <dx:ASPxTextBox ID="ctlMEETING_ADMIN" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 76-->
                            </div>
                            <!--end row 77-->
                            <div class="panel panel-default">
                                <!--open box 78-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    โสตทัศนูปกรณ์
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body78-->
                                    <!--button79-->
                                    <input type="button" value="เพิ่มโสตทัศนูปกรณ์" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_EQUIPMENT_DetailView.aspx';" />
                                    <div>&nbsp;</div>
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_EQUIPMENT_ListView" runat="server" Width="100%"
                                                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                DataSourceID="dsRMSM_RMM_MEETING_EQUIPMENT_ListView" KeyFieldName="MEETING_EQUIPMENT_ID" ClientInstanceName="viewRMSM_RMM_MEETING_EQUIPMENT_ListView" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" Width="5%" ShowSelectCheckbox="False" Caption="ลบ" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MEETING_EQUIPMENT_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Width="5%" VisibleIndex="1" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
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
                                <!--end box body 81-->
                            </div>
                            <!--end box 81-->
                            <div class="panel panel-default">
                                <!--open box 82-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>
                                    บริการการประชุม
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body82-->
                                    <!--button83-->
                                    <input type="button" value="เพิ่มบริการการประชุม" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_SERVICE_DetailView.aspx';" />
                                    <div>&nbsp;</div>
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_SERVICE_ListView" runat="server" Width="100%"
                                                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                DataSourceID="dsRMSM_RMM_MEETING_SERVICE_ListView" KeyFieldName="MEETING_SERVICE_ID" ClientInstanceName="viewRMSM_RMM_MEETING_SERVICE_ListView" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" Width="5%" Caption="ลบ" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MEETING_SERVICE_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Width="5%" VisibleIndex="1" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                        <DataItemTemplate>
                                                            <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_SERVICE_ListView','RMSM_RMM_MEETING_SERVICE_DetailView.aspx?MEETING_SERVICE_ID=<%#Eval("MEETING_SERVICE_ID") %>', viewRMSM_RMM_MEETING_SERVICE_ListView);">
                                                                <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="บริการ" FieldName="SERVICE_NAME" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <Settings ShowFilterRow="False" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
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
                                <!--end box body 85-->
                            </div>
                            <!--end box 85-->
                            <div class="row">
                                <!--row 86-->
                                <div class="col-sm-{value}">
                                    <!--col 87-->
                                    <div id="MEETING_NOTE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-2 control-label">หมายเหตุ:</label>
                                        <div class="col-sm-10">
                                            <dx:ASPxMemo ID="ctlMEETING_NOTE" runat="server"
                                                Width="100%" Height="100">
                                            </dx:ASPxMemo>
                                        </div>
                                    </div>
                                </div>
                                <!--end col 89-->
                            </div>
                            <!--end row 90-->
                        </div>
                    </div>
                </div>
                <!--end tabpage 91-->
                <div class="tab-pane " id="tabpage2">
                    <!--open tabpage 92-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel panel-default">
                                <!--open box 93-->
                                <div class="panel-heading">
                                    <i class="fa fa-external-link-square"></i>

                                    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                </div>
                                <div class="panel-body">
                                    <!--open box body93-->
                                    <div>
                                        <div>


                                            <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" runat="server" Width="100%"
                                                AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                DataSourceID="dsRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" KeyFieldName="MEETING_MEMBER_ID" ClientInstanceName="viewRMSM_RMM_MEETING_MEMBER_MANAGER_ListView" Theme="Metropolis">
                                                <Columns>

                                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                        ShowDeleteButton="True" Caption="ลบ" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MEETING_MEMBER_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn VisibleIndex="1" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
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
                                                <Settings ShowFilterRow="False" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
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
                                    <!--button95-->
                                    <input type="button" value="เพิ่มผู้เข้าร่วมประชุม" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_MEMBER_MANAGER_DetailView.aspx';" />
                                    <!--button96-->
                                    <input type="button" value="บุคคลภายในสปน." style="display: none;" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_MEMBER_OPM_DetailView.aspx';" />
                                    <!--button97-->
                                    <input type="button" value="บุคคลภายนอกสปน." style="display: none;" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_MEMBER_OUT_DetailView.aspx';" />
                                    <!--button98-->
                                    <input type="button" value="พิมพ์ใบสรุปการจอง" class="btn btn-primary" onclick="" />
                                    <!--button99-->
                                    <input type="button" value="พิมพ์ป้ายชื่อเข้าร่วมประชุม" class="btn btn-primary" onclick="" />
                                     <!--button99-->
                                    <input type="button" value="พิมพ์ใบเซ็นต์ชื่อ" class="btn btn-primary" onclick="" />
                                </div>
                                <!--end box body 100-->
                            </div>
                            <!--end box 100-->
                        </div>
                    </div>
                </div>
                <!--end tabpage 101-->
                <div class="tab-pane " id="tabpage3">
                    <!--open tabpage 102-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group col-sm-12">
                                <div class="navbar navbar-inverse " style="background-image: url(../Images/seating.png); background-repeat: no-repeat; min-height: 577px; background-size: 100%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group col-sm-12">
                            <input type="button" class='btn btn-primary' value='พิมพ์ผังที่นั่ง' onclick="location = '#';" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 104-->
                <div class="tab-pane " id="tabpage4">
                    <!--open tabpage 105-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-sm-12">
                                <div>
                                    <!--open tabhead 106-->
                                    <ul id="ultab106" class="nav nav-tabs tab-bricky">
                                        <li class="active">
                                            <!--open tabpage 107-->
                                            <a href="#tabpage5" data-toggle="tab">หัวข้อระเบียบวาระการประชุม
                                            </a>
                                        </li>
                                        <li class="">
                                            <!--open tabpage 111-->
                                            <a href="#tabpage6" data-toggle="tab">รายละเอียดระเบียบวาระการประชุม
                                            </a>
                                        </li>
                                        <li class="">
                                            <!--open tabpage 129-->
                                            <a href="#tabpage7" data-toggle="tab">รายละเอียดระเบียบวาระการประชุมย่อย
                                            </a>
                                        </li>
                                    </ul>
                                    <!--end tabhead 148-->
                                </div>
                                <!--end tabhead 148-->
                                <div class="tab-content">
                                    <!--open tab content 106-->
                                    <div class="tab-pane active" id="tabpage5">
                                        <!--open tabpage 107-->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <!--button108-->
                                                <input type="button" value="เพิ่มวาระการประชุม" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_SUB_DetailView.aspx';" />
                                                <div>&nbsp;</div>
                                                <div>
                                                    <div>


                                                        <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_SUB_ListView" runat="server" Width="100%"
                                                            AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                            DataSourceID="dsRMSM_RMM_MEETING_SUB_ListView" KeyFieldName="AGENDA_SUB_ID" ClientInstanceName="viewRMSM_RMM_MEETING_SUB_ListView" Theme="Metropolis">
                                                            <Columns>

                                                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                    ShowDeleteButton="True" Width="5%" Caption="ลบ" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
                                                                    <DataItemTemplate>
                                                                        <a target="_blank" onclick="OpenChildDetail('fancyBoxRMSM_RMM_MEETING_SUB_ListView','RMSM_RMM_MEETING_SUB_DetailView.aspx?AGENDA_SUB_ID=<%#Eval("AGENDA_SUB_ID") %>', viewRMSM_RMM_MEETING_SUB_ListView);">
                                                                            <img src="images/edit.png" style="border: none" alt="edit" /></a>
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="ระเบียบวาระที่" Width="10%" FieldName="AGENDA_SUB_SEQ" VisibleIndex="3">
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="เรื่อง" FieldName="AGENDA_SUB_TOPIC" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="ผู้นำเสนอ" FieldName="PresentorName" VisibleIndex="5">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowFilterRow="False" ShowFilterRowMenu="true" ShowHeaderFilterButton="false" ShowGroupPanel="False" />
                                                            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" />
                                                            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" />
                                                            <SettingsCommandButton>
                                                                <DeleteButton>
                                                                    <Image ToolTip="ลบ" Url="Images/del.png" />
                                                                </DeleteButton>
                                                            </SettingsCommandButton>
                                                        </dx:ASPxGridView>
                                                        <a id="fancyBoxRMSM_RMM_MEETING_SUB_ListView" class='fancyBox' style="display: none"></a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tabpage 110-->
                                    <div class="tab-pane " id="tabpage6">
                                        <!--open tabpage 111-->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <!--row 112-->
                                                    <div class="col-sm-12">
                                                        <!--col 113-->
                                                        <div id="AGENDA_SUB_SEQ" class="form-group col-sm-12">

                                                            <label for="" class="col-sm-3">ระเบียบวาระการประชุมที่:</label>
                                                            <div class="col-sm-2">
                                                                <dx:ASPxSpinEdit ID="ctlAGENDA_SUB_SEQ" runat="server" Height="30" Width="100%">
                                                                    <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                                                </dx:ASPxSpinEdit>
                                                            </div>

                                                        </div>
                                                        <div id="AGENDA_SUB_TOPIC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3 ">เรื่อง:</label>
                                                            <div class="col-sm-9">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_SUB_TOPIC" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_SUB_DESC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3 ">รายละเอียด:</label>
                                                            <div class="col-sm-9">
                                                                <dx:ASPxMemo ID="ctlAGENDA_SUB_DESC" runat="server"
                                                                    Width="100%" Height="100">
                                                                </dx:ASPxMemo>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_SUB_PERSONAL" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3">ผู้นำเสนอ:</label>
                                                            <div class="col-sm-9">
                                                                <div class="input-group">
                                                                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                                                                    <dx:ASPxTextBox ID="ASPxTextBox2" Width="100%" Height="30"
                                                                        runat="server">
                                                                    </dx:ASPxTextBox>
                                                                    <span class="input-group-btn">
                                                                        <button id="Button1" class="btn btn-primary" style="width: 30px; height: 30px"
                                                                            onclick="OpenLku('lkuOFFICER_ID', 'VIEW_PERSONAL_LookupListView.aspx', '<%=ctlOFFICER_ID.ClientID %>_I', '<%=ctlOFFICER_ID_label.ClientID %>_I')" type="button">
                                                                            <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a id="A1" href="#" class="fancyBoxLku" style="display: none"></a>

                                                        <div id="AGENDA_SUB_BOARD" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3 ">มติที่ประชุม:</label>
                                                            <div class="col-sm-9">
                                                                <dx:ASPxMemo ID="ctlAGENDA_SUB_BOARD" runat="server"
                                                                    Width="100%" Height="100">
                                                                </dx:ASPxMemo>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <!--end col 118-->
                                                </div>
                                                 <input type="button" value="เพิ่มวาระย่อย" class="btn btn-primary" onclick="" />
                                                  <div>&nbsp;</div>
                                              
                                                <!--end row 119-->
                                                <div class="panel panel-default">
                                                    <!--open box 120-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body120-->
                                                        <!--button121-->
                                                        <input type="button" value="Upload" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_AGENDA_SUB_DOC_DetailView.aspx';" />
                                                        <div>&nbsp;</div>
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" KeyFieldName="AGENDA_SUB_DOC" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_DOC_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
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
                                                    <!--end box body 123-->
                                                </div>
                                                <!--end box 123-->
                                                <div class="panel panel-default">
                                                    <!--open box 124-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body124-->
                                                        <!--button125-->
                                                        <input type="button" value="แนบ URL" class="btn btn-primary" onclick="location = 'RMSM_RMM_MEETING_AGENDA_SUB_URL_DetailView.aspx';" />
                                                        <div>&nbsp;</div>
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" KeyFieldName="AGENDA_SUB_URL_ID" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_SUB_URL_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_URL_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
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
                                                    <!--end box body 127-->
                                                </div>
                                                <!--end box 127-->
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tabpage 128-->
                                    <div class="tab-pane " id="tabpage7">
                                        <!--open tabpage 129-->
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <!--row 130-->
                                                    <div class="col-sm-12">
                                                        <!--col 131-->
                                                        <div id="AGENDA_DETAIL_ID" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3 ">ระเบียบวาระการประชุมที่:</label>
                                                            <div class="col-sm-2">
                                                                <div class="input-group">
                                                                    <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_ID" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                                                                    <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_ID_label" Width="100%" Height="30"
                                                                        runat="server">
                                                                    </dx:ASPxTextBox>
                                                                    <span class="input-group-btn">
                                                                        <button id="btnAGENDA_DETAIL_ID" class="btn btn-primary" style="width: 30px; height: 30px"
                                                                            onclick="OpenLku('lkuAGENDA_DETAIL_ID', 'RMSM_RMM_MEETING_AGENDA_LookupListView.aspx', '<%=ctlAGENDA_DETAIL_ID.ClientID %>_I', '<%=ctlAGENDA_DETAIL_ID_label.ClientID %>_I')" type="button">
                                                                            <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a id="lkuAGENDA_DETAIL_ID" href="#" class="fancyBoxLku" style="display: none"></a>
                                                        <div id="AGENDA_DETAIL_SEQ" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3 ">ระเบียบวาระที่:</label>
                                                            <div class="col-sm-2">
                                                                <dx:ASPxSpinEdit ID="ctlAGENDA_DETAIL_SEQ" runat="server" Height="30" Width="100%">
                                                                    <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                                                </dx:ASPxSpinEdit>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_TOPIC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3">เรื่อง:</label>
                                                            <div class="col-sm-9">
                                                                <dx:ASPxTextBox ID="ctlAGENDA_DETAIL_TOPIC" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_DESC" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3">รายละเอียด:</label>
                                                            <div class="col-sm-9">
                                                                <dx:ASPxMemo ID="ctlAGENDA_DETAIL_DESC" runat="server"
                                                                    Width="100%" Height="100">
                                                                </dx:ASPxMemo>
                                                            </div>
                                                        </div>
                                                        <div id="AGENDA_DETAIL_PERSONAL" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3">ผู้นำเสนอ:</label>
                                                            <div class="col-sm-9">
                                                                <div class="input-group">
                                                                    <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" ClientVisible="false"></dx:ASPxTextBox>
                                                                    <dx:ASPxTextBox ID="ASPxTextBox4" Width="100%" Height="30"
                                                                        runat="server">
                                                                    </dx:ASPxTextBox>
                                                                    <span class="input-group-btn">
                                                                        <button id="Button2" class="btn btn-primary" style="width: 30px; height: 30px"
                                                                            onclick="OpenLku('lkuOFFICER_ID', 'VIEW_PERSONAL_LookupListView.aspx', '<%=ctlOFFICER_ID.ClientID %>_I', '<%=ctlOFFICER_ID_label.ClientID %>_I')" type="button">
                                                                            <span class="glyphicon glyphicon-search" style="margin-left: -5px"></span>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a id="A2" href="#" class="fancyBoxLku" style="display: none"></a>
                                                        <div id="AGENDA_DETAIL_BOARD" class="form-group col-sm-12">
                                                            <label for="" class="col-sm-3">มติที่ประชุม:</label>
                                                            <div class="col-sm-9">
                                                                <dx:ASPxMemo ID="ctlAGENDA_DETAIL_BOARD" runat="server"
                                                                    Width="100%" Height="100">
                                                                </dx:ASPxMemo>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--end col 137-->
                                                </div>
                                                <!--end row 138-->
                                                <div class="panel panel-default">
                                                    <!--open box 139-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบเอกสารประกอบ
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body139-->
                                                        <!--button140-->
                                                        <input type="button" value="Upload" class="btn btn-primary" />
                                                        <div>&nbsp;</div>
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" KeyFieldName="AGENDA_DETAIL_DOC" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_DOC_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
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
                                                    <!--end box body 142-->
                                                </div>
                                                <!--end box 142-->
                                                <div class="panel panel-default">
                                                    <!--open box 143-->
                                                    <div class="panel-heading">
                                                        <i class="fa fa-external-link-square"></i>
                                                        แนบ URL
    <div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a></div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <!--open box body143-->
                                                        <!--button144-->
                                                        <input type="button" value="แนบ URL" class="btn btn-primary" />
                                                        <div>&nbsp;</div>
                                                        <div>
                                                            <div>


                                                                <dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" runat="server" Width="100%"
                                                                    AutoGenerateColumns="False" Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                                                                    DataSourceID="dsRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" KeyFieldName="AGENDA_DETAIL_URL_ID" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_DETAIL_URL_ListView" Theme="Metropolis">
                                                                    <Columns>

                                                                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                                                                            ShowDeleteButton="True" Caption="ลบ" Width="5%" CellStyle-HorizontalAlign="Center" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
                                                                        </dx:GridViewCommandColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA_DETAIL_URL_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" Caption="แก้ไข">
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
                                                    <!--end box body 146-->
                                                </div>
                                                <!--end box 146-->
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tabpage 147-->
                                </div>
                                <!--end tab 148-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--end tabpage 149-->
            </div>
            <!--end tab 150-->
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
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SUB_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB WHERE [AGENDA_SUB_ID] = @AGENDA_SUB_ID"
            SelectCommand="SELECT RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_ID ,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
,'ปวีณา พิทักษ์พัฒนเสนทร์' as PresentorName
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB]">
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
        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT DISTINCT [dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_AGENDA_ID
,[dbo].[RMSM_RMM_MEETING_AGENDA_SUB].MEETING_AGENDA_ID
,[dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_ID
,[dbo].[RMSM_RMM_MEETING_AGENDA_SUB].AGENDA_SUB_ID
,RMSM_RMM_MEETING.MEETING_RESERVE_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_START_DATE
,RMSM_RMM_MEETING.MEETING_REQUEST_START_TIME
,RMSM_RMM_MEETING.MEETING_REQUEST_END_TIME
,RMSM_RMM_MEETING.ROOM_ID
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME
,RMSM_RMM_MEETING.MEETING_CODE 
,RMSM_RMM_MEETING.MEETING_SUBJECT
,RMSM_RMM_MEETING.MEETING_REQUEST_OFFICER as OFFICER_ID
,RMSM_RMM_MEETING.MEETING_AMOUNT
,RMSM_RMM_MEETING.MEETING_REQUEST_OFFICER
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_OPSITION_NAME
,RMSM_RMM_MEETING.MEETING_REQUEST_OFFICER_TEL
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].ORG
,RMSM_RMM_MEETING.MEETING_ADMIN
,RMSM_RMM_MEETING.MEETING_NOTE
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_ID
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_SEQ
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_TOPIC
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_DESC
,RMSM_RMM_MEETING_AGENDA_DETAIL.AGENDA_DETAIL_BOARD
FROM [dbo].[RMSM_RMM_MEETING]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_RMM_MEETING].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_RMM_MEETING].MEETING_REQUEST_OFFICER = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA] on
[dbo].[RMSM_RMM_MEETING].MEETING_ID = [dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA_SUB] on
[dbo].[RMSM_RMM_MEETING_AGENDA].MEETING_AGENDA_ID = [dbo].[RMSM_RMM_MEETING_AGENDA_SUB].MEETING_AGENDA_ID
LEFT JOIN [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL] on
[dbo].[RMSM_RMM_MEETING_AGENDA_SUB].AGENDA_SUB_ID = [dbo].[RMSM_RMM_MEETING_AGENDA_DETAIL].AGENDA_SUB_ID
WHERE [dbo].[RMSM_RMM_MEETING].RECORD_STATUS = 'A'"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="MEETING_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_EQUIPMENT" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_EQUIPMENT_ID,MEETING_EQUIPMENT_ID from RMSM_RMM_MEETING_EQUIPMENT"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_SERVICE" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MEETING_SERVICE_ID,MEETING_SERVICE_ID from RMSM_RMM_MEETING_SERVICE"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_SUB" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select AGENDA_SUB_TOPIC,AGENDA_SUB_ID from RMSM_RMM_MEETING_AGENDA_SUB"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_HOURS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="SELECT TOP 1000 [HOURS_ID]
      ,  replace(cast ([HOURS_VALUE] as varchar),'.',':') as HOURS_VALUE
      ,[HOURS_FLAG]
      ,[HOURS_ITEM]
  FROM [OPM_RMS].[dbo].[RMSM_MDM_HOURS] order by HOURS_ID"></asp:SqlDataSource>

    </div>
</asp:Content>

