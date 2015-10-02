<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_SERVICE_INFO_DetailView.aspx.cs" Inherits="RMSM_MDM_SERVICE_INFO_DetailView" %>

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
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ย้อนกลับ" CssClass="btn btn-success btn-80" OnClientClick="JavaScript:window.history.back(1); return false;" />
            <asp:Button ID="Button1" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 2em">
        <span style="font-size: 23px">จัดการบริการการประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0505)</span>
    </div>

    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-6">
                <!--col 19-->
                <div id="SERVICE_CODE" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รหัสบริการ:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlSERVICE_CODE" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="SERVICE_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อบริการ<span style="color: red">*</span>:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlSERVICE_NAME" runat="server" Height="30" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="COUNT_UNIT_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยนับ:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ctlCOUNT_UNIT_ID" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            DataSourceID="dsCOMM_MDM_COUNT_UNIT_INFO"
                            TextField="COUNT_UNIT_NAME" ValueField="COUNT_UNIT_ID"
                            Width="100%" IncrementalFilteringMode="StartsWith" />
                    </div>
                </div>
            </div>
            <!--end col 23-->
        </div>
        <!--end row 24-->

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_SERVICE_INFO_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT RMSM_MDM_SERVICE_INFO.SERVICE_CODE
,RMSM_MDM_SERVICE_INFO.SERVICE_NAME
,RMSM_MDM_SERVICE_INFO.COUNT_UNIT_ID
FROM [dbo].[RMSM_MDM_SERVICE_INFO]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO] on
[dbo].[RMSM_MDM_SERVICE_INFO].COUNT_UNIT_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
WHERE SERVICE_ID = @SERVICE_ID"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="SERVICE_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="SERVICE_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsCOMM_MDM_COUNT_UNIT_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select COUNT_UNIT_NAME,COUNT_UNIT_ID from [OPM_COMMON_DATA].[dbo].COMM_MDM_COUNT_UNIT_INFO"></asp:SqlDataSource>

    </div>
</asp:Content>

