<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="GameStore.View.GameDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bg-darker d-flex py-5 px-5" style="margin-top:8vh; min-height:100vh;">
        <%-- container --%>
        <div class="w-75 me-5">
            <%-- price n img container --%>
            <div class="">
                <%-- image --%>
                <img src="../Asset/games/<%= g.image %>" class="w-100 rounded-3" alt="Alternate Text" />
            </div>
            <div class="my-3 text-center">
                <%-- price --%>
                <h3>Rp.<%= g.price.ToString("#,##0") %></h3>
            </div>
            <div class="d-flex justify-content-center flex-column align-items-center">
                <%-- add to cart --%>
                <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-body-tertiary w-100" OnClick="btnAdd_Click" />
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
                    <%-- game title --%>
                    <h1><%= g.name %></h1>
                </div>
                <div>
                    <%-- game developer --%>
                    <h2><%= g.Developer1.name %></h2>
                </div>
                <div>
                    <%-- game description --%>
                    <p><%= g.description %></p>
                </div>
            </div>
            <div>
                <%-- game reviews --%>
                <h3>User Reviews</h3>
                <% foreach (var r in reviews) {%>
                <div class="px-3 py-3 d-flex flex-column justify-content-between my-3 bg-blackish rounded-3">
                    <div>
                        <h4><%= r.User.username %></h4>
                        <div>
                            <%for (int i = 0; i < 5; i++) { %>
                            <% if (i < r.rating) {%>
                            <i class="bi bi-star-fill"></i>
                            <%} %>
                            <% else { %>
                            <i class="bi bi-star"></i>
                            <%} %>
                            <%} %>
                        </div>
                    </div>
                    <p style="margin: 0;"><%= r.comment %></p>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
