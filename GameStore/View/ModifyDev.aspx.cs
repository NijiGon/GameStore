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
    public partial class UpdateDev : System.Web.UI.Page
    {
        Developer d = new Developer();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            d = DevRepo.FindById(id);
            tbName.Attributes["placeholder"] = d.name;
            tbDesc.Attributes["placeholder"] = d.description;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (tbName.ReadOnly == true)
            {
                tbName.ReadOnly = false;
                tbDesc.ReadOnly = false;
                fuImg.Enabled = true;
            }
            else
            {
                tbName.ReadOnly = true;
                tbDesc.ReadOnly = true;
                fuImg.Enabled = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            d = DevRepo.FindById(id);
            string name = tbName.Text;
            string desc = tbDesc.Text;
            string img = fuImg.FileName;
            string errorCode = DevController.DevValidator(name, img, desc);
            if (string.IsNullOrEmpty(errorCode))
            {
                DevRepo.updateDev(d, name, img, desc);
            }
            else
            {
                lbError.Text = errorCode;
            }
        }
    }
}