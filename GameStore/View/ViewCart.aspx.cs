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
    public partial class ViewCart : System.Web.UI.Page
    {
        public List<Cart> items = new List<Cart>();
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = Session["user"] == null ? null : Session["user"] as User;
            items = CartRepo.GetCarts(u.Id);
            List<TransactionMethod> methods = MethodsRepo.GetMethods();
            List<Platform> platforms = PlatformRepo.GetPlatforms();
            ddlMethod.DataSource = methods;
            ddlMethod.DataTextField = "name";
            ddlMethod.DataValueField = "Id";
            ddlMethod.DataBind();
            ddlPlatform.DataSource = platforms;
            ddlPlatform.DataTextField = "name";
            ddlPlatform.DataValueField = "Id";
            ddlPlatform.DataBind();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (items != null && !string.IsNullOrEmpty(ddlMethod.SelectedValue) && !string.IsNullOrEmpty(ddlPlatform.SelectedValue))
            {
                User u = Session["user"] != null ? Session["user"] as User : null;
                int user_id = Convert.ToInt32(u.Id);
                string date = DateTime.Now.ToString();
                int method_id = Convert.ToInt32(ddlMethod.SelectedValue);
                int platform_id = Convert.ToInt32(ddlPlatform.SelectedValue);
                int transaction_id = TransactionHandler.createTransaction(date, user_id, method_id, platform_id);
                foreach (Cart c in items)
                {
                    DetailRepo.addDetail(transaction_id, c.game_id, c.quantity);
                }
                Response.Redirect("ViewCodes.aspx");
            }
        }
    }
}