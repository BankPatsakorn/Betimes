<%@ Page Title="" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="COMMON_MASTER_PROVINCE_List.aspx.cs" Inherits="COMMON_MASTER_PROVINCE_List" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function grid_SelectionChanged(s, e) {
            s.GetSelectedFieldValues("PROVINCE_ID", GetSelectedFieldValuesCallback);
            s.GetSelectedFieldValues("PROVINCE_NAME", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
            for (var i = 0; i < values.length; i++) {
                alert(values[i]);
            }
            //selList.BeginUpdate();
            //try {
            //    selList.ClearItems();
            //    for (var i = 0; i < values.length; i++) {
            //        selList.AddItem(values[i]);
            //    }
            //} finally {
            //    selList.EndUpdate();
            //}
            //document.getElementById("selCount").innerHTML = grid.GetSelectedRowCount();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<h1>PROVINCE</h1>
</div>
<div>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="PROVINCE_ID">
            <Columns>
<dx:GridViewCommandColumn SelectAllCheckboxMode="Page" 
    ShowSelectButton ="True"
    ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowSelectCheckbox="True" VisibleIndex="2">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="PROVINCE_ID" ReadOnly="True" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
              
 <dx:GridViewDataTextColumn Caption="PROVINCE CODE" FieldName="PROVINCE_CODE" VisibleIndex="4"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="PROVINCE NAME" FieldName="PROVINCE_NAME" VisibleIndex="5"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="REGION ID" FieldName="REGION_ID" VisibleIndex="6"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="REGION ID" FieldName="REGION_NAME_THA" VisibleIndex="7"></dx:GridViewDataTextColumn>

               <dx:GridViewDataTextColumn VisibleIndex="1" Caption="">
                <DataItemTemplate>
                    <a target="_blank" class="glyphicon glyphicon-edit" href="Default2.aspx?id=<%# Container.KeyValue%>"></a>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>

               
</Columns>
     <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm"  />
        <SettingsPopup>
            <EditForm Width="700" />
        </SettingsPopup>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsDataSecurity AllowEdit="False" />
    <ClientSideEvents SelectionChanged="grid_SelectionChanged" />

        </dx:ASPxGridView>
</div>
<div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM COMMON_MASTER_PROVINCE WHERE [PROVINCE_ID] = @PROVINCE_ID" 
            SelectCommand="select COMMON_MASTER_PROVINCE.PROVINCE_ID,COMMON_MASTER_REGION.REGION_ID,COMMON_MASTER_PROVINCE.PROVINCE_CODE,COMMON_MASTER_PROVINCE.PROVINCE_NAME,
    COMMON_MASTER_PROVINCE.UPDATE_DATE,COMMON_MASTER_REGION.REGION_NAME_THA 
    from COMMON_MASTER_PROVINCE 
    left join COMMON_MASTER_REGION on COMMON_MASTER_PROVINCE.REGION_ID = COMMON_MASTER_REGION.REGION_ID  where  1=1 and COMMON_MASTER_PROVINCE.REGION_ID=@REGION_ID " >
            <DeleteParameters>
                <asp:Parameter Name="PROVINCE_ID" Type="Int32" />
            </DeleteParameters>
            
             </asp:SqlDataSource>
</div>
</asp:Content>

