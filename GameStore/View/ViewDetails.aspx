<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="GameStore.View.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Transaction ID</th>
                    <th scope="col">Game</th>
                    <th scope="col">Developer</th>
                    <th scope="col">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <% foreach(var td in details){ %>
                <% int i = 1; %>
                <tr>
                    <th scope="row"><%= i %></th>
                    <td><%= td.transaction_id %></td>
                    <td><%= td.Game.name %></td>
                    <td><%= td.Game.Developer.name %></td>
                    <td><%= td.quantity %></td>
                </tr>
                <% i++; %>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
