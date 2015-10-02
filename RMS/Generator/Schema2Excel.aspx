<%@ Page Title="" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="Schema2Excel.aspx.cs" Inherits="Generator_UploadExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="../Assets/styles/bootstrap.min.css" rel="stylesheet" />
     <style type="text/css">
        .container {
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /> <br /> <br />
    <div class="form-group">
            <label for="ddlDatabase" class="col-sm-2 control-label">Database:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlDatabase" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <%-- <div class="form-group">
            <label for="ddlDatabase" class="col-sm-2 control-label">Table:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlTable" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>--%>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <asp:Button ID="btnExport" runat="server" Text="Export Schema" OnClick="btnExport_Click" CssClass="btn btn-primary" style="visibility: hidden;" />
                <asp:Button ID="btnExportUI" runat="server" Text="Export UI" OnClick="btnExportUI_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnExportEntity" runat="server" Text="Export Entity" OnClick="btnExportEntity_Click" CssClass="btn btn-primary" />
            </div>
        </div>
</asp:Content>