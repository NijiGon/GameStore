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
    public partial class ViewGames : System.Web.UI.Page
    {
        public List<Game> games = new List<Game>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sort = Request.QueryString["sorting"];
            if (sort == null) games = GameRepo.GetGames();
            else if (sort == "alph-asc") games = GameRepo.GetGamesByAlphabet();
            else if (sort == "alph-dsc") games = GameRepo.GetGamesByAlphabetDesc();
            else if (sort == "rating") games = GameRepo.GetGamesByRating();
        }
    }
}