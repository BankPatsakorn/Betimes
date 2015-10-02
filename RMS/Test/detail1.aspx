<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail1.aspx.cs" Inherits="Test_detail1" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:DetailsView runat="server" BorderStyle="None" CellPadding="-1" CellSpacing="-1"
        DataSourceID="SqlDataSource1" ID="ProvinceForm"
        GridLines="None" AllowPaging="False" AutoGenerateRows="False" DataKeyNames="PROVINCE_ID"
        OnDataBound="OnDataBound" CssClass="detailsView">
        <Fields>
        <asp:TemplateField SortExpression="Name" HeaderText="Name:">
                <EditItemTemplate>
                <dx:ASPxTextBox ID="tbName" runat="server" Width="200px" Value='<%# Bind("PROVINCE_NAME") %>'
                        MaxLength="128">
                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" ErrorText="Name is required." />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("PROVINCE_NAME") %>
                </ItemTemplate>
            </asp:TemplateField>
                    <asp:TemplateField SortExpression="Name" HeaderText="Name:">
                <EditItemTemplate>
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="200px" Value='<%# Bind("PROVINCE_CODE") %>'
                        MaxLength="128">
                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" ErrorText="Name is required." />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("PROVINCE_CODE") %>
                </ItemTemplate>
            </asp:TemplateField>
            </Fields>
    </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 

            SelectCommand="select COMMON_MASTER_PROVINCE.PROVINCE_ID,COMMON_MASTER_PROVINCE.PROVINCE_CODE,
            COMMON_MASTER_PROVINCE.PROVINCE_NAME,COMMON_MASTER_PROVINCE.UPDATE_DATE from COMMON_MASTER_PROVINCE 
            where  1=1 and COMMON_MASTER_PROVINCE.PROVINCE_ID=@PROVINCE_ID " >

            
             </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
