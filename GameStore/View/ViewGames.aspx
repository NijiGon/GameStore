<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewGames.aspx.cs" Inherits="GameStore.View.ViewGames" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <%-- side bar (filter) --%>
        </div>
        <div>
            <div>
                <div>
                    <%-- sorting area --%>
                </div>
                <div>
                    <%-- game area --%>
                    <div>
                        <%-- game div --%>
                        <div class="row">
                            <% int i = 0; %>
                            <% foreach(var g in games){ %>
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                <div class="card my-3 text-white shadow" style="width: 18rem; background-color: #2e2e2e">
                                    <img src="../Asset/games/<%= g.image %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= g.name %></h5>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
