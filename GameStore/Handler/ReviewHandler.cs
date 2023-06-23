using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Handler
{
    public class ReviewHandler
    {
        public static void createReview(int user_id, int game_id, int rating, string comment)
        {
            Review r = ReviewRepo.GetReviewByUserAndGame(user_id, game_id);
            if(r == null)
            {
                ReviewRepo.addReview(user_id, game_id, rating, comment, 0, 0);
            }
            else
            {
                ReviewRepo.updateReview(user_id, game_id, comment, rating);
            }
        }
    }
}