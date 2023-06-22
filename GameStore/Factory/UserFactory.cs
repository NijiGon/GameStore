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
            u.role = u.email.Contains("@admin") == true ? "admin" : "customer";
            return u;
        }
        public static void editUser(User u, string first, string last, string email, string password, string username, string dob)
        {
            if (!string.IsNullOrEmpty(first)) u.first_name = first;
            if (!string.IsNullOrEmpty(last)) u.last_name = last;
            if (!string.IsNullOrEmpty(email)) u.email = email;
            if (!string.IsNullOrEmpty(password)) u.password = password;
            if (!string.IsNullOrEmpty(username)) u.username = username;
            if (!string.IsNullOrEmpty(email)) u.role = u.email.Contains("@admin") == true ? "admin" : "customer";
            if (!string.IsNullOrEmpty(dob)) u.dob = DateTime.Parse(dob);
        }
    }
}