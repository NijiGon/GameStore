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
    public partial class UpdateGame : System.Web.UI.Page
    {
        Game g = new Game();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                g = GameRepo.FindById(id);
                List<Developer> devs = DevRepo.GetDevelopers();
                ddlDev.DataSource = devs;
                ddlDev.DataTextField = "name";
                ddlDev.DataValueField = "Id";
                ddlDev.DataBind();
                tbName.Attributes["placeholder"] = g.name;
                tbDesc.Attributes["placeholder"] = g.description;
                tbPrice.Attributes["placeholder"] = g.price.ToString();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (tbName.ReadOnly == true)
            {
                tbName.ReadOnly = false;
                tbDesc.ReadOnly = false;
                tbPrice.ReadOnly = false;
                ddlDev.Enabled = true;
                fuImg.Enabled = true;
            }
            else
            {
                tbName.ReadOnly = true;
                tbDesc.ReadOnly = true;
                tbPrice.ReadOnly = true;
                ddlDev.Enabled = false;
                fuImg.Enabled = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            g = GameRepo.FindById(id);
            string name = tbName.Text;
            string desc = tbDesc.Text;
            string image = fuImg.FileName;
            int price = Convert.ToInt32(tbPrice.Text);
            int dev_id = Convert.ToInt32(ddlDev.SelectedValue);
            string errorCode = GameController.GameValidator(name, desc, price, image);
            if (string.IsNullOrEmpty(errorCode))
            {
                GameRepo.updateGame(g, dev_id, name, desc, price, image);
            }
            else
            {
                lbError.Text = errorCode;
            }
        }
    }
}