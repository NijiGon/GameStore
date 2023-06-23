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
        public string sort;
        public string min;
        public string max;
        protected void Page_Load(object sender, EventArgs e)
        {
            sort = Request.QueryString["sort"];
            max = Request.QueryString["max"];
            min = Request.QueryString["min"];
            if (!string.IsNullOrEmpty(min)) tbMin.Attributes["placeholder"] = min;
            if (!string.IsNullOrEmpty(max)) tbMax.Attributes["placeholder"] = max;
            if (string.IsNullOrEmpty(sort)) games = GameRepo.GetGames();
            else if (sort == "alph-asc") games = GameRepo.GetGamesByAlphabet();
            else if (sort == "alph-dsc") games = GameRepo.GetGamesByAlphabetDesc();
            else if (sort == "rating-dsc") games = GameRepo.GetGamesByRating();
            else if (sort == "price-dsc") games = GameRepo.GetGamesByPriceDesc();
            else if (sort == "price-asc") games = GameRepo.GetGamesByPrice();
            if (!string.IsNullOrEmpty(max))
            {
                games = games.Where(g => g.price < Convert.ToInt32(max)).ToList();
            }
            if (!string.IsNullOrEmpty(min))
            {
                games = games.Where(g => g.price > Convert.ToInt32(min)).ToList();
            }
        }

        protected void btnMin_Click(object sender, EventArgs e)
        {
            sort = Request.QueryString["sort"];
            max = Request.QueryString["max"];
            Response.Redirect("ViewGames.aspx?max=" + max + "&min=" + tbMin.Text + "&sort=" + sort);
        }

        protected void btnMax_Click(object sender, EventArgs e)
        {
            sort = Request.QueryString["sort"];
            min = Request.QueryString["min"];
            Response.Redirect("ViewGames.aspx?max=" + tbMax.Text + "&min=" + min + "&sort=" + sort);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewGames.aspx");
        }
    }
}