using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class HeaderFactory
    {
        public static TransactionHeader createHeader(int user_id, string datetime, int platform_id, int method_id)
        {
            TransactionHeader th = new TransactionHeader();
            th.user_id = user_id;
            th.transaction_date = DateTime.Parse(datetime);
            th.platform_id = platform_id;
            th.method_id = method_id;
            return th;
        }
    }
}