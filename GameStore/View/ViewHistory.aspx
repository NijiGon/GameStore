<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewHistory.aspx.cs" Inherits="GameStore.View.ViewHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
                <% foreach(var th in headers){ %>
                <% int i = 1; %>
                <tr>
                    <th scope="row"><%= i %></th>
                    <td><a href="ViewDetails?id=<%= th.Id %>"><%= th.transaction_date %></a></td>
                    <td><%= th.Platform.name %></td>
                    <td><%= th.TransactionMethod.name %></td>
                </tr>
                <% i++; %>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
