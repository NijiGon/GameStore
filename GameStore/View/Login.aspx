<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GameStore.View.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="w-50 fs-4">
            <div class="d-flex flex-column py-1">
                <asp:Label ID="lbEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="tbEmail" runat="server" CssClass="p-2 rounded-3"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Label ID="lbPass" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="tbPass" runat="server" CssClass="p-2 rounded-3"></asp:TextBox>
            </div>
            <div class="d-flex justify-content-center py-1">
                <asp:CheckBox ID="cbAgree" runat="server" class="me-2 rounded-3" />
                <asp:Label Text="Remember Me" ID="lbAgree" runat="server" />
            </div>
            <div class="py-1">
                <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
            </div>
            <div class="text-center fs-6">
                <p>Dont have an account? <b><a href="Register.aspx">Register Here</a></b></p>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="rounded-3 border-0 w-25 m-auto py-2 bg-body-tertiary" OnClick="btnLogin_Click" />
            </div>
        </div>
        
    </div>
</asp:Content>
