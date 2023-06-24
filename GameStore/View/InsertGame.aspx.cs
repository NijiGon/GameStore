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
    public partial class InsertGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Developer> devs = DevRepo.GetDevelopers();
                ddlDev.DataSource = devs;
                ddlDev.DataTextField = "name";
                ddlDev.DataValueField = "Id";
                ddlDev.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string name = tbName.Text;
            string desc = tbdesc.Text;
            int price = Convert.ToInt32(tbPrice.Text);
            string img = fuImg.FileName;
            int dev_id = Convert.ToInt32(ddlDev.SelectedValue);
            string errorCode = GameController.GameValidator(name, desc, price, img);
            if (string.IsNullOrEmpty(errorCode))
            {
                GameRepo.addGame(dev_id, name, desc, price, img);
                Response.Redirect("DevDetails.aspx?id=" + dev_id);
            }
            lbError.Text = errorCode;
        }
    }
}