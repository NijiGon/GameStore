<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="DevDetails.aspx.cs" Inherits="GameStore.View.DevDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%-- container --%>
        <div>
            <%-- img container --%>
            <div>
                <%-- image --%>
            </div>
        </div>
        <div>
            <%-- info container --%>
            <div>
                <%-- dev title --%>
            </div>
            <div>
                <%-- dev description --%>
            </div>
            <div class="d-flex">
                <%-- games list by dev --%>
                <% foreach(var g in games){ %>
                <div class="card" style="width: 18rem;">
                    <img src="../Asset/games/<%= g.image %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%= g.name %></h5>
                        <p class="card-text">Rp.<%= g.price.ToString("#,##0") %></p>
                        <a href="GameDetails.aspx?id=<%= g.Id %>" class="btn btn-primary">View Details</a>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
