<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="GameStore.View.ViewProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bg-darkish{
            background-color: #1c1c1c !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex flex-column align-items-center justify-content-center" style="height: 100vh">
        <div class="shadow rounded-4 w-50 d-flex align-items-center justify-content-center mt-5" style="background-color:#1c1c1c; min-height: 350px;">
            <div class="profile-info ms-5 w-100 py-5 me-5">
                <div class="d-flex">
                    <div class="input-group mb-3 me-4">
                        <span class="input-group-text bg-grayish border-2" id="">Nama depan</span>
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbFName" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Nama belakang</span>
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbLName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Username</span>
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbUname" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Email</span>
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbEmail" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Password</span>
                        <asp:TextBox type="password" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbPass" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Date of Birth</span>
                        <asp:TextBox type="" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbDOB" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div style="">
                    <asp:Button ID="btnEdit" class="rounded btn btn-secondary" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnSave" class="rounded btn btn-secondary" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnLogout" class="rounded btn btn-danger" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>
        <div class="mt-4 w-50">
            <h3 class="border-bottom border-2 py-3">Your Reviews</h3>
            <% foreach (var r in reviews){ %>
            <div class="px-3 shadow py-3 d-flex flex-column justify-content-between my-3 bg-darkish rounded-3">
                    <div>
                        <h4 class="mb-0"><%= r.User.username %></h4>
                        <p class="mt-0 fs-6">Commenting on <a href="GameDetails.aspx?id=<%= r.game_id %>"><%= r.Game.name %></a></p>
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
                    <p style="margin: 0;" class="fs-4"><%= r.comment %></p>
                </div>
            <%} %>
        </div>
    </div>
    
</asp:Content>
