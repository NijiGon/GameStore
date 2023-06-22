using GameStore.Factory;
using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class DetailRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static void addDetail(int transaction_id, int game_id, int qty)
        {
            TransactionDetail td = DetailFactory.createDetail(transaction_id, game_id, qty);
            db.TransactionDetails.Add(td);
            db.SaveChanges();
        }
        public static List<TransactionDetail> GetDetailsByHeader(int id)
        {
            return (from td in db.TransactionDetails where td.transaction_id == id select td).ToList();
        }
        public static List<TransactionDetail> GetDetailsByGame(int id)
        {
            return (from td in db.TransactionDetails where td.game_id == id select td).ToList();
        }
        public static void removeDetail(TransactionDetail td)
        {
            db.TransactionDetails.Remove(td);
            db.SaveChanges();
        }
    }
}