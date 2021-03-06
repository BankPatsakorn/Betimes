﻿<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_ADMIN_INFO_DetailView.aspx.cs" Inherits="RMSM_MDM_ADMIN_INFO_DetailView" %>

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
        <span style="font-size: 23px">ผู้ดูแลห้องประชุม</span><span style="font-size: 20px; color: gray;"> (RMS_UT0506)</span>
    </div>

    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-12">
                <!--col 19-->
                <div id="OFFICER_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ-นามสกุล<span style="color: red">*</span>:</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <dx:ASPxTextBox ID="ctlOFFICER_ID" runat="server" ClientInstanceName="ctlOFFICER_ID" ClientVisible="false"></dx:ASPxTextBox>
                            <dx:ASPxTextBox ID="ctlOFFICER_ID_label" Width="100%" Height="30" ClientInstanceName="ctlOFFICER_ID_label"
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
                <div id="UNIT_NAME" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">หน่วยงาน:</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlUNIT_NAME" Enabled="False" Height="30" ForeColor="#000000" BackColor="#DDDDDD" runat="server" Width="100%"></dx:ASPxTextBox>
                    </div>
                </div>
               <%-- <div id="ROOM_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อห้องประชุม<span style="color: red">*</span>:</label>
                    <div class="col-sm-8">
                        <dx:ASPxComboBox
                            ID="ctlROOM_ID" runat="server"
                            DropDownStyle="DropDown" Height="30"
                            DataSourceID="dsRMSM_MDM_ROOM_INFO"
                            TextField="ROOM_NAME" ValueField="ROOM_ID"
                            Width="100%" IncrementalFilteringMode="StartsWith" />
                    </div>
                </div>--%>
            </div>
            <!--end col 23-->
        </div>
        <!--end row 24-->

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_ADMIN_INFO_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT DISTINCT RMSM_MDM_ADMIN_INFO.ADMIN_ID,[OPM_COMMON_DATA].[dbo].[VIEW_ORGANIZE].UNIT_ID
,[OPM_COMMON_DATA].[dbo].[VIEW_ORGANIZE].UNIT_NAME
,[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].NAME
,RMSM_MDM_ADMIN_INFO.OFFICER_ID
,[dbo].[RMSM_MDM_ADMIN_INFO].ROOM_ID
FROM [dbo].[RMSM_MDM_ADMIN_INFO]
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL] on
[dbo].[RMSM_MDM_ADMIN_INFO].OFFICER_ID = [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].OFFICER_ID
LEFT JOIN [OPM_COMMON_DATA].[dbo].[VIEW_ORGANIZE] on
[OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL].UNIT_ID = [OPM_COMMON_DATA].[dbo].[VIEW_ORGANIZE].UNIT_ID
LEFT JOIN [dbo].[RMSM_MDM_ROOM_INFO] on
[dbo].[RMSM_MDM_ADMIN_INFO].ROOM_ID = [dbo].[RMSM_MDM_ROOM_INFO].ROOM_ID
WHERE RMSM_MDM_ADMIN_INFO.ADMIN_ID = @ADMIN_ID"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="ADMIN_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="ADMIN_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsVIEW_ORGANIZE" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select MINISTRY_NAME_THA, from VIEW_ORGANIZE"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsRMSM_MDM_ROOM_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select ROOM_NAME,ROOM_ID from RMSM_MDM_ROOM_INFO"></asp:SqlDataSource>

    </div>
</asp:Content>

