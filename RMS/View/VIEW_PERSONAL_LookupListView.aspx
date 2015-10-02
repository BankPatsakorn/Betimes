<%@ Page Title="" UICulture="th" Culture="th-TH" Language="C#" MasterPageFile="~/Master/blank.master" AutoEventWireup="true" CodeFile="VIEW_PERSONAL_LookupListView.aspx.cs" Inherits="VIEW_PERSONAL_LookupListView" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function grid_SelectionChanged(s, e) {
            s.GetSelectedFieldValues("OFFICER_ID;NAME", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
            parent.SetLku(values[0][0], values[0][1]);
            parent.jQuery.fancybox.close();
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="form-group">
         <div class="col-xs-4"><h1>ข้อมูลบุคลากร</h1></div>
        <div class="col-xs-8 text-right">
            <input type="button" class='btn btn-primary' value='บุคคลภายนอก' onclick="location = '#';" />
        </div>
    </div>
    <div>

        
        
    </div>
    <div>
        
    </div>
    <div>
        <div>

            <dx:ASPxGridView ID="viewVIEW_PERSONAL_LookupListView" runat="server" Width="100%"
                Styles-AlternatingRow-BackColor="White" Styles-Row-BackColor="#D9EDF7"
                AutoGenerateColumns="False" ClientInstanceName="viewVIEW_PERSONAL_LookupListView"
                DataSourceID="dsVIEW_PERSONAL_LookupListView" KeyFieldName="OFFICER_ID" Theme="Metropolis">
                <Columns>

                    <dx:GridViewCommandColumn
                        ShowSelectButton="True"
                        SelectAllCheckboxMode="Page" ShowClearFilterButton="True"
                        ShowDeleteButton="False" ShowSelectCheckbox="False" ButtonType="Image" VisibleIndex="30">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="OFFICER_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="คำนำหน้า" FieldName="PREFIX_DESC" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ชื่อ-นามสกุล" FieldName="NAME" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ตำแหน่งในสายงาน" FieldName="OFFICER_OPSITION_NAME" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="สำนัก/กอง" FieldName="ORG" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="กลุ่ม/ส่วน/ฝ่าย" FieldName="SECTION_NAME" VisibleIndex="7"></dx:GridViewDataTextColumn>
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
        <asp:SqlDataSource ID="dsVIEW_PERSONAL_LookupListView" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            DeleteCommand="DELETE FROM VIEW_PERSONAL WHERE [] = @"
            SelectCommand="SELECT[PREFIX_ID],[OFFICER_ID]
      ,[PREFIX_DESC]
      ,[OFFICER_ID]
      ,[NAME]
      ,[OFFICER_OPSITION_NAME]
      ,[UNIT_ID]
      ,[ORG]
      ,[SECTION_ID]
      ,[SECTION_NAME]
  FROM [OPM_COMMON_DATA].[dbo].[VIEW_PERSONAL]">
            <DeleteParameters>
                <asp:Parameter Name="" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

