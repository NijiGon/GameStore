using GameStore.Factory;
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
        
        public static void addGame(int dev_id, string name, string desc, int price, string image)
        {
            Game g = GameFactory.createGame(dev_id, name, desc, price, image);
            db.Games.Add(g);
            db.SaveChanges();
        }
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
            List<Game> games = GetGames();
            return games.OrderByDescending(d => ReviewRepo.GetGameRating(d.Id)).ToList();
        }
        public static void removeGame(Game g)
        {
            db.Games.Remove(g);
            db.SaveChanges();
        }
    }
}