<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="InsertDev.aspx.cs" Inherits="GameStore.View.InsertDev" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="fs-4" style="width: 40%">
            <h1 class="text-center">Add Developer</h1>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbName" runat="server" Text="Developer Name"></asp:Label>
                <asp:TextBox ID="tbName" runat="server" placeholder="" CssClass="p-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbDesc" runat="server" Text="Developer Description"></asp:Label>
                <asp:TextBox ID="tbDesc" runat="server" type="" placeholder="" CssClass="p-2 rounded-3 form-control bg-dark border-white text-white gray-placeholder"></asp:TextBox>
            </div>
            <div class="d-flex flex-column py-1 my-3">
                <asp:Label ID="lbImg" runat="server" Text="Developer Image" CssClass=""></asp:Label>
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
