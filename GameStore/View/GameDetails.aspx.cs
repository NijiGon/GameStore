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
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            g = GameRepo.FindById(id);
            reviews = ReviewRepo.GetGameReviews(id);
            u = Session["user"] as User;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                u = Session["user"] as User;
                int user_id = u.Id;
                int game_id = Convert.ToInt32(Request.QueryString["id"]);
                CartHandler.verifyItem(user_id, game_id, 1);
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

                //filledStar.CssClass = "star-img bi bi-star-fill";
                //emptyStar.CssClass = "star-img bi bi-star";
            }

            // Perform any other necessary operations, such as submitting the rating
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}