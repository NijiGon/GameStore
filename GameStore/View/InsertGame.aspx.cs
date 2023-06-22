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
    public partial class InsertGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            int dev_id = Convert.ToInt32(id);
            string name = tbName.Text;
            string desc = tbdesc.Text;
            int price = Convert.ToInt32(tbPrice.Text);
            string img = fuImg.FileName;
            int size = fuImg.PostedFile.ContentLength;
            string errorCode = GameController.GameValidator(name, desc, price, img, size);
            if (string.IsNullOrEmpty(errorCode))
            {
                GameRepo.addGame(dev_id, name, desc, price, img);
                Response.Redirect("DevDetails.aspx?id=" + id);
            }
            lbError.Text = errorCode;
        }
    }
}