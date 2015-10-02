<%@ Page Title="" Language="C#" MasterPageFile="~/Master/bs.master" AutoEventWireup="true" CodeFile="ShowCodeView.aspx.cs" Inherits="Generator_ShowCodeView" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="errLbl" runat="server"></asp:Label>
    <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>
</asp:Content>

