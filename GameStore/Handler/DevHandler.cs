using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Handler
{
    public class DevHandler
    {
        public static void deleteDev(int id)
        {
            Developer delete = DevRepo.FindById(id);
            if (delete == null)
            {
                return;
            }

            List<Game> deleteList = GameRepo.GetGamesByDev(id);

            foreach (var deleted in deleteList)
            {
                GameHandler.deleteGame(deleted.Id);
            }
            DevRepo.removeDev(delete);
        }
    }
}