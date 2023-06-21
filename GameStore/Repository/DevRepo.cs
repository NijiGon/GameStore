﻿using GameStore.Model;
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