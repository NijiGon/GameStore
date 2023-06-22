using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Handler
{
    public class TransactionHandler
    {
        public static void deleteHeader(int id)
        {
            TransactionHeader delete = HeaderRepo.FindById(id);
            if (delete == null)
            {
                return;
            }

            List<TransactionDetail> deleteList = DetailRepo.GetDetailsByHeader(delete.Id);

            foreach (var deleted in deleteList)
            {
                DetailRepo.removeDetail(deleted);
            }
            HeaderRepo.removeHeader(delete);
        }
        
        public static int createTransaction(string date, int user_id, int platform_id, int method_id)
        {
            TransactionHeader th = HeaderRepo.GetHeaderByDateCustomer(date, user_id);
            if (th == null) HeaderRepo.addHeader(user_id, date, platform_id, method_id);
            return HeaderRepo.GetHeaderByDateCustomer(date, user_id).Id;
        }
    }
}