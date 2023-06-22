using GameStore.Factory;
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

        public static void addUser(string first, string last, string email, string password, string username, string dob)
        {
            User u = UserFactory.createUser(first, last, email, password, username, dob);
            db.Users.Add(u);
            db.SaveChanges();
        }
        public static void editProfile(int id, string first, string last, string email, string password, string username, string dob)
        {
            User u = UserRepo.FindById(id);
            UserFactory.editUser(u, first, last, email, password, username, dob);
            db.SaveChanges();
        }
        public static User FindByUsername(string uname)
        {
            return (from u in db.Users where u.username == uname select u).FirstOrDefault();
        }
        public static User FindById(int id)
        {
            return (from u in db.Users where u.Id == id select u).FirstOrDefault();
        }
        public static User FindByEmail(string email)
        {
            return (from u in db.Users where u.email == email select u).FirstOrDefault();
        }
        public static User FindUser(string email, string pass)
        {
            return (from u in db.Users where u.email == email && u.password == pass select u).FirstOrDefault();
        }
        public static void removeUser(User u)
        {
            db.Users.Remove(u);
            db.SaveChanges();
        }
    }
}