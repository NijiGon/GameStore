<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="GameStore.View.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        th,tr{
            background-color: #212529 !important;
            color: white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container w-50 fs-4" style="margin-top: 15vh; min-height:60vh">
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
                    <td><%= c.Game.Developer1.name %></td>
                    <td><%= c.quantity %></td>
                </tr>
                <% i++; %>
                <%} %>
            </tbody>
        </table>
        <div class="d-flex justify-content-between">
            <% if (items != null) { %>
            <div class="d-flex flex-column mt-3">
                <asp:Label ID="lbPlatform" runat="server" Text="Choose a platform"></asp:Label>
                <asp:DropDownList ID="ddlPlatform" CssClass="rounded-2 bg-dark text-white" runat="server"></asp:DropDownList>
            </div>
            <div class="d-flex flex-column mt-3">
                <asp:Label ID="lbMethod" runat="server" Text="Choose a payment method"></asp:Label>
                <asp:DropDownList ID="ddlMethod" CssClass="rounded-2 bg-dark text-white" runat="server"></asp:DropDownList>
            </div>
            <div class="d-flex justify-content-end mt-2">
                <div class="ms-auto d-flex flex-column">
                    <asp:Label ID="Label1" runat="server" Text="Confirm Transaction"></asp:Label>
                    <asp:Button ID="btnCheckout" runat="server" CssClass="rounded-3 border-0 m-auto py-2 px-3 bg-body-tertiary" Text="Checkout" OnClick="btnCheckout_Click" />
                </div>
            </div>
            <%} %>
        </div>
    </div>
</asp:Content>
