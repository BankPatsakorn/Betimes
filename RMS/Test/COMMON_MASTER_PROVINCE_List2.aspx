<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="COMMON_MASTER_PROVINCE_List2.aspx.cs" Inherits="COMMON_MASTER_PROVINCE_List2" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('.fancyBox').fancybox({
                'type': 'iframe',
                'width': 900,
                'height': 500,
                onClosed: function () {
                    location.reload();
                }
            });
        });
        function ClientValidation() {
            return ASPxClientEdit.ValidateGroup("");
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
                        <asp:Button ID="btnSave" runat="server" Text="บันทึก" CssClass="btn btn-success btn-80" OnClientClick="return ClientValidation();" OnClick="btnSave_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="ยกเลิก" CssClass="btn btn-warning btn-80" OnClick="btnBack_Click" />
                    </div>
     </div>
    <div>
<h1>PROVINCE</h1>
</div>
<div>
<input type="button" class='btn btn-primary' value=' Add ' onclick="location='COMMON_MASTER_PROVINCE_Detail.aspx?id=-1';" />
</div>
<div>
<div>
<dx:ASPxGridView ID="viewCOMMON_MASTER_PROVINCE_List2" runat="server" Width="100%" AutoGenerateColumns="False" ClientInstanceName="kkkkk"
DataSourceID="dsCOMMON_MASTER_PROVINCE_List2" KeyFieldName="PROVINCE_ID"  Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="True" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PROVINCE_ID" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_self" class="glyphicon glyphicon-edit" href="COMMON_MASTER_PROVINCE_Detail.aspx?PROVINCE_ID=<%#Eval("PROVINCE_ID") %>"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="PROVINCE CODE" FieldName="PROVINCE_CODE" VisibleIndex="3"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="PROVINCE NAME" FieldName="PROVINCE_NAME" VisibleIndex="4"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="REGION ID" FieldName="REGION_ID" VisibleIndex="5"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="REGION ID" FieldName="REGION_NAME_THA" VisibleIndex="6"></dx:GridViewDataTextColumn>
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
<a id="fancyBoxCOMMON_MASTER_PROVINCE_List2" class='fancyBox'  style="display:none"></a>

</div>
</div>
<div>
<asp:SqlDataSource ID="dsCOMMON_MASTER_PROVINCE_List2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM COMMON_MASTER_PROVINCE WHERE [PROVINCE_ID] = @PROVINCE_ID" 
            SelectCommand="select COMMON_MASTER_PROVINCE.PROVINCE_ID,COMMON_MASTER_REGION.REGION_ID,COMMON_MASTER_PROVINCE.PROVINCE_CODE,COMMON_MASTER_PROVINCE.PROVINCE_NAME,COMMON_MASTER_PROVINCE.UPDATE_DATE,COMMON_MASTER_PROVINCE.OptimisticLockField,COMMON_MASTER_REGION.REGION_NAME_THA from COMMON_MASTER_PROVINCE left join COMMON_MASTER_REGION on COMMON_MASTER_PROVINCE.REGION_ID = COMMON_MASTER_REGION.REGION_ID  where  1=1 " >
            <DeleteParameters>
                <asp:Parameter Name="PROVINCE_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

