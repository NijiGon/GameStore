<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="InsertGame.aspx.cs" Inherits="GameStore.View.InsertGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="fs-4" style="width: 40%">
            <h1 class="text-center">Add Game</h1>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbMethod" runat="server" Text="Choose developer:"></asp:Label>
                <asp:DropDownList ID="ddlDev" CssClass="rounded-3 bg-dark p-2 text-white" runat="server"></asp:DropDownList>
            </div>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbName" runat="server" Text="Game Name"></asp:Label>
                <asp:TextBox ID="tbName" runat="server" placeholder="" CssClass="p-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbDesc" runat="server" Text="Game Description"></asp:Label>
                <asp:TextBox ID="tbdesc" runat="server" type="" placeholder="" CssClass="p-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbPrice" runat="server" Text="Game Price"></asp:Label>
                <asp:TextBox ID="tbPrice" runat="server" type="" placeholder="" CssClass="p-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbImg" runat="server" Text="Game Image"></asp:Label>
                <asp:FileUpload ID="fuImg" CssClass="rounded-3 bg-darker" runat="server" />
            </div>
            <div class="text-center text-danger my-3 fw-bold">
                <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
            </div>
            <div class="d-flex flex-column py-1">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="rounded-3 border-0 w-25 m-auto py-2 bg-body-tertiary" OnClick="btnInsert_Click" />
            </div>
        </div>
    </div>
</asp:Content>
