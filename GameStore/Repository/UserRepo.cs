using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class UserRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static User FindByUsername(string uname)
        {
            return (from u in db.Users where u.username == uname select u).FirstOrDefault();
        }
        public static User FindByEmail(string email)
        {
            return (from u in db.Users where u.email == email select u).FirstOrDefault();
        }
    }
}