<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_BORAD_List.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_BORAD_List" %>

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
     <div class="form-group col-sm-12" style="margin-top: 20px;">
                    <div class="col-sm-offset-3 col-sm-6">
                        <asp:Button ID="btnSave" runat="server" Text="�ѹ�֡" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="¡��ԡ" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
                    </div>
     </div>
    <div>
<h1></h1>
</div>
<div>
<input type="button" class='btn btn-primary' value=' Add ' onclick="location='CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List" runat="server" Width="100%" AutoGenerateColumns="False" 
DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_BORAD_List" KeyFieldName="BORAD_ID"  ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="BORAD_ID" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_BORAD_List','CRMT_PMM_PROJECT_CONTRACT_BORAD_Detail.aspx?BORAD_ID=<%#Eval("BORAD_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_BORAD_List);"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="รหัสเจ้าหน้าที่" FieldName="PERSONAL_CARD_ID" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataSpinEditColumn Caption="ชื่อ-สกุล" FieldName="PERSONAL_ID" VisibleIndex="4">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataTextColumn Caption="ตำแหน่ง" FieldName="SECTION" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ตำแหน่งในคณะกรรมการ" FieldName="BORAD_POSITION" VisibleIndex="6">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="เบอร์โทรศัพท์" FieldName="TEL" VisibleIndex="7">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="อีเมล" FieldName="EMAIL" VisibleIndex="8">
</dx:GridViewDataTextColumn>
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
<a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_BORAD_List" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_BORAD_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_BORAD WHERE [BORAD_ID] = @BORAD_ID" 
            SelectCommand="select VIEW_COMMON_MASTER_PERSONAL.PERSONAL_CARD_ID
,VIEW_COMMON_MASTER_PERSONAL.PERSONAL_ID
,VIEW_COMMON_MASTER_PERSONAL.SECTION
,CRMT_PMM_PROJECT_CONTRACT_BORAD.BORAD_POSITION
,VIEW_COMMON_MASTER_PERSONAL.TEL
,VIEW_COMMON_MASTER_PERSONAL.EMAIL
 from CRMT_PMM_PROJECT_CONTRACT_BORAD 
left join VIEW_COMMON_MASTER_PERSONAL on  where  1=1 " >
            <DeleteParameters>
                <asp:Parameter Name="BORAD_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

