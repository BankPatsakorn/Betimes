<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/blank.master" AutoEventWireup="true" CodeFile="RMSM_RMM_MEETING_AGENDA_LookupListView.aspx.cs" Inherits="RMSM_RMM_MEETING_AGENDA_LookupListView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
        function grid_SelectionChanged(s, e) {
            s.GetSelectedFieldValues("AGENDA_SUB_ID;AGENDA_SUB_TOPIC", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
			parent.SetLku(values[0][0], values[0][1]);
			parent.jQuery.fancybox.close();
        }

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<h1>ระเบียบวาระ</h1>
</div>
<div>

</div>
<div>
<div>

<dx:ASPxGridView ID="viewRMSM_RMM_MEETING_AGENDA_LookupListView" runat="server" Width="100%" 
 Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
AutoGenerateColumns="False" ClientInstanceName="viewRMSM_RMM_MEETING_AGENDA_LookupListView"
DataSourceID="dsRMSM_RMM_MEETING_AGENDA_LookupListView" KeyFieldName="AGENDA_SUB_ID"  Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn
ShowSelectButton ="True"
SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="False" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="30">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AGENDA_SUB_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="ระเบียบวาระที่" FieldName="AGENDA_SUB_SEQ" VisibleIndex="3"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="เรื่อง" FieldName="AGENDA_SUB_TOPIC" VisibleIndex="4"></dx:GridViewDataTextColumn>
</Columns>
            <Settings ShowFilterRow="True" ShowGroupPanel="False" />
            <SettingsBehavior ConfirmDelete="true" AllowSelectSingleRowOnly="true" /> 
        <SettingsCommandButton>
            <SelectButton>
                <Image ToolTip="เลือก" Url="Images/select.png" />
            </SelectButton>
        </SettingsCommandButton>

    <ClientSideEvents SelectionChanged="grid_SelectionChanged" />
        </dx:ASPxGridView>

</div>
</div>
<div>
<asp:SqlDataSource ID="dsRMSM_RMM_MEETING_AGENDA_LookupListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_RMM_MEETING_AGENDA_SUB WHERE [AGENDA_SUB_ID] = @AGENDA_SUB_ID" 
            SelectCommand="SELECT RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_ID ,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_SEQ
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_TOPIC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_DESC
,RMSM_RMM_MEETING_AGENDA_SUB.AGENDA_SUB_BOARD
FROM [dbo].[RMSM_RMM_MEETING_AGENDA_SUB]
WHERE RMSM_RMM_MEETING_AGENDA_SUB.RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="AGENDA_SUB_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

