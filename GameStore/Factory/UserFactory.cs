using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Factory
{
    public class UserFactory
    {
        public static User createUser(string first, string last, string email, string password, string username, string dob)
        {
            User u = new User();
            u.first_name = first;
            u.last_name = last;
            u.email = email;
            u.password = password;
            u.username = username;
            u.dob = DateTime.Parse(dob);
            return u;
        }
        public static void editUser(User u, string first, string last, string email, string password, string username, string dob)
        {
            u.first_name = first;
            u.last_name = last;
            u.email = email;
            u.password = password;
            u.username = username;
            u.dob = DateTime.Parse(dob);
        }
    }
}