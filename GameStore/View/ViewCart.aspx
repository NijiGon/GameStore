<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="GameStore.View.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
                <% foreach(var c in items){ %>
                <% int i = 1; %>
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
        <div>
            <div>
                <asp:Label ID="lbPlatform" runat="server" Text="Choose a platform"></asp:Label>
                <asp:DropDownList ID="ddlPlatform" runat="server"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lbMethod" runat="server" Text="Choose a payment method"></asp:Label>
                <asp:DropDownList ID="ddlMethod" runat="server"></asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
            </div>
        </div>
    </div>
</asp:Content>
