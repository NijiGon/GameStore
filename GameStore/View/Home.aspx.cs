using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore.Views
{
    public partial class Home : System.Web.UI.Page
    {
        public List<Game> games = new List<Game>();
        public List<Developer> developers = new List<Developer>();
        public double[] ratings = new double[100];
        protected void Page_Load(object sender, EventArgs e)
        {
            games = GameRepo.GetGamesByRating();
            developers = DevRepo.GetDevelopers();
            foreach(var g in games)
            {
                ratings[g.Id] = ReviewRepo.GetGameRating(g.Id);
            }
        }
    }
}