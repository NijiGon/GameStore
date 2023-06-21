using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GameStore.Model;
using GameStore.Repository;

namespace GameStore.View
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            tbEmail.Text = cookie.Value == null ? "" : cookie.Value;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User u = UserRepo.FindUser(tbEmail.Text, tbPass.Text);
            if(u != null)
            {
                Session["user"] = u;
                HttpCookie cookie = new HttpCookie("user");
                cookie.Value = u.username;
                cookie.Expires = DateTime.Now.AddHours(12);
                Response.Cookies.Add(cookie);
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbError.Text = "Incorrect combination of username and password";
            }
        }
    }
}