using GameStore.Factory;
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
    public partial class ViewHistory : System.Web.UI.Page
    {
        public List<TransactionHeader> headers = new List<TransactionHeader>();
        protected void Page_Load(object sender, EventArgs e)
        {
            User u = Session["user"] == null ? null : Session["user"] as User;
            headers = HeaderRepo.GetUserHeaders(u.Id);
        }
    }
}