<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GameStore.Views.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1>Trending Games</h1>
            <div class="d-flex">
                <% foreach(var g in games){ %>
                <div class="d-flex flex-column align-items-center justify-content-center text-center">
                    <img src="../Asset/games/<%= g.image %>" alt="Alternate Text" />
                    <a href="GameDetails.aspx?id=<%= g.Id %>">
                        <h2><%= g.name %></h2>
                    </a>
                </div>
                <%} %>
            </div>
        </div>
        <div>
            <h1>Top Developers</h1>
            <div class="d-flex">
                <% foreach(var d in developers){ %>
                <div class="d-flex flex-column align-items-center justify-content-center text-center">
                    <img src="../Asset/developers/<%= d.image %>" alt="Alternate Text" />
                    <a href="DevDetails.aspx?id=<%= d.Id %>">
                        <h2><%= d.name %></h2>
                    </a>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
