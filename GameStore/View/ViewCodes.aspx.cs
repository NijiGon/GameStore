using GameStore.Algo;
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
    public partial class ViewCodes : System.Web.UI.Page
    {
        public string[] codes = new string[100];
        public List<TransactionDetail> details = new List<TransactionDetail>();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            details = DetailRepo.GetDetailsByHeader(id);
            for(int i = 0; i < details.Count; i++)
            {
                codes[i] = Generate();
            }
        }
        protected static string Generate()
        {
            return CodeGenerator.GenerateRandomString().ToUpper();
        }
    }
}