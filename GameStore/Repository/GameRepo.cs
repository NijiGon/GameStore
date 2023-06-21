using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class GameRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static List<Game> GetGames()
        {
            return (from g in db.Games select g).ToList();
        }
        public static List<Game> GetGamesByDev(int id)
        {
            return (from g in db.Games where g.dev_id == id select g).ToList();
        }
        public static List<Game> GetGamesByAlphabet()
        {
            return (from g in db.Games orderby g.name select g).ToList();
        }
        public static List<Game> GetGamesByAlphabetDesc()
        {
            return (from g in db.Games orderby g.name descending select g).ToList();
        }
        public static List<Game> GetGamesByRating()
        {
            return (from g in db.Games orderby ReviewRepo.GetGameRating(g.Id) descending select g).ToList();
        }
    }
}