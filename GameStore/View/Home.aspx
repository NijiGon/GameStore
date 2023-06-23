<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GameStore.Views.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column px-2 py-1 mb-5" style="margin-top:10vh;">
        <div class="">
            <h1>Top Rated Games</h1>
            <div class="row border-top border-white border-2 pt-3">
                <% int i = 0; %>
                <% foreach(var g in games){ %>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="card my-3 text-white shadow hover-effect" style="width: 18rem; background-color: #2e2e2e">
                        <img src="../Asset/games/<%= g.image %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title"><%= g.name %></h5>
                                <div class="d-flex" style="min-width: 3rem">
                                    <i class="bi bi-star-fill"> <%= ratings[g.Id].ToString("0.0") %></i>
                                </div>
                            </div>
                            <p class="card-text">Rp.<%= g.price.ToString("#,##0") %></p>
                            <a href="GameDetails.aspx?id=<%= g.Id %>" class="btn btn-light">View Details</a>
                        </div>
                    </div>
                </div>
                <% i++; %>
                <% if (i >= 8) break; %>
                <%} %>
            </div>
        </div>

        <div class="">
            <h1>Top Developers</h1>
            <div class="row border-top border-white border-2 pt-3">
                <% int j = 0; %>
                <% foreach(var d in developers){ %>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="card my-3 text-white shadow hover-effect" style="width: 18rem; background-color: #2e2e2e">
                        <img src="../Asset/developers/<%= d.image %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= d.name %></h5>
                            <a href="DevDetails.aspx?id=<%= d.Id %>" class="btn btn-light">View Details</a>
                        </div>
                    </div>
                </div>
                <% i++; %>
                <% if (j >= 8) break; %>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
