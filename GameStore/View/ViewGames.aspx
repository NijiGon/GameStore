<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewGames.aspx.cs" Inherits="GameStore.View.ViewGames" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="min-height:100vh; margin-top:10vh">
        <h1>Game List</h1>
        <div class="d-flex">
            <div class="bg-darker rounded-3 shadow h-25 py-4 px-3 w-100" style="max-width:15vw; min-width:15vw;">
            <%-- side bar (filter) --%>
                <h3 class="text-center border-bottom border-2 pb-2">Filters</h3>
                <div class="mt-4">
                    <h5>Enter Min. Price</h5>
                    <div class="input-group">
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="e.g. 20000" aria-label="Username" aria-describedby="basic-addon1" ID="tbMin" runat="server"></asp:TextBox>
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">
                            <asp:Button ID="btnMin" runat="server" Text="Filter" CssClass="rounded-3 border-0 m-auto bg-grayish" OnClick="btnMin_Click" />
                        </span>
                    </div>
                </div>
                <div class="mt-4">
                    <h5>Enter Max. Price</h5>
                    <div class="input-group">
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="e.g. 200000" aria-label="Username" aria-describedby="basic-addon1" ID="tbMax" runat="server"></asp:TextBox>
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">
                            <asp:Button ID="btnMax" runat="server" Text="Filter" CssClass="rounded-3 border-0 m-auto bg-grayish" OnClick="btnMax_Click" />
                        </span>
                    </div>
                </div>
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="rounded-3 fs-5 w-100 text-white border-0 m-auto bg-grayish py-2 mt-4" OnClick="btnReset_Click" />
            </div>
            <div>
                <div class="ms-4">
                <div class="w-25">
                    <%-- sorting area --%>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle border-2 border-white text-center text-white w-50" type="button" data-bs-toggle="dropdown" aria-expanded="false">Sort By</button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ViewGames.aspx?max=<%= max %>&min=<%= min %>&sort=price-dsc">Highest Price</a></li>
                            <li><a class="dropdown-item" href="ViewGames.aspx?max=<%= max %>&min=<%= min %>&sort=price-asc">Lowest Price</a></li>
                            <li><a class="dropdown-item" href="ViewGames.aspx?max=<%= max %>&min=<%= min %>&sort=rating-dsc">Highest Rated</a></li>
                            <li><a class="dropdown-item" href="ViewGames.aspx?max=<%= max %>&min=<%= min %>&sort=alph-asc">A - Z</a></li>
                            <li><a class="dropdown-item" href="ViewGames.aspx?max=<%= max %>&min=<%= min %>&sort=alph-dsc">Z - A</a></li>
                        </ul>
                    </div>
                </div>
                <div>
                    <%-- game area --%>
                    <div>
                        <%-- game div --%>
                        <div class="row my-3">
                            <% foreach(var g in games){ %>
                            <div class="col-3">
                                <div class="card my-3 text-white shadow hover-effect" style="width: 14rem; height: auto; background-color: #2e2e2e">
                                    <img src="../Asset/games/<%= g.image %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= g.name %></h5>
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
            </div>
        </div>
    </div>
</asp:Content>
