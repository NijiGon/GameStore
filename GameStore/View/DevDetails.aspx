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
            <div>
                <%-- games list by dev --%>
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
