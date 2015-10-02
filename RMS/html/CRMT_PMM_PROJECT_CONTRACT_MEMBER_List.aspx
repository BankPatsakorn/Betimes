<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="CRMT_PMM_PROJECT_CONTRACT_MEMBER_List.aspx.cs" Inherits="CRMT_PMM_PROJECT_CONTRACT_MEMBER_List" %>

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
<input type="button" class='btn btn-primary' value=' Add ' onclick="location='CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.aspx?id=-1';" />
</div>
<div>
<div>


<dx:ASPxGridView ID="viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" runat="server" Width="100%" AutoGenerateColumns="False" 
DataSourceID="dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" KeyFieldName="PROJECT_MEMBER_ID"  ClientInstanceName="viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PROJECT_MEMBER_ID" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" onclick="OpenChildDetail('fancyBoxCRMT_PMM_PROJECT_CONTRACT_MEMBER_List','CRMT_PMM_PROJECT_CONTRACT_MEMBER_Detail.aspx?PROJECT_MEMBER_ID=<%#Eval("PROJECT_MEMBER_ID") %>', viewCRMT_PMM_PROJECT_CONTRACT_MEMBER_List);"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="ชื่อ" FieldName="PROJECT_MEMBER_NAME" VisibleIndex="3">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="สกุล" FieldName="PROJECT_MEMBER_LNAME" VisibleIndex="4">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="สังกัด" FieldName="PROJECT_MEMBER_ORG" VisibleIndex="5">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataTextColumn Caption="เบอร์โทรศัพท์" FieldName="PROJECT_MEMBER_TEL" VisibleIndex="6">
</dx:GridViewDataTextColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่เริ่มปฏิบัติงาน" FieldName="PROJECT_MEMBER_START_DATE" VisibleIndex="7">
</dx:GridViewDataDateColumn>
 
<dx:GridViewDataDateColumn Caption="วันที่สิ้นสุด" FieldName="PROJECT_MEMBER_END_DATE" VisibleIndex="8">
</dx:GridViewDataDateColumn>
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
<a id="fancyBoxCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>

<asp:SqlDataSource ID="dsCRMT_PMM_PROJECT_CONTRACT_MEMBER_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM CRMT_PMM_PROJECT_CONTRACT_MEMBER WHERE [PROJECT_MEMBER_ID] = @PROJECT_MEMBER_ID" 
            SelectCommand="select CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_NAME
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_LNAME
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_ORG
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_TEL
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_START_DATE
,CRMT_PMM_PROJECT_CONTRACT_MEMBER.PROJECT_MEMBER_END_DATE
 from CRMT_PMM_PROJECT_CONTRACT_MEMBER where  1=1 " >
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_MEMBER_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

