using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class DetailRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static List<TransactionDetail> GetDetailsByHeader(int id)
        {
            return (from td in db.TransactionDetails where td.transaction_id == id select td).ToList();
        }
    }
}