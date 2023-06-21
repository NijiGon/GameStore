using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class ReviewRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static List<Review> GetGameReviews(int id)
        {
            return (from r in db.Reviews where r.game_id == id select r).ToList();
        }

        public static double GetGameRating(int id)
        {
            return (from r in db.Reviews where r.game_id == id select r.rating).Average();
        }
        public static List<Review> GetUserReviews(int id)
        {
            return (from r in db.Reviews where r.user_id == id select r).ToList();
        }
    }
}