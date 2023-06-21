<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GameStore.View.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <div>
                <asp:Label ID="lbFirst" runat="server" Text="First Name"></asp:Label>
                <asp:TextBox ID="tbFirst" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lbLast" runat="server" Text="Last Name"></asp:Label>
                <asp:TextBox ID="tbLast" runat="server"></asp:TextBox>
            </div>
        </div>
        <div>
            <asp:Label ID="lbEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lbPass" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="tbPass" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lbUname" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="tbUname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lbDOB" runat="server" Text="Date of Birth:"></asp:Label>
            <asp:TextBox ID="tbDOB" placeholder="YYYY/MM/DD" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:Button ID="btnRegis" runat="server" Text="Register" OnClick="btnRegis_Click" />
        </div>
    </div>
</asp:Content>
