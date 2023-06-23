using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GameStore.Factory;

namespace GameStore.Repository
{
    public class DevRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static void addDev(string name, string image, string desc)
        {
            Developer d = DevFactory.createDev(name, image, desc);
            db.Developers.Add(d);
            db.SaveChanges();

        }
        public static void updateDev(Developer d, string name, string image, string desc)
        {
            DevFactory.editDev(d, name, image, desc);
            db.SaveChanges();
        }
        public static Developer FindByName(string name)
        {
            return (from d in db.Developers where d.name == name select d).FirstOrDefault();
        }
        public static Developer FindById(int id)
        {
            return (from d in db.Developers where d.Id == id select d).FirstOrDefault();
        }
        public static List<Developer> GetDevelopers()
        {
            return db.Developers.ToList();
        }
        public static void removeDev(Developer d)
        {
            db.Developers.Remove(d);
            db.SaveChanges();
        }
    }
}