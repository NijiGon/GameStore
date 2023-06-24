<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="DevDetails.aspx.cs" Inherits="GameStore.View.DevDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bg-darker d-flex py-5 px-5" style="margin-top:8vh; min-height:100vh;">
        <%-- container --%>
        <div class="me-5" style="max-width:25%">
            <%-- price n img container --%>
            <div class="">
                <%-- image --%>
                <img src="../Asset/developers/<%= d.image %>" class="w-100 rounded-3" alt="Alternate Text" />
            </div>
            <div class="d-flex justify-content-center flex-column align-items-center mt-3">
                <% if (u != null)
                    { %>
                <% if (u.role == "admin")
                    { %>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-warning w-100" OnClick="btnEdit_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-danger w-100" OnClick="btnDelete_Click" />
                <%} %>
                <%} %>
            </div>
        </div>
        <div class="d-flex flex-column justify-content-between">
            <%-- info container --%>
            <div>
                <div>
                    <%-- dev name --%>
                    <h1><%= d.name %></h1>
                </div>
                <div>
                    <%-- game description --%>
                    <p><%= d.description %></p>
                </div>
                <div class="row">
                <%-- games list by dev --%>
                    <h2>Games by <%= d.name %></h2>
                    <% foreach(var g in games){ %>
                    <div class="col-4">
                        <div class="card my-3 text-white shadow hover-effect" style="width: 16rem; background-color: #2e2e2e">
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
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
