<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="ModifyDev.aspx.cs" Inherits="GameStore.View.UpdateDev" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex flex-column align-items-center justify-content-center" style="height: 100vh">
        <div class="shadow rounded-4 w-50 d-flex align-items-center justify-content-center mt-5" style="background-color:#1c1c1c; min-height: 350px;">
            <div class="profile-info ms-5 w-100 py-5 me-5">
                <div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Developer Name</span>
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbName" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text bg-grayish border-2" id="basic-addon1">Developer Description</span>
                        <asp:TextBox type="text" class="form-control bg-grayeesh border-2 gray-placeholder text-primary text-white" placeholder="" ReadOnly="true" aria-label="Username" aria-describedby="basic-addon1" ID="tbDesc" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3 d-flex flex-column">
                        <asp:Label ID="lbImg" runat="server" Text="Upload game image file:"></asp:Label>
                        <asp:FileUpload ID="fuImg" Enabled="false" CssClass="rounded-3 bg-darker" runat="server" />
                    </div>
                    <div class="input-group mb-3">
                        <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div style="">
                    <asp:Button ID="btnEdit" class="rounded btn btn-secondary" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnSave" class="rounded btn btn-secondary" runat="server" Text="Save" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
