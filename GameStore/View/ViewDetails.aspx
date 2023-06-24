<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="GameStore.View.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container w-50 d-flex align-items-center justify-content-center fs-4" style="min-height:100vh;">
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
                    <% foreach(var td in details){ %>
                    <tr>
                        <th scope="row"><%= i %></th>
                        <td><a href="GameDetails.aspx?id=<%= td.game_id %>"><%= td.Game.name %></a></td>
                        <td><a href="DevDetails.aspx?id=<%= td.Game.dev_id %>"><%= td.Game.Developer.name %></a></td>
                        <td><%= td.quantity %></td>
                    </tr>
                    <% i++; %>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
