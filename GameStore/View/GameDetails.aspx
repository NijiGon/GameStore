<%@ Page Title="" Language="C#" MasterPageFile="~/View/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="GameStore.View.GameDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-xxxxx" crossorigin="anonymous" />
    <style>
        .auto-growth {
            overflow: hidden;
            resize: none;
        }
        .star-img{
            height:25px;
            width:auto;
        }
        .star-img svg{
            fill:red !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bg-darker d-flex py-5 px-5" style="margin-top:8vh; min-height:100vh;">
        <%-- container --%>
        <div class="me-5" style="width:25%">
            <%-- price n img container --%>
            <div class="">
                <%-- image --%>
                <img src="../Asset/games/<%= g.image %>" class="w-100 rounded-3" alt="Alternate Text" />
            </div>
            <div class="text-center fs-4 mt-3">
                <i class="bi bi-star-fill"><%= rating.ToString("0.00") %></i>
            </div>
            <div class="my-3 text-center">
                <%-- price --%>
                <h3>Rp.<%= g.price.ToString("#,##0") %></h3>
            </div>
            <div class="d-flex justify-content-center flex-column align-items-center">
                <%-- add to cart --%>
                <% if (u != null)
                    { %>
                <%if (u.role == "customer")
                    { %>
                <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-body-tertiary w-100" OnClick="btnAdd_Click" />
                <%} %>
                <% if (rev != null)
                    { %>
                <asp:Button ID="btnRemove" runat="server" Text="Remove Review" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-danger w-100" OnClick="btnRemove_Click" />
                <%} %>
                <% if (u.role == "admin")
                    { %>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-warning w-100" OnClick="btnEdit_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="mb-3 fs-4 hover-effect rounded-3 border-0 w-25 m-auto py-2 bg-danger w-100" OnClick="btnDelete_Click" />
                <%} %>
                <%} %>
            </div>
        </div>
        <div class="d-flex flex-column justify-content-between" style="width:75%">
            <%-- info container --%>
            <div>
                <div>
                    <%-- game title --%>
                    <h1><%= g.name %></h1>
                </div>
                <div>
                    <%-- game developer --%>
                    <h2><a href="DevDetails.aspx?id=<%= g.dev_id %>"><%= g.Developer.name %></a></h2>
                </div>
                <div>
                    <%-- game description --%>
                    <p><%= g.description %></p>
                </div>
            </div>
            <% if (u != null){ %>
            <% if (u.role == "customer")
                { %>
            <div class="mb-3">
                <h3>Add a comment</h3>
                <div class="d-flex w-100" style="margin-top: -10px;">
                    <div class="w-100" style="margin-top: 2px;">
                        <%--<asp:LinkButton ID="star1" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="1">
                            <asp:Image ID="emptyStar1" runat="server" CssClass="star-img bi bi-star" ImageUrl="../Asset/icons/blank.png" />
                            <asp:Image ID="filledStar1" runat="server" CssClass="star-img bi bi-star-fill" ImageUrl="../Asset/icons/blank.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star2" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="1">
                            <asp:Image ID="emptyStar2" runat="server" CssClass="star-img bi bi-star" ImageUrl="../Asset/icons/blank.png" />
                            <asp:Image ID="filledStar2" runat="server" CssClass="star-img bi bi-star-fill" ImageUrl="../Asset/icons/blank.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star3" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="1">
                            <asp:Image ID="emptyStar3" runat="server" CssClass="star-img bi bi-star" ImageUrl="../Asset/icons/blank.png" />
                            <asp:Image ID="filledStar3" runat="server" CssClass="star-img bi bi-star-fill" ImageUrl="../Asset/icons/blank.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star4" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="1">
                            <asp:Image ID="emptyStar4" runat="server" CssClass="star-img bi bi-star" ImageUrl="../Asset/icons/blank.png" />
                            <asp:Image ID="filledStar4" runat="server" CssClass="star-img bi bi-star-fill" ImageUrl="../Asset/icons/blank.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star5" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="1">
                            <asp:Image ID="emptyStar5" runat="server" CssClass="star-img bi bi-star" ImageUrl="../Asset/icons/blank.png" />
                            <asp:Image ID="filledStar5" runat="server" CssClass="star-img bi bi-star-fill" ImageUrl="../Asset/icons/blank.png" Visible="false" />
                        </asp:LinkButton>--%>
                        <asp:LinkButton ID="star1" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="1">
                            <asp:Image ID="emptyStar1" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star.png" />
                            <asp:Image ID="filledStar1" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star-fill.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star2" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="2">
                            <asp:Image ID="emptyStar2" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star.png" />
                            <asp:Image ID="filledStar2" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star-fill.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star3" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="3">
                            <asp:Image ID="emptyStar3" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star.png" />
                            <asp:Image ID="filledStar3" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star-fill.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star4" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="4">
                            <asp:Image ID="emptyStar4" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star.png" />
                            <asp:Image ID="filledStar4" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star-fill.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="star5" CssClass="star" runat="server" OnClick="Star_Click" CommandArgument="5">
                            <asp:Image ID="emptyStar5" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star.png" />
                            <asp:Image ID="filledStar5" runat="server" CssClass="star-img" ImageUrl="../Asset/icons/star-fill.png" Visible="false" />
                        </asp:LinkButton>
                        <asp:HiddenField ID="hiddenStarIndex" runat="server" />
                    </div>
                </div>
                <div class="d-flex mt-3">
                    <asp:TextBox ID="txtComment" CssClass="p-2 rounded-0 rounded-top-2 form-control border-0 border-bottom bg-darker border-white text-white gray-placeholder auto-growth" placeholder="Add a comment..." runat="server" TextMode="MultiLine" Rows="1"></asp:TextBox>
                    <asp:Button ID="btnComment" CssClass="rounded-end-3 border-0 bg-body-tertiary" runat="server" Text="Comment" OnClick="btnComment_Click" />
                </div>
            </div>
            <% if (rev != null)
                { %>
            <div class="mt-4">
                <h3>Your Review</h3>
                <div class="px-3 py-3 d-flex flex-column justify-content-between my-3 bg-blackish rounded-3">
                    <div>
                        <h4><%= rev.User.username %></h4>
                        <div>
                            <%for (int i = 0; i < 5; i++)
                                { %>
                            <% if (i < rev.rating)
                                {%>
                            <i class="bi bi-star-fill"></i>
                            <%} %>
                            <% else
                                { %>
                            <i class="bi bi-star"></i>
                            <%} %>
                            <%} %>
                        </div>
                    </div>
                    <p style="margin-bottom: 0;" class="fs-5 mt-4"><%= rev.comment %></p>
                </div>
            </div>
            <%} %>
            <%} %>
            <%} %>
            <div class="mt-4">
                <%-- game reviews --%>
                <h3>User Reviews</h3>
                <% foreach (var r in reviews) {%>
                <div class="px-3 py-3 d-flex flex-column justify-content-between my-3 bg-blackish rounded-3">
                    <div>
                        <h4><%= r.User.username %></h4>
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
                    <p style="margin-bottom: 0;" class="fs-5 mt-4"><%= r.comment %></p>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    <script>
    var txtComments = document.getElementById('<%= txtComment.ClientID %>');
    txtComments.addEventListener('input', function () {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });
    </script>
</asp:Content>
