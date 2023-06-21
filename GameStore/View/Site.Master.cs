using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore.Views
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public User u = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            u = Session["user"] == null ? null : Session["user"] as User;
        }
    }
}