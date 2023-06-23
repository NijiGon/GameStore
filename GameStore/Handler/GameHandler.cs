using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Handler
{
    public class GameHandler
    {
        public static void deleteGame(int id)
        {
            Game delete = GameRepo.FindById(id);
            if (delete == null)
            {
                return;
            }
            List<Cart> deleteList = CartRepo.GetItemsByGame(id);
            List<TransactionDetail> deleteList2 = DetailRepo.GetDetailsByGame(id);
            List<Review> deleteList3 = ReviewRepo.GetGameReviews(id);

            foreach (Cart deleted in deleteList)
            {
                CartRepo.removeItem(deleted);
            }
            foreach (var deleted in deleteList2)
            {
                DetailRepo.removeDetail(deleted);
            }
            foreach(var deleted in deleteList3)
            {
                ReviewRepo.removeReview(deleted);
            }
            GameRepo.removeGame(delete);
        }
    }
}