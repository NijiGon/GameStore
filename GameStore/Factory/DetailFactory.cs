using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GameStore.Model;

namespace GameStore.Factory
{
    public class DetailFactory
    {
        public static TransactionDetail createDetail(int transaction_id, int game_id, int qty)
        {
            TransactionDetail td = new TransactionDetail();
            td.transaction_id = transaction_id;
            td.game_id = game_id;
            td.quantity = qty;
            return td;
        }
    }
}