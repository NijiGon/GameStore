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

        public static void addHeader(int user_id, string date, int platform_id, int method_id)
        {
            TransactionHeader th = HeaderFactory.createHeader(user_id, date, platform_id, method_id);
            db.TransactionHeaders.Add(th);
            db.SaveChanges();
        }
        public static List<TransactionHeader> GetUserHeaders(int id)
        {
            return (from th in db.TransactionHeaders where th.user_id == id select th).ToList();
        }
        public static TransactionHeader FindById(int id)
        {
            return (from th in db.TransactionHeaders where th.Id == id select th).FirstOrDefault();
        }
        public static void removeHeader(TransactionHeader th)
        {
            db.TransactionHeaders.Remove(th);
            db.SaveChanges();
        }
        public static TransactionHeader GetHeaderByDateCustomer(string date, int user_id)
        {
            DateTime datetime = DateTime.Parse(date);
            return (from th in db.TransactionHeaders where th.transaction_date == datetime && th.user_id == user_id select th).FirstOrDefault();
        }
    }
}