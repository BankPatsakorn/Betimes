<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="RMSM_MDM_TEXT_TICKER_INFO_DetailView.aspx.cs" Inherits="RMSM_MDM_TEXT_TICKER_INFO_DetailView" %>

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
    <div>&nbsp;</div>
    <div style="padding-left: 2em; padding-right: 2em; padding-top: 2em; padding-bottom: 0em">
        <span style="font-size: 23px">จัดการตัววิ่ง</span><span style="font-size: 20px; color: gray;"> (RMS_UT0509)</span>
    </div>
    <div class="form-group col-sm-12" style="margin-top: 10px;">
        <div class="col-sm-offset-10 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div class="col-sm-12">
        <div class="row">
            <!--row 18-->
            <div class="col-sm-8">
                <!--col 19-->
                <div id="TEXT_DESC" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รายละเอียดตัววิ่ง:</label>
                    <div class="col-sm-8">
                       <dx:ASPxMemo ID="ctlTEXT_DESC" runat="server" Width="100%" Height="100"> </dx:ASPxMemo>
                    </div>
                </div>
                <div id="TEXT_STATUS" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">สถานะการใช้งาน:</label>
                    <div class="col-sm-8">
                        <dx:ASPxRadioButtonList
                            ID="ctlTEXT_STATUS" runat="server" DataSourceID="dsTEXT_STATUS"
                            TextField="txt" ValueField="id" Border-BorderStyle="None"
                            RepeatColumns="4" RepeatLayout="Table">
                        </dx:ASPxRadioButtonList>
                    </div>
                </div>
                <div id="TEXT_SPEED" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ความเร็วของตัววิ่ง:</label>
                    <div class="col-sm-8">
                        <dx:ASPxRadioButtonList
                            ID="ctlTEXT_SPEED" runat="server" DataSourceID="dsTEXT_SPEED"
                            TextField="txt" ValueField="id" Border-BorderStyle="None"
                            RepeatColumns="4" RepeatLayout="Table">
                        </dx:ASPxRadioButtonList>
                    </div>
                </div>
                 <div id="Div1" class="form-group col-sm-12">
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

        <a id="fancyBoxRMSM_MDM_TEXT_TICKER_INFO_ListView" class='fancyBox' style="display: none"></a>

    </div>
    <div>

        <asp:SqlDataSource ID="dsRMSM_MDM_TEXT_TICKER_INFO_ListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM RMSM_MDM_TEXT_TICKER_INFO WHERE [TEXT_TICKER_ID] = @TEXT_TICKER_ID"
            SelectCommand="SELECT [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_TICKER_ID]
,[dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_DESC]
,case when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_STATUS]=0 then 'ใช้งาน' when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_STATUS]=1 then 'ไม่ใช้งาน' end as TEXT_STATUS
,case when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_SPEED]=0 then 'ปกติ' when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_SPEED]=1 then 'ปานกลาง' when [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[TEXT_SPEED]=2 then 'เร็ว' end as TEXT_SPEED
FROM [dbo].[RMSM_MDM_TEXT_TICKER_INFO]
WHERE  [dbo].[RMSM_MDM_TEXT_TICKER_INFO].[RECORD_STATUS] = 'A'">
            <DeleteParameters>
                <asp:Parameter Name="TEXT_TICKER_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRMSM_MDM_TEXT_TICKER_INFO_DetailView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand=""
            SelectCommand="SELECT RMSM_MDM_TEXT_TICKER_INFO.TEXT_DESC
,RMSM_MDM_TEXT_TICKER_INFO.TEXT_STATUS
,RMSM_MDM_TEXT_TICKER_INFO.TEXT_SPEED
FROM [dbo].[RMSM_MDM_TEXT_TICKER_INFO]
WHERE TEXT_TICKER_ID = @TEXT_TICKER_ID"
            InsertCommand=""
            UpdateCommand="">
            <DeleteParameters>
                <asp:Parameter Name="TEXT_TICKER_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="TEXT_TICKER_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsTEXT_STATUS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ใช้งาน'  union all select '2','ไม่ใช้งาน' ) aa where id <> '-1'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsTEXT_SPEED" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','ช้า'  union all select '2','ปานกลาง'  union all select '3','เร็ว' ) aa where id <> '-1'"></asp:SqlDataSource>
          <asp:SqlDataSource ID="dsTEXT_SIZE" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select * from (select '-1' id, 'กรุณาเลือก' txt  union all select '1','เล็ก'  union all select '2','กลาง'  union all select '3','ใหญ่' ) aa where id <> '-1'"></asp:SqlDataSource>
    </div>
</asp:Content>

