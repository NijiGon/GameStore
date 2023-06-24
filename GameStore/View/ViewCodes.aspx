<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewCodes.aspx.cs" Inherits="GameStore.View.ViewCodes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h5,p{
            margin-bottom:0 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column align-items-center justify-content-around" style="min-height: 100vh;">
        <div class="d-flex flex-column align-items-center justify-content-center">
            <% int i = 0; %>
            <%foreach (var td in details) { %>
            <div class="d-flex flex-column py-4 px-2 rounded-3 mb-3 bg-darker text-center justify-content-center align-content-center" style="min-width:25vw;">
                <h5>Code for <%= td.Game.name %></h5>
                <p><%= codes[i] %></p>
            </div>
            <% i++; %>
            <%} %>
        </div>
    </div>
</asp:Content>
