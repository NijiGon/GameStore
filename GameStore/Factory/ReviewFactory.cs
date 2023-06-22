using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class ReviewFactory
    {
        public static Review createReview(int user_id, int game_id, int rating, string comment, int like, int dislike)
        {
            Review r = new Review();
            r.user_id = user_id;
            r.game_id = game_id;
            r.rating = rating;
            r.comment = comment;
            r.like = like;
            r.dislike = dislike;
            return r;
        }
        public static void editReview(Review r, int rating, string comment)
        {
            r.rating = rating;
            r.comment = comment;
        }
        public static void Liked(Review r)
        {
            r.like += 1;
        }
        public static void Disliked(Review r)
        {
            r.dislike += 1;
        }
    }
}