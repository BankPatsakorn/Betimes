<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List" %>

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
<input type="button" class='btn btn-primary' value=' Add ' onclick="location='CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_Detail.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List" runat="server" Width="100%" AutoGenerateColumns="False" 
DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List" KeyFieldName="PERIOD_V_DET_ID"  ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PERIOD_V_DET_ID" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List','CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_Detail.aspx?PERIOD_V_DET_ID=<%#Eval("PERIOD_V_DET_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List);"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="สิ่งส่งมอบ " FieldName="PERIOD_DET_DESC" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataSpinEditColumn Caption="จำนวน " FieldName="PERIOD_DET_QUANTITY" VisibleIndex="4">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataSpinEditColumn Caption="หน่วยนับ " FieldName="UNIT_ID" VisibleIndex="5">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataTextColumn Caption="หมายเหตุ " FieldName="PERIOD_DET_REMARK" VisibleIndex="6">
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
<a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET WHERE [PERIOD_V_DET_ID] = @PERIOD_V_DET_ID" 
            SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_DESC
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_QUANTITY
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.UNIT_ID
,CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET.PERIOD_DET_REMARK
 from CRMT_PMM_PROJECT_CONTRACT_V_PERIOD_DET where  1=1 " >
            <DeleteParameters>
                <asp:Parameter Name="PERIOD_V_DET_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

