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
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["user"];
                string email = cookie == null ? null : cookie.Value;
                if (email != null) tbEmail.Text = email;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User u = UserRepo.FindUser(tbEmail.Text, tbPass.Text);
            if(u != null)
            {
                Session["user"] = u;
                if (cbAgree.Checked)
                {
                    HttpCookie cookie = new HttpCookie("user");
                    cookie.Value = u.email;
                    cookie.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(cookie);
                }
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbError.Text = "Incorrect combination of username and password";
            }
        }
    }
}