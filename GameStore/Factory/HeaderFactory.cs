using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class HeaderFactory
    {
        public static TransactionHeader createHeader(int user_id, string datetime)
        {
            TransactionHeader th = new TransactionHeader();
            th.user_id = user_id;
            th.transaction_date = DateTime.Parse(datetime);
            return th;
        }
    }
}