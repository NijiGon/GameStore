using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class GameFactory
    {
        public static Game createGame(int dev_id, string name, string desc, int price)
        {
            Game g = new Game();
            g.dev_id = dev_id;
            g.name = name;
            g.description = desc;
            g.price = price;
            return g;
        }
        public static void editGame(Game g, int dev_id, string name, string desc, int price)
        {
            g.dev_id = dev_id;
            g.name = name;
            g.description = desc;
            g.price = price;
        }
    }
}