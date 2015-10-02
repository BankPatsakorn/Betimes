<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        var lkuValueId = "";
        var lkuLabelId = "";
        $(document).ready(function () {
            $('.fancyBox').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    location.reload();
                }
            });
            $('.fancyBoxLku').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {

                }
            });
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
            $("#" + lkuLabelId).val(val);
        }

        function OpenChildDetail(id, href) {
            $("#" + id).attr("href", href);
            $("#" + id).click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-group col-sm-12" style="margin-top: 20px;">
        <div class="col-sm-offset-3 col-sm-6">
            <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
        </div>
    </div>
    <div>
        <h1></h1>
    </div>
    <%--<div>
        <input type="button" class='btn btn-primary' value=' Save ' />
    </div>--%>
    <div class="col-sm-12">
        <div class="panel panel-default">
            <!--open box 14-->
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
                คณะตรวจรับ
            </div>
            <div class="panel-body">
                <!--open box body-->
                <div id="PERSONAL_CARD_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">รหัสเจ้าหน้าที่ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlPERSONAL_CARD_ID" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="PERSONAL_ID" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ชื่อ-สกุล :</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <asp:HiddenField ID="ctlPERSONAL_ID" runat="server"></asp:HiddenField>
                            <dx:ASPxTextBox ID="ctlPERSONAL_ID_label" CssClass="form-control"
                                runat="server" Width="0">
                            </dx:ASPxTextBox>
                            <span class="input-group-btn">
                                <button id="btnPERSONAL_ID" class="btn btn-primary"
                                    onclick="OpenLku('lkuPERSONAL_ID', 'PERSONAL_ID.aspx', 'ctlPERSONAL_ID', 'ctlPERSONAL_ID_label')" type="button">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <a id="lkuPERSONAL_ID" href="#" class="fancyBokLku" style="display: none"></a>
                <div id="SECTION" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่ง :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlSECTION" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="BORAD_POSITION" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">ตำแหน่งในคณะกรรมการ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlBORAD_POSITION" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="TEL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">เบอร์โทรศัพท์ :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlTEL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
                <div id="EMAIL" class="form-group col-sm-12">
                    <label for="" class="col-sm-4 control-label">อีเมล :</label>
                    <div class="col-sm-8">
                        <dx:ASPxTextBox ID="ctlEMAIL" CssClass="form-control" runat="server" Width="0"></dx:ASPxTextBox>
                    </div>
                </div>
            </div>
        </div>
        <!--end box 21-->

    </div>
    <div>

        <asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_BORAD_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_BORAD WHERE [BORAD_ID] = @BORAD_ID"
            SelectCommand="select 
VIEW_COMMON_MASTER_PERSONAL.PERSONAL_CARD_ID
,VIEW_COMMON_MASTER_PERSONAL.PERSONAL_ID
,VIEW_COMMON_MASTER_PERSONAL.SECTION
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_POSITION
,VIEW_COMMON_MASTER_PERSONAL.TEL
,VIEW_COMMON_MASTER_PERSONAL.EMAIL
 
from CRMT_PMM_PROJECT_CONTRACT_BORAD 
left join VIEW_COMMON_MASTER_PERSONAL on  
where  1=1  AND CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_ID=@BORAD_ID"
            InsertCommand="insert into CRMT_PMM_PROJECT_CONTRACT_BORAD
(
BORAD_POSITION
)
values
(
@BORAD_POSITION
)"
            UpdateCommand="update CRMT_PMM_PROJECT_CONTRACT_BORAD 
set 
BORAD_POSITION=@BORAD_POSITION
 
where  1=1 
 AND BORAD_ID=@BORAD_ID">
            <DeleteParameters>
                <asp:Parameter Name="BORAD_ID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="BORAD_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsVIEW_COMMON_MASTER_PERSONAL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="select , from VIEW_COMMON_MASTER_PERSONAL"></asp:SqlDataSource>

    </div>
</asp:Content>

