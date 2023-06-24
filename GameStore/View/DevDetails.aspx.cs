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
    public partial class DevDetails : System.Web.UI.Page
    {
        public List<Game> games = new List<Game>();
        public Developer d;
        public User u;
        public double[] ratings = new double[100];
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            games = GameRepo.GetGamesByDev(id);
            d = DevRepo.FindById(id);
            if (Session["user"] != null) u = Session["user"] as User;
            foreach (var g in games)
            {
                ratings[g.Id] = ReviewRepo.GetGameRating(g.Id);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int dev_id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("ModifyDev.aspx?id=" + dev_id);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int dev_id = Convert.ToInt32(Request.QueryString["id"]);
            DevHandler.deleteDev(dev_id);
            Response.Redirect("Home.aspx");
        }
    }
}