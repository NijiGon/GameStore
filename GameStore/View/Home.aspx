<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GameStore.Views.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column p-3">
        <div class="d-flex">
            <h1>Trending Games</h1>
            <div class="d-flex">
                <% foreach(var g in games){ %>
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%= g.name %></h5>
                        <p class="card-text">Rp.<%= g.price.ToString("#,##0") %></p>
                        <a href="GameDetails.aspx?id=<%= g.Id %>" class="btn btn-primary">View Details</a>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
        <div>
            <h1>Top Developers</h1>
            <div class="d-flex">
                <% foreach(var d in developers){ %>
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%= d.name %></h5>
                        <a href="GameDetails.aspx?id=<%= d.Id %>" class="btn btn-primary">View Details</a>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
