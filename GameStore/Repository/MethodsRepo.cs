using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class MethodsRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static List<TransactionMethod> GetMethods()
        {
            return db.TransactionMethods.ToList();
        }
    }
}