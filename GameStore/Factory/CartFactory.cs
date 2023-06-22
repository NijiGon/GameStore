using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class CartFactory
    {
        public static Cart createItem(int user_id, int game_id, int qty)
        {
            Cart c = new Cart();
            c.user_id = user_id;
            c.game_id = game_id;
            c.quantity = qty;
            return c;
        }
    }
}