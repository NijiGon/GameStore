<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="GameStore.View.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container w-50 d-flex align-items-center justify-content-center fs-4" style="min-height:100vh">
        <div class="d-flex flex-column justify-content-center align-content-center">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Game</th>
                        <th scope="col">Developer</th>
                        <th scope="col">Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i = 1; %>
                    <% foreach(var c in items){ %>
                    <tr>
                        <th scope="row"><%= i %></th>
                        <td><%= c.Game.name %></td>
                        <td><%= c.Game.Developer.name %></td>
                        <td><%= c.quantity %></td>
                    </tr>
                    <% i++; %>
                    <%} %>
                </tbody>
            </table>
            <% if (items.Count > 0)
                { %>
            <div class="d-flex flex-column align-items-end">
                <asp:Button runat="server" ID="btnRemove" CssClass="rounded-3 border-0 fs-5 ms-auto py-1 bg-danger" Text="Empty" OnClick="btnRemove_Click"/>
            </div>
            <%} %>
            <div class="d-flex justify-content-between">
                <% if (items != null) { %>
                <div class="d-flex flex-column mt-3 me-3 fs-5">
                    <asp:Label ID="lbPlatform" runat="server" Text="Choose a platform"></asp:Label>
                    <asp:DropDownList ID="ddlPlatform" CssClass="rounded-2 bg-dark text-white" runat="server" OnSelectedIndexChanged="ddlPlatform_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="d-flex flex-column mt-3 me-3 fs-5">
                    <asp:Label ID="lbMethod" runat="server" Text="Choose a payment method"></asp:Label>
                    <asp:DropDownList ID="ddlMethod" CssClass="rounded-2 bg-dark text-white" runat="server" OnSelectedIndexChanged="ddlMethod_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="d-flex justify-content-end mt-4 fs-5">
                    <div class="ms-auto d-flex flex-column">
                        <asp:Button ID="btnCheckout" runat="server" CssClass="rounded-3 border-0 m-auto py-2 px-3 bg-body-tertiary" Text="Checkout" OnClick="btnCheckout_Click" />
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
