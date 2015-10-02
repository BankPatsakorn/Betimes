<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list1.aspx.cs" Inherits="Test_list1" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inline</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ORGANIZE_ID">
            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_ID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="รหัสพื้นที่" FieldName="ORGANIZE_ARIA_CODE" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อไทย" FieldName="ORGANIZE_NAME_THA" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่ออังกฤษ" FieldName="ORGANIZE_NAME_ENG" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_ABBR_THA" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_ABBR_ENG" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_TELEPHONE" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_FAX" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_CONTACT" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ORGANIZE_EMAIL" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COMMON_DATA2ConnectionString %>" 
            DeleteCommand="DELETE FROM [COMMON_MASTER_ORGANIZE] WHERE [ORGANIZE_ID] = @ORGANIZE_ID" 
            InsertCommand="INSERT INTO [COMMON_MASTER_ORGANIZE] ([ORGANIZE_CODE_LEV1], [ORGANIZE_CODE_LEV2], [ORGANIZE_CODE_LEV3], [ORGANIZE_CODE_LEV4], [ORGANIZE_CODE_LEV5], [ORGANIZE_ROOT_ID], [ORGANIZE_ARIA_CODE], [ORGANIZE_NAME_THA], [ORGANIZE_NAME_ENG], [ORGANIZE_ABBR_THA], [ORGANIZE_ABBR_ENG], [ORGANIZE_TELEPHONE], [ORGANIZE_FAX], [ORGANIZE_CONTACT], [ORGANIZE_EMAIL], [ORGANIZE_ADDRESS_NO], [ORGANIZE_ADDRESS_MOO], [ORGANIZE_ADDRESS_BUILDING], [ORGANIZE_ADDRESS_SOI], [ORGANIZE_ADDRESS_STREET], [ORGANIZE_ADDRESS_PROVINCE], [ORGANIZE_ADDRESS_DISRICT], [ORGANIZE_ADDRESS_SUB_DISTRICT], [ORGANIZE_ADDRESS_POSTCODE], [ORGANIZE_IMAGE_PATH], [ORGANIZE_LOGO_PATH], [ORGANIZE_URL_INTERNET], [ORGANIZE_URL_INTRANET], [ORGANIZE_URL_DM], [_ORGANIZE_FORMAL_FLAG], [ORGANIZE_FORMAL_FLAG], [CREATE_USER], [UPDATE_USER], [CREATE_DATE], [UPDATE_DATE], [DEL_FLAG], [OptimisticLockField], [ORGANIZE_URL_DM2], [ORGANIZE_TYPE_ID], [GOVERNMENT_ID], [GOVERNMENT_TYPE_ID]) VALUES (@ORGANIZE_CODE_LEV1, @ORGANIZE_CODE_LEV2, @ORGANIZE_CODE_LEV3, @ORGANIZE_CODE_LEV4, @ORGANIZE_CODE_LEV5, @ORGANIZE_ROOT_ID, @ORGANIZE_ARIA_CODE, @ORGANIZE_NAME_THA, @ORGANIZE_NAME_ENG, @ORGANIZE_ABBR_THA, @ORGANIZE_ABBR_ENG, @ORGANIZE_TELEPHONE, @ORGANIZE_FAX, @ORGANIZE_CONTACT, @ORGANIZE_EMAIL, @ORGANIZE_ADDRESS_NO, @ORGANIZE_ADDRESS_MOO, @ORGANIZE_ADDRESS_BUILDING, @ORGANIZE_ADDRESS_SOI, @ORGANIZE_ADDRESS_STREET, @ORGANIZE_ADDRESS_PROVINCE, @ORGANIZE_ADDRESS_DISRICT, @ORGANIZE_ADDRESS_SUB_DISTRICT, @ORGANIZE_ADDRESS_POSTCODE, @ORGANIZE_IMAGE_PATH, @ORGANIZE_LOGO_PATH, @ORGANIZE_URL_INTERNET, @ORGANIZE_URL_INTRANET, @ORGANIZE_URL_DM, @column1, @ORGANIZE_FORMAL_FLAG, @CREATE_USER, @UPDATE_USER, @CREATE_DATE, @UPDATE_DATE, @DEL_FLAG, @OptimisticLockField, @ORGANIZE_URL_DM2, @ORGANIZE_TYPE_ID, @GOVERNMENT_ID, @GOVERNMENT_TYPE_ID)" 
            SelectCommand="SELECT * FROM [COMMON_MASTER_ORGANIZE]" 
            UpdateCommand="UPDATE [COMMON_MASTER_ORGANIZE] SET [ORGANIZE_CODE_LEV1] = @ORGANIZE_CODE_LEV1, [ORGANIZE_CODE_LEV2] = @ORGANIZE_CODE_LEV2, [ORGANIZE_CODE_LEV3] = @ORGANIZE_CODE_LEV3, [ORGANIZE_CODE_LEV4] = @ORGANIZE_CODE_LEV4, [ORGANIZE_CODE_LEV5] = @ORGANIZE_CODE_LEV5, [ORGANIZE_ROOT_ID] = @ORGANIZE_ROOT_ID, [ORGANIZE_ARIA_CODE] = @ORGANIZE_ARIA_CODE, [ORGANIZE_NAME_THA] = @ORGANIZE_NAME_THA, [ORGANIZE_NAME_ENG] = @ORGANIZE_NAME_ENG, [ORGANIZE_ABBR_THA] = @ORGANIZE_ABBR_THA, [ORGANIZE_ABBR_ENG] = @ORGANIZE_ABBR_ENG, [ORGANIZE_TELEPHONE] = @ORGANIZE_TELEPHONE, [ORGANIZE_FAX] = @ORGANIZE_FAX, [ORGANIZE_CONTACT] = @ORGANIZE_CONTACT, [ORGANIZE_EMAIL] = @ORGANIZE_EMAIL, [ORGANIZE_ADDRESS_NO] = @ORGANIZE_ADDRESS_NO, [ORGANIZE_ADDRESS_MOO] = @ORGANIZE_ADDRESS_MOO, [ORGANIZE_ADDRESS_BUILDING] = @ORGANIZE_ADDRESS_BUILDING, [ORGANIZE_ADDRESS_SOI] = @ORGANIZE_ADDRESS_SOI, [ORGANIZE_ADDRESS_STREET] = @ORGANIZE_ADDRESS_STREET, [ORGANIZE_ADDRESS_PROVINCE] = @ORGANIZE_ADDRESS_PROVINCE, [ORGANIZE_ADDRESS_DISRICT] = @ORGANIZE_ADDRESS_DISRICT, [ORGANIZE_ADDRESS_SUB_DISTRICT] = @ORGANIZE_ADDRESS_SUB_DISTRICT, [ORGANIZE_ADDRESS_POSTCODE] = @ORGANIZE_ADDRESS_POSTCODE, [ORGANIZE_IMAGE_PATH] = @ORGANIZE_IMAGE_PATH, [ORGANIZE_LOGO_PATH] = @ORGANIZE_LOGO_PATH, [ORGANIZE_URL_INTERNET] = @ORGANIZE_URL_INTERNET, [ORGANIZE_URL_INTRANET] = @ORGANIZE_URL_INTRANET, [ORGANIZE_URL_DM] = @ORGANIZE_URL_DM, [_ORGANIZE_FORMAL_FLAG] = @column1, [ORGANIZE_FORMAL_FLAG] = @ORGANIZE_FORMAL_FLAG, [CREATE_USER] = @CREATE_USER, [UPDATE_USER] = @UPDATE_USER, [CREATE_DATE] = @CREATE_DATE, [UPDATE_DATE] = @UPDATE_DATE, [DEL_FLAG] = @DEL_FLAG, [OptimisticLockField] = @OptimisticLockField, [ORGANIZE_URL_DM2] = @ORGANIZE_URL_DM2, [ORGANIZE_TYPE_ID] = @ORGANIZE_TYPE_ID, [GOVERNMENT_ID] = @GOVERNMENT_ID, [GOVERNMENT_TYPE_ID] = @GOVERNMENT_TYPE_ID WHERE [ORGANIZE_ID] = @ORGANIZE_ID">
            <DeleteParameters>
                <asp:Parameter Name="ORGANIZE_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ORGANIZE_CODE_LEV1" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV2" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV3" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV4" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV5" Type="String" />
                <asp:Parameter Name="ORGANIZE_ROOT_ID" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ARIA_CODE" Type="String" />
                <asp:Parameter Name="ORGANIZE_NAME_THA" Type="String" />
                <asp:Parameter Name="ORGANIZE_NAME_ENG" Type="String" />
                <asp:Parameter Name="ORGANIZE_ABBR_THA" Type="String" />
                <asp:Parameter Name="ORGANIZE_ABBR_ENG" Type="String" />
                <asp:Parameter Name="ORGANIZE_TELEPHONE" Type="String" />
                <asp:Parameter Name="ORGANIZE_FAX" Type="String" />
                <asp:Parameter Name="ORGANIZE_CONTACT" Type="String" />
                <asp:Parameter Name="ORGANIZE_EMAIL" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_NO" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_MOO" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_BUILDING" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_SOI" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_STREET" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_PROVINCE" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_DISRICT" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_SUB_DISTRICT" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_POSTCODE" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_IMAGE_PATH" Type="String" />
                <asp:Parameter Name="ORGANIZE_LOGO_PATH" Type="String" />
                <asp:Parameter Name="ORGANIZE_URL_INTERNET" Type="String" />
                <asp:Parameter Name="ORGANIZE_URL_INTRANET" Type="String" />
                <asp:Parameter Name="ORGANIZE_URL_DM" Type="String" />
                <asp:Parameter Name="column1" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_FORMAL_FLAG" Type="String" />
                <asp:Parameter Name="CREATE_USER" Type="String" />
                <asp:Parameter Name="UPDATE_USER" Type="String" />
                <asp:Parameter Name="CREATE_DATE" Type="DateTime" />
                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                <asp:Parameter Name="DEL_FLAG" Type="String" />
                <asp:Parameter Name="OptimisticLockField" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_URL_DM2" Type="Object" />
                <asp:Parameter Name="ORGANIZE_TYPE_ID" Type="Int32" />
                <asp:Parameter Name="GOVERNMENT_ID" Type="Int32" />
                <asp:Parameter Name="GOVERNMENT_TYPE_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ORGANIZE_CODE_LEV1" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV2" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV3" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV4" Type="String" />
                <asp:Parameter Name="ORGANIZE_CODE_LEV5" Type="String" />
                <asp:Parameter Name="ORGANIZE_ROOT_ID" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ARIA_CODE" Type="String" />
                <asp:Parameter Name="ORGANIZE_NAME_THA" Type="String" />
                <asp:Parameter Name="ORGANIZE_NAME_ENG" Type="String" />
                <asp:Parameter Name="ORGANIZE_ABBR_THA" Type="String" />
                <asp:Parameter Name="ORGANIZE_ABBR_ENG" Type="String" />
                <asp:Parameter Name="ORGANIZE_TELEPHONE" Type="String" />
                <asp:Parameter Name="ORGANIZE_FAX" Type="String" />
                <asp:Parameter Name="ORGANIZE_CONTACT" Type="String" />
                <asp:Parameter Name="ORGANIZE_EMAIL" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_NO" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_MOO" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_BUILDING" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_SOI" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_STREET" Type="String" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_PROVINCE" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_DISRICT" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_SUB_DISTRICT" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ADDRESS_POSTCODE" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_IMAGE_PATH" Type="String" />
                <asp:Parameter Name="ORGANIZE_LOGO_PATH" Type="String" />
                <asp:Parameter Name="ORGANIZE_URL_INTERNET" Type="String" />
                <asp:Parameter Name="ORGANIZE_URL_INTRANET" Type="String" />
                <asp:Parameter Name="ORGANIZE_URL_DM" Type="String" />
                <asp:Parameter Name="column1" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_FORMAL_FLAG" Type="String" />
                <asp:Parameter Name="CREATE_USER" Type="String" />
                <asp:Parameter Name="UPDATE_USER" Type="String" />
                <asp:Parameter Name="CREATE_DATE" Type="DateTime" />
                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                <asp:Parameter Name="DEL_FLAG" Type="String" />
                <asp:Parameter Name="OptimisticLockField" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_URL_DM2" Type="Object" />
                <asp:Parameter Name="ORGANIZE_TYPE_ID" Type="Int32" />
                <asp:Parameter Name="GOVERNMENT_ID" Type="Int32" />
                <asp:Parameter Name="GOVERNMENT_TYPE_ID" Type="Int32" />
                <asp:Parameter Name="ORGANIZE_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
