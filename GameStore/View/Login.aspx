<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GameStore.View.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:Label ID="lbEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lbPass" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="tbPass" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:CheckBox ID="cbAgree" runat="server" Text="Remember Me" />
        </div>
        <div>
            <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </div>
</asp:Content>
