using GameStore.Controller;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore.View
{
    public partial class InsertDev : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string name = tbName.Text;
            string img = fuImg.FileName;
            string desc = tbDesc.Text;
            string errorCode = DevController.DevValidator(name, img, desc);
            if (string.IsNullOrEmpty(errorCode))
            {
                DevRepo.addDev(name, img, desc);
                Response.Redirect("Home.aspx");
            }
            lbError.Text = errorCode;
        }
    }
}