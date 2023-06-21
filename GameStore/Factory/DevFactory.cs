using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class DevFactory
    {
        public static Developer createDev(string name, string image, string desc)
        {
            Developer d = new Developer();
            d.name = name;
            d.image = image;
            d.description = desc;
            return d;
        }
        public static void editDev(Developer d, string name, string image, string desc)
        {
            d.name = name;
            d.image = image;
            d.description = desc;
        }
    }
}