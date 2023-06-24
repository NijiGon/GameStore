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
            if (!IsPostBack)
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
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            User u = Session["user"] != null ? Session["user"] as User : null;
            int user_id = u.Id;
            string date = DateTime.Now.ToString();
            items = CartRepo.GetCarts(user_id);
            int method_id = Session["selectedMethodId"] as int? ?? 1;
            int platform_id = Session["selectedPlatformId"] as int? ?? 1;
            if(items.Count > 0)
            {
                int transaction_id = TransactionHandler.createTransaction(date, user_id, platform_id, method_id);
                foreach (var c in items)
                {
                    DetailRepo.addDetail(transaction_id, c.game_id, c.quantity);
                    CartRepo.removeItem(c);
                }
                Response.Redirect("ViewCodes.aspx?id=" + transaction_id);
            }
            Response.Redirect("Home.aspx");
        }

        protected void ddlMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Update selectedMethodId and selectedPlatformId session variables
            Session["selectedMethodId"] = Convert.ToInt32(ddlMethod.SelectedValue);
        }

        protected void ddlPlatform_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["selectedPlatformId"] = Convert.ToInt32(ddlPlatform.SelectedValue);
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            User u = Session["user"] == null ? null : Session["user"] as User;
            items = CartRepo.GetCarts(u.Id);
            if(items.Count > 0)
            {
                foreach(var c in items)
                {
                    CartRepo.removeItem(c);
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}