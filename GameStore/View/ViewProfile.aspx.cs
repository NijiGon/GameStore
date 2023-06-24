using GameStore.Controller;
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
    public partial class ViewProfile : System.Web.UI.Page
    {
        public List<Review> reviews = new List<Review>();
        public User u;
        protected void Page_Load(object sender, EventArgs e)
        {
            u = Session["user"] as User;
            if (u != null)
            {
                int id = u.Id;
                reviews = ReviewRepo.GetUserReviews(id);
                tbFName.Attributes["placeholder"] = u.first_name;
                tbLName.Attributes["placeholder"] = u.last_name;
                tbUname.Attributes["placeholder"] = u.username;
                tbEmail.Attributes["placeholder"] = u.email;
                tbPass.Attributes["placeholder"] = new string('*', u.password.Length);
                tbDOB.Attributes["placeholder"] = u.dob?.ToString("yyyy/MM/dd");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (tbFName.ReadOnly == true)
            {
                tbFName.ReadOnly = false;
                tbLName.ReadOnly = false;
                tbEmail.ReadOnly = false;
                tbUname.ReadOnly = false;
                tbPass.ReadOnly = false;
                tbDOB.ReadOnly = false; 
            }
            else
            {
                tbFName.ReadOnly = true;
                tbLName.ReadOnly = true;
                tbEmail.ReadOnly = true;
                tbUname.ReadOnly = true;
                tbPass.ReadOnly = true;
                tbDOB.ReadOnly = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errorCode = UserController.EditValidator(tbFName.Text, tbLName.Text, tbEmail.Text, tbPass.Text, tbUname.Text, tbDOB.Text);
            User u = Session["user"] as User;
            if (string.IsNullOrEmpty(errorCode) && u != null)
            {
                UserRepo.editProfile(u.Id, tbFName.Text, tbLName.Text, tbEmail.Text, tbPass.Text, tbUname.Text, tbDOB.Text);
                Response.Redirect("ViewProfile.aspx");
            }
            else lbError.Text = errorCode;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}