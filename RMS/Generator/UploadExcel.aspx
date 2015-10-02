<%@ Page Title="" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="UploadExcel.aspx.cs" Inherits="Generator_UploadExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
       <h2>Upload Excel</h2> 
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <div id="xml_div" runat="server">

    </div>
</asp:Content>

