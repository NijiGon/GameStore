<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GameStore.View.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="fs-4" style="width: 40%">
            <div class="d-flex py-1 justify-content-between">
                <div class="d-flex flex-column py-1" style="width:45%">
                    <asp:Label ID="lbFirst" runat="server" Text="First Name"></asp:Label>
                    <asp:TextBox ID="tbFirst" runat="server" placeholder="John" CssClass="p-2 border-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
                </div>
                <div class="d-flex flex-column py-1" style="width:45%">
                    <asp:Label ID="lbLast" runat="server" Text="Last Name"></asp:Label>
                    <asp:TextBox ID="tbLast" runat="server" placeholder="Smith" CssClass="p-2 border-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
                </div>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Label ID="lbEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="tbEmail" runat="server" placeholder="johnsmith10@exmaple.com" CssClass="p-2 border-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Label ID="lbPass" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="tbPass" runat="server" type="password" placeholder="********" CssClass="p-2 border-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Label ID="lbUname" runat="server" Text="Username"></asp:Label>
                <asp:TextBox ID="tbUname" runat="server" type="" placeholder="johnsmith10" CssClass="p-2 border-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Label ID="lbDOB" runat="server" Text="Date of Birth"></asp:Label>
                <asp:TextBox ID="tbDOB" runat="server" placeholder="yyyy/mm/dd" CssClass="p-2 rounded-3 border-2 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="text-center text-danger my-3 fw-bold">
                <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
            </div>
            <div class="text-center fs-6">
                <p>Already have an account? <b><a href="Login.aspx">Login Here</a></b></p>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Button ID="btnRegis" runat="server" Text="Register" CssClass="rounded-3 border-0 w-25 m-auto py-2 bg-body-tertiary" OnClick="btnRegis_Click" />
            </div>
        </div>
    </div>
</asp:Content>
