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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (tbName.ReadOnly == true)
            {
                tbName.ReadOnly = false;
                tbDesc.ReadOnly = false;
                tbPrice.ReadOnly = false;
            }
            else
            {
                tbName.ReadOnly = true;
                tbDesc.ReadOnly = true;
                tbPrice.ReadOnly = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}