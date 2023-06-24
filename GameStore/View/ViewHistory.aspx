<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewHistory.aspx.cs" Inherits="GameStore.View.ViewHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container w-50 d-flex justify-content-center fs-4" style="min-height:100vh;">
        <div class="d-flex flex-column justify-content-center align-content-center" style="margin:14vh 14vh">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Transaction Date</th>
                        <th scope="col">Platform</th>
                        <th scope="col">Method</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i = 1; %>
                    <% foreach(var th in headers){ %>
                    <tr>
                        <th scope="row"><%= i %></th>
                        <td><a style="text-decoration:underline !important;" href="ViewDetails.aspx?id=<%= th.Id %>"><%= th.transaction_date %></a></td>
                        <td><%= th.Platform.name %></td>
                        <td><%= th.TransactionMethod.name %></td>
                    </tr>
                    <% i++; %>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
