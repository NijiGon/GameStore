using GameStore.Factory;
using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class HeaderRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static void addHeader(int user_id, string date)
        {
            TransactionHeader th = HeaderFactory.createHeader(user_id, date);
            db.TransactionHeaders.Add(th);
            db.SaveChanges();
        }
        public static List<TransactionHeader> GetUserHeaders(int id)
        {
            return (from th in db.TransactionHeaders where th.user_id == id select th).ToList();
        }
    }
}