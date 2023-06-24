using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Handler
{
    public class CartHandler
    {
        public static void verifyItem(int user_id, int game_id, int qty)
        {
            if (CartRepo.FindById(user_id, game_id) == null)
            {
                CartRepo.addItem(user_id, game_id, qty);
            }
            else
            {
                CartRepo.addQty(user_id, game_id, qty);
            }
        }
    }
}