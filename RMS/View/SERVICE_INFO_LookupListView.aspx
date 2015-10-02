<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/blank.master" AutoEventWireup="true" CodeFile="SERVICE_INFO_LookupListView.aspx.cs" Inherits="SERVICE_INFO_LookupListView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script type="text/javascript">
        function grid_SelectionChanged(s, e) {
            s.GetSelectedFieldValues("SERVICE_ID;SERVICE_NAME", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
			parent.SetLku(values[0][0], values[0][1]);
			parent.jQuery.fancybox.close();
        }

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<h1>ข้อมูลบริการการประชุม</h1>
</div>
<div>

</div>
<div>
<div>

<dx:ASPxGridView ID="viewSERVICE_INFO_LookupListView" runat="server" Width="100%" 
 Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
AutoGenerateColumns="False" ClientInstanceName="viewSERVICE_INFO_LookupListView"
DataSourceID="dsSERVICE_INFO_LookupListView" KeyFieldName="SERVICE_ID"  Theme="Metropolis">
            <Columns>

            <dx:GridViewCommandColumn
ShowSelectButton ="True"
SelectAllCheckboxMode="Page" ShowClearFilterButton="True" 
ShowDeleteButton="False" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="30">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="SERVICE_ID" ReadOnly="True"  Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="รหัสบริการ" FieldName="SERVICE_CODE" VisibleIndex="3"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="บริการ" FieldName="SERVICE_NAME" VisibleIndex="4"></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn Caption="หน่วย" FieldName="COUNT_UNIT_NAME" VisibleIndex="5"></dx:GridViewDataTextColumn>
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
<asp:SqlDataSource ID="dsSERVICE_INFO_LookupListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM RMSM_MDM_SERVICE_INFO WHERE [SERVICE_ID] = @SERVICE_ID" 
            SelectCommand="
SELECT [RMSM_MDM_SERVICE_INFO].[SERVICE_ID]
      ,RMSM_MDM_SERVICE_INFO.[SERVICE_CODE]
      ,RMSM_MDM_SERVICE_INFO.[SERVICE_NAME]
   ,[OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_NAME
  FROM [dbo].[RMSM_MDM_SERVICE_INFO]
  LEFT JOIN [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO] on
  [dbo].[RMSM_MDM_SERVICE_INFO].COUNT_UNIT_ID = [OPM_COMMON_DATA].[dbo].[COMM_MDM_COUNT_UNIT_INFO].COUNT_UNIT_ID
  WHERE [dbo].[RMSM_MDM_SERVICE_INFO].RECORD_STATUS = 'A'" >
            <DeleteParameters>
                <asp:Parameter Name="SERVICE_ID" Type="Int32" />
            </DeleteParameters>
<SelectParameters>

</SelectParameters>
             </asp:SqlDataSource>
</div>
</asp:Content>

