<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_CHANGE_STATUS_INFO_DetailView.aspx.cs" Inherits="RMSM_MDM_CHANGE_STATUS_INFO_DetailView" %>

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
    <div class="form-group col-sm-12" style="margin-top: 50px;">
        <div class="col-sm-offset-10 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
              <asp:Button ID="btnBack" runat="server" Text="ย้อนกลับ" CssClass="btn btn-success btn-80" OnClick="btnBack_Click" />
            <asp:Button ID="Button1" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">การเปลี่ยนสถานะห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0507)</span>
    </div>

    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-6">
                <!--col 19-->
                                    <!--col 40-->
                                    <div id="MEETING_CODE" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">รหัสการประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxTextBox ID="ctlMEETING_CODE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                
                <div id="ROOM_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ห้องประชุม <span style="color: red">*</span>:</label>
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
            <!--end col 21-->
        </div>
        <!--end row 22-->
        <div class="row">
            <!--row 23-->
            <div class="col-sm-6">
                <!--col 24-->
                <div id="CHANGE_START_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่เริ่มต้น <span style="color: red">*</span>:</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelCHANGE_START_DATE" runat="server">
                            <ContentTemplate>
                                <dx:ASPxDateEdit ID="ctlCHANGE_START_DATE" DropDownButton-Image-IconID="scheduling_calendar_16x16" Height="30" AutoPostBack="true" DisplayFormatString="d MMM yyyy" runat="server" EditFormat="Custom" Width="100%">
                                </dx:ASPxDateEdit>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <!--end col 26-->
            <div class="col-sm-6">
                <!--col 27-->
                <div id="CHANGE_END_DATE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">วันที่สิ้นสุด <span style="color: red">*</span>:</label>
                    <div class="col-sm-8">
                        <asp:UpdatePanel ID="UpdatePanelCHANGE_END_DATE" runat="server">
                            <ContentTemplate>
                                <dx:ASPxDateEdit ID="ctlCHANGE_END_DATE" DropDownButton-Image-IconID="scheduling_calendar_16x16" Height="30" AutoPostBack="true" DisplayFormatString="d MMM yyyy" runat="server" EditFormat="Custom" Width="100%">
                                </dx:ASPxDateEdit>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <!--end col 29-->
            <div class="col-sm-6">
                <!--col 30-->
                <div id="ROOM_STATUS" class="form-group col-sm-12">
                                        <label for="" class="col-sm-4 control-label">สถานะห้องประชุม:</label>
                                        <div class="col-sm-8">
                                            <dx:ASPxRadioButtonList
                                                ID="ctlROOM_STATUS" runat="server" DataSourceID="dsROOM_STATUS"
                                                TextField="txt" ValueField="id" Border-BorderStyle="None"
                                                RepeatColumns="4" RepeatLayout="Table">
                                            </dx:ASPxRadioButtonList>
                                        </div>
                                    </div>
            </div>
            <!--end col 32-->
        </div>
        <!--end row 33-->

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_CHANGE_STATUS_INFO_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT RMSM_MDM_CHANGE_STATUS_INFO.ROOM_ID
,[dbo].[RMSM_MDM_ROOM_INFO].ROOM_NAME
,RMSM_MDM_CHANGE_STATUS_INFO.CHANGE_START_DATE
,RMSM_MDM_CHANGE_STATUS_INFO.CHANGE_END_DATE
,[dbo].[RMSM_MDM_CHANGE_STATUS_ROOM_INFO].[CHANGE_STATUS_ROOM_ID]
,[dbo].[RMSM_MDM_CHANGE_STATUS_ROOM_INFO].[CHANGE_NAME] 
FROM [dbo].[RMSM_MDM_CHANGE_STATUS_INFO]
LEFT JOIN [dbo].[RMSM_MDM_CHANGE_STATUS_ROOM_INFO] on
[dbo].[RMSM_MDM_CHANGE_STATUS_INFO].CHANGE_STATUS = [dbo].[RMSM_MDM_CHANGE_STATUS_ROOM_INFO].[CHANGE_STATUS_ROOM_ID]
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_MDM_CHANGE_STATUS_INFO].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID 
WHERE CHANGE_STATUS_ID = @CHANGE_STATUS_ID"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="CHANGE_STATUS_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="CHANGE_STATUS_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_CHANGE_STATUS_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select CHANGE_NAME,CHANGE_STATUS_ROOM_ID from RMSM_MDM_CHANGE_STATUS_ROOM_INFO"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsROOM_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ปกติ'  union all select '2','งดใช้งาน'  union all select '3','ไม่ใช้งาน' ) aa where id <> '-1'"></asp:SqlDataSource>

    </div>
</asp:Content>

