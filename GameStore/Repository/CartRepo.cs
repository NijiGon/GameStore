using GameStore.Factory;
using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class CartRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();
        
        public static void addItem(int user_id, int game_id, int quantity)
        {
            Cart c = CartFactory.createItem(user_id, game_id, quantity);
            db.Carts.Add(c);
            db.SaveChanges();
        }
        public static void addQty(int user_id, int game_id, int qty)
        {
            Cart cart = FindById(user_id, game_id);
            cart.quantity += qty;
            db.SaveChanges();
        }
        public static List<Cart> GetCarts(int id)
        {
            return (from c in db.Carts where c.user_id == id select c).ToList();
        }
        public static List<Cart> GetItemsByGame(int id)
        {
            return (from c in db.Carts where c.game_id == id select c).ToList();
        }
        public static Cart FindById(int user_id, int game_id)
        {
            return (from c in db.Carts where c.user_id == user_id && c.game_id == game_id select c).FirstOrDefault();
        }
        public static void removeItem(Cart c)
        {
            db.Carts.Remove(c);
            db.SaveChanges();
        }
    }
}