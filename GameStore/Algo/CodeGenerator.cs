using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace GameStore.Algo
{
    public class CodeGenerator
    {
        private static Random random = new Random();
        public static string GenerateRandomString()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder sb = new StringBuilder();

            
            for (int i = 0; i < 12; i++)
            {
                if (i > 0 && i % 4 == 0)
                    sb.Append("-");

                sb.Append(chars[random.Next(chars.Length)]);
            }

            return sb.ToString();
        }
    }
}