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
    public partial class ViewDetails : System.Web.UI.Page
    {
        public List<TransactionDetail> details = new List<TransactionDetail>();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            details = DetailRepo.GetDetailsByHeader(id);
        }
    }
}