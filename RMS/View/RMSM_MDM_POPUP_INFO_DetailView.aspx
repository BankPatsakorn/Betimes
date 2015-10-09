<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_POPUP_INFO_DetailView.aspx.cs" Inherits="RMSM_MDM_POPUP_INFO_DetailView" %>

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
 
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 3em; padding-bottom: 0em">
        <span style="font-size: 23px">จัดการ Pop Up</span><span style="font-size: 20px; color: gray;"> (RMS_UT0508)</span>
    </div>

    <div class="form-group col-sm-12" style="margin-top: 10px;">
        <div class="col-sm-12 text-right">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ย้อนกลับ" CssClass="btn btn-success btn-80" OnClientClick="window.location = 'RMSM_MDM_POPUP_INFO_ListView.aspx'; return false;"  Visible="false" />
            <asp:Button ID="btnCancel" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" />
        </div>
    </div>

    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-6">
                <!--col 19-->
                <div id="POPUP_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ Pop Up:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlPOPUP_NAME" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="Div1" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ข้อความ:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlPOPUP_MESSAGE" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
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
                <div id="MENU_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เลือกหน้าจอที่แสดง:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ctlMENU_ID" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            DataSourceID="dsRMSM_MDM_MENU_INFO"
                            TextField="MENU_NAME" ValueField="MENU_ID"
                            Width="100%" IncrementalFilteringMode="StartsWith" />
                    </div>
                </div>
                <div id="POPUP_STATUS" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะการใช้งาน:</label>
                    <div class="col-sm-8">
                        <dx:ASPxRadioButtonList
                            ID="ctlPOPUP_STATUS" runat="server" DataSourceID="dsPOPUP_STATUS"
                            TextField="txt" ValueField="id" Border-BorderStyle="None"
                            RepeatColumns="4" RepeatLayout="Table">
                        </dx:ASPxRadioButtonList>
                    </div>
                </div>
                <div id="Div2" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ขนาดตัวอักษร:</label>
                    <div class="col-sm-8">
                        <dx:ASPxRadioButtonList
                            ID="ctlTEXT_SIZE" runat="server" DataSourceID="dsTEXT_SIZE"
                            TextField="txt" ValueField="id" Border-BorderStyle="None"
                            RepeatColumns="4" RepeatLayout="Table">
                        </dx:ASPxRadioButtonList>
                    </div>
                </div>
            </div>
            <!--end col 23-->
        </div>
        <!--end row 24-->


        <a id="fancyBoxRMSM_MDM_POPUP_INFO_ListView" class='fancyBox' style="display: none"></a>

    </div>

    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_POPUP_INFO_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT RMSM_MDM_POPUP_INFO.POPUP_NAME
,RMSM_MDM_POPUP_INFO.POPUP_MESSAGE
,RMSM_MDM_POPUP_INFO.ROOM_ID
,RMSM_MDM_POPUP_INFO.MENU_ID
,RMSM_MDM_POPUP_INFO.POPUP_STATUS
,RMSM_MDM_POPUP_INFO.FONT_SIZE
FROM [dbo].[RMSM_MDM_POPUP_INFO]
LEFT JOIN [dbo].[RMSM_MDM_MENU_INFO] on
[dbo].[RMSM_MDM_POPUP_INFO].MENU_ID = [dbo].[RMSM_MDM_MENU_INFO].MENU_ID
WHERE POPUP_ID = @POPUP_ID"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="POPUP_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="POPUP_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_MENU_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MENU_NAME,MENU_ID from RMSM_MDM_MENU_INFO"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsPOPUP_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ใช้งาน'  union all select '2','ไม่ใช้งาน' ) aa where id <> '-1'"></asp:SqlDataSource>

          <asp:SqlDataSource ID="dsTEXT_SIZE" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','เล็ก'  union all select '2','กลาง'  union all select '3','ใหญ่' ) aa where id <> '-1'"></asp:SqlDataSource>
      <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>
    </div>
</asp:Content>

