using GameStore.Factory;
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

        public static void addReview(int user_id, int game_id, int rating, string comment, int like, int dislike)
        {
            Review r = ReviewFactory.createReview(user_id, game_id, rating, comment, like, dislike);
            db.Reviews.Add(r);
            db.SaveChanges();
        }
        public static Review GetReviewByUserAndGame(int user_id, int game_id)
        {
            return (from r in db.Reviews where r.user_id == user_id && r.game_id == game_id select r).FirstOrDefault();
        }
        public static void removeReview(Review r)
        {
            db.Reviews.Remove(r);
            db.SaveChanges();
        }
        public static void updateReview(int user_id, int device_id, string comment, int rating)
        {
            Review r = GetReviewByUserAndGame(user_id, device_id);
            if (r != null)
            {
                ReviewFactory.editReview(r, rating, comment);
                db.SaveChanges();
            }
        }
        public static List<Review> GetGameReviews(int id)
        {
            return (from r in db.Reviews where r.game_id == id orderby r.like descending select r).ToList();
        }

        public static double GetGameRating(int id)
        {
            Review rev = (from r in db.Reviews where r.game_id == id select r).FirstOrDefault();
            if (rev != null) return (from r in db.Reviews where r.game_id == id select r.rating).Average();
            return 0;
        }
        public static List<Review> GetUserReviews(int id)
        {
            return (from r in db.Reviews where r.user_id == id select r).ToList();
        }
    }
}