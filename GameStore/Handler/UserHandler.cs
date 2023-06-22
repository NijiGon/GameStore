using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Handler
{
    public class UserHandler
    {
        public static void deleteUser(int id)
        {
            User delete = UserRepo.FindById(id);
            if (delete == null)
            {
                return;
            }
            List<TransactionHeader> deleteList = HeaderRepo.GetUserHeaders(id);

            foreach (var deleted in deleteList)
            {
                TransactionHandler.deleteHeader(deleted.Id);
            }
            UserRepo.removeUser(delete);
        }
    }
}