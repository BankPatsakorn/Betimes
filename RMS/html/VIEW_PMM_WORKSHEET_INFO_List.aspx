<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="VIEW_PMM_WORKSHEET_INFO_List.aspx.cs" Inherits="VIEW_PMM_WORKSHEET_INFO_List" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
		var lkuValueId="";
		var lkuLabelId="";
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%--<div class="form-group col-sm-12" style="margin-top: 20px;">
                    <div class="col-sm-offset-3 col-sm-6">
                        <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
                    </div>
     </div>--%>
    <div>
<h1>ค้นหาโครงการ</h1>
</div>
<div>
<input type="button" class='btn btn-primary' value=' Add ' onclick="location='VIEW_PMM_WORKSHEET_INFO_Detail.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewVIEW_PMM_WORKSHEET_INFO_List" runat="server" Width="100%" AutoGenerateColumns="False" 
DataSourceID="dsVIEW_PMM_WORKSHEET_INFO_List" KeyFieldName="OPEN_ID"  ClientInstanceName="viewVIEW_PMM_WORKSHEET_INFO_List" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="OPEN_ID"  Visible="false" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="location='VIEW_PMM_WORKSHEET_INFO_Detail.aspx?OPEN_ID=<%#Eval("OPEN_ID") %>';"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataSpinEditColumn Caption="รหัสใบงาน" FieldName="OPEN_ID" VisibleIndex="3">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อโครงการ" FieldName="PROJECT_NAME" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="รหัสลูกค้า" FieldName="CUST_CODE" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อลูกค้า" FieldName="ORGANIZE_NAME_THA" VisibleIndex="6">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataCheckColumn Caption="สถานะ" FieldName="OPEN_STATUS" VisibleIndex="7">
</dx:GridViewDataCheckColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" /> 
            <SettingsText ConfirmDelete="ท่านต้องการลบรายการนี้หรือไม่?" /> 
<SettingsCommandButton>
            <DeleteButton>
                <Image ToolTip="ลบ" Url="../Images/remove.png" Height="15" Width="15" />
            </DeleteButton>
        </SettingsCommandButton>
        </dx:ASPxGridView>
<a id="fancyBoxVIEW_PMM_WORKSHEET_INFO_List" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsVIEW_PMM_WORKSHEET_INFO_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMM_PMM_WORKSHEET_INFO WHERE [OPEN_ID] = @OPEN_ID" 
            SelectCommand="select CRMM_PMM_WORKSHEET_INFO.OPEN_ID
,VIEW_PMM_WORKSHEET_INFO.WORKSHEET_ID
,VIEW_PMM_WORKSHEET_INFO.PROJECT_NAME
,VIEW_PMM_WORKSHEET_INFO.CUST_CODE
,VIEW_PMM_WORKSHEET_INFO.ORGANIZE_NAME_THA
,CRMM_PMM_WORKSHEET_INFO.OPEN_STATUS
 from CRMM_PMM_WORKSHEET_INFO 
left join VIEW_PMM_WORKSHEET_INFO on CRMM_PMM_WORKSHEET_INFO.OPEN_ID = VIEW_PMM_WORKSHEET_INFO.OPEN_ID
where  1=1" >
            <DeleteParameters>
                <asp:Parameter Name="OPEN_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

