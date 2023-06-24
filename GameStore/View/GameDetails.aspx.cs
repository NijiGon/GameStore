using GameStore.Handler;
using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore.View
{
    public partial class GameDetails : System.Web.UI.Page
    {
        public Game g = new Game();
        public List<Review> reviews = new List<Review>();
        public User u;
        public Review rev = new Review();
        public double rating;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            g = GameRepo.FindById(id);
            reviews = ReviewRepo.GetGameReviews(id);
            u = Session["user"] as User;
            if (u != null) rev = ReviewRepo.GetReviewByUserAndGame(u.Id, id);
            else rev = null;
            rating = ReviewRepo.GetGameRating(id);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                u = Session["user"] as User;
                int user_id = u.Id;
                int game_id = Convert.ToInt32(Request.QueryString["id"]);
                CartHandler.verifyItem(user_id, game_id, 1);
                Response.Redirect("GameDetails.aspx?id=" + game_id);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Star_Click(object sender, EventArgs e)
        {
            var starButton = (LinkButton)sender;
            var starIndex = int.Parse(starButton.CommandArgument);

            hiddenStarIndex.Value = starIndex.ToString();

            // Loop through all the star controls
            for (int i = 1; i <= starIndex; i++)
            {
                var filledStar = (Image)starButton.FindControl("filledStar" + i);
                filledStar.Visible = true;

                var emptyStar = (Image)starButton.FindControl("emptyStar" + i);
                emptyStar.Visible = false;
            }

            // Loop through the remaining star controls and update their visibility
            for (int i = starIndex + 1; i <= 5; i++)
            {
                var filledStar = (Image)starButton.FindControl("filledStar" + i);
                filledStar.Visible = false;

                var emptyStar = (Image)starButton.FindControl("emptyStar" + i);
                emptyStar.Visible = true;
            }

            // Perform any other necessary operations, such as submitting the rating
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int game_id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("ModifyGame.aspx?id=" + game_id);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int game_id = Convert.ToInt32(Request.QueryString["id"]);
            GameHandler.deleteGame(game_id);
            Response.Redirect("Home.aspx");
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                if (!string.IsNullOrEmpty(txtComment.Text))
                {
                    int game_id = Convert.ToInt32(Request.QueryString["id"]);
                    int rating = Convert.ToInt32(hiddenStarIndex.Value);
                    User u = Session["user"] as User;
                    ReviewHandler.createReview(u.Id, game_id, rating, txtComment.Text);
                    Response.Redirect("GameDetails.aspx?id=" + game_id);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            int game_id = Convert.ToInt32(Request.QueryString["id"]);
            User u = Session["user"] as User;
            Review r = ReviewRepo.GetReviewByUserAndGame(u.Id, game_id);
            if (r != null) ReviewRepo.removeReview(r);
            Response.Redirect("GameDetails.aspx?id=" + game_id);
        }
    }
}