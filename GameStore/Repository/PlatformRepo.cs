using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class PlatformRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();

        public static List<Platform> GetPlatforms()
        {
            return db.Platforms.ToList();
        }
    }
}