using GameStore.Controller;
using GameStore.Handler;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore.View
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegis_Click(object sender, EventArgs e)
        {
            string errorCode = UserController.RegistrationValidator(tbFirst.Text, tbLast.Text, tbEmail.Text, tbPass.Text, tbUname.Text, tbDOB.Text);
            if(errorCode == null)
            {
                UserRepo.addUser(tbFirst.Text, tbLast.Text, tbEmail.Text, tbPass.Text, tbUname.Text, tbDOB.Text);
                Response.Redirect("Login.aspx");
            }
            else
            {
                lbError.Text = errorCode;
            }
        }
    }
}