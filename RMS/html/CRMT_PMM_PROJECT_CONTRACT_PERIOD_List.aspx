<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_PERIOD_List.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_PERIOD_List" %>

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
<input type="button" class='btn btn-primary' value=' Add ' onclick="location='CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" runat="server" Width="100%" AutoGenerateColumns="False" 
DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" KeyFieldName="PERIOD_ID"  ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PERIOD_ID" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_List','CRMT_PMM_PROJECT_CONTRACT_PERIOD_Detail.aspx?PERIOD_ID=<%#Eval("PERIOD_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_PERIOD_List);"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataSpinEditColumn Caption="งวดงานที่" FieldName="PERIOD_NO" VisibleIndex="3">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataTextColumn Caption="รายละเอียด" FieldName="PERIOD_DESC" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่ส่งมอบตามสัญญา" FieldName="PERIOD_DateTime" VisibleIndex="5">
</dx:GridViewDataDateColumn>
 
<dx:GridViewDataSpinEditColumn Caption="ค่าจ้าง(บาท)" FieldName="PERIOD_AMOUNT" VisibleIndex="6">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataSpinEditColumn Caption="เปอร์เซ็นต์เงิน" FieldName="PERIOD_PERCENT" VisibleIndex="7">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่เริ่มต้น" FieldName="PERIOD_START_DateTime" VisibleIndex="8">
</dx:GridViewDataDateColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="PERIOD_END_DateTime" VisibleIndex="9">
</dx:GridViewDataDateColumn>
 
<dx:GridViewDataSpinEditColumn Caption="จำนวนวัน" FieldName="PERIOD_DURATION_DateTime" VisibleIndex="10">

</dx:GridViewDataSpinEditColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่ส่งจริง" FieldName="PERIOD_DELIVERY_DateTime" VisibleIndex="11">
</dx:GridViewDataDateColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่ตรวจรับงาน" FieldName="PERIOD_BORAD_DateTime" VisibleIndex="12">
</dx:GridViewDataDateColumn>
 
<dx:GridViewDataSpinEditColumn Caption="สถานะ" FieldName="PERIOD_STATUS" VisibleIndex="13">

</dx:GridViewDataSpinEditColumn>
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
<a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_PERIOD_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_PERIOD WHERE [PERIOD_ID] = @PERIOD_ID" 
            SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_NO
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DESC
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_AMOUNT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_PERCENT
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_START_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_END_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DURATION_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_DELIVERY_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_BORAD_DateTime
,CRMT_PMM_PROJECT_CONTRACT_PERIOD.PERIOD_STATUS
 from CRMT_PMM_PROJECT_CONTRACT_PERIOD where  1=1 " >
            <DeleteParameters>
                <asp:Parameter Name="PERIOD_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

