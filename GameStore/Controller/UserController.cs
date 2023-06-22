using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace GameStore.Controller
{
    public class UserController
    {
        public static string RegistrationValidator(string first, string last, string email, string pass, string uname, string dob)
        {
            if(NameValidator(first) && NameValidator(last))
            {
                if (EmailValidator(email))
                {
                    if (PasswordValidator(pass))
                    {
                        if (UsernameValidator(uname))
                        {
                            if (DOBValidator(dob))
                            {
                                return null;
                            }
                            return "Incorrect format of Date of Birth";
                        }
                        return "Username must be unique and contain at least 6 characters";
                    }
                    return "Password must contain at least an uppercase letter and digit";
                }
                return "Incorrect email format";
            }
            return "First and last names must be filled and cannot contain a number";
        }
        public static string EditValidator(string first, string last, string email, string pass, string uname, string dob)
        {
            if ((NameValidator(first) && NameValidator(last)) || string.IsNullOrEmpty(first) || string.IsNullOrEmpty(last))
            {
                if (EmailValidator(email) || string.IsNullOrEmpty(email))
                {
                    if (PasswordValidator(pass) || string.IsNullOrEmpty(pass))
                    {
                        if (UsernameValidator(uname) || string.IsNullOrEmpty(uname))
                        {
                            if (DOBValidator(dob) || string.IsNullOrEmpty(dob))
                            {
                                return null;
                            }
                            return "Incorrect format of Date of Birth";
                        }
                        return "Username must be unique and contain at least 6 characters";
                    }
                    return "Password must contain at least an uppercase letter and digit";
                }
                return "Incorrect email format";
            }
            return "First and last names cannot contain a number";
        }
        public static Boolean NameValidator(string name)
        {
            if(name.Length <= 25 && !string.IsNullOrEmpty(name))
            {
                foreach(char a in name)
                {
                    if(!char.IsDigit(a) && !char.IsWhiteSpace(a))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        public static Boolean EmailValidator(string email)
        {
            bool emailIsValid = System.Text.RegularExpressions.Regex.IsMatch(email, @"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b");
            if (emailIsValid && !string.IsNullOrEmpty(email)) return true;
            return false;
        }
        public static Boolean PasswordValidator(string pass)
        {
            if (CheckUpper(pass) && CheckNumeric(pass)) return true;
            return false;
        }
        public static Boolean UsernameValidator(string uname)
        {
            User u = UserRepo.FindByUsername(uname);
            if(u == null && uname.Length >= 6)
            {
                return true;
            }
            return false;
        }
        public static Boolean CheckUpper(string str)
        {
            foreach (char a in str)
            {
                if (char.IsUpper(a)) return true;
            }
            return false;
        }
        public static Boolean CheckNumeric(string str)
        {
            foreach(char a in str)
            {
                if (char.IsNumber(a)) return true;
            }
            return false;
        }
        public static Boolean DOBValidator(string dob)
        {
            DateTime date;
            if (DateTime.TryParseExact(dob, "yyyy/MM/dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out date))
            {
                return true;
            }
            return false;
        }
    }
}