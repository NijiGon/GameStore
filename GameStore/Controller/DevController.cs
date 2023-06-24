using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace GameStore.Controller
{
    public class DevController
    {
        public static string DevValidator(string name, string image, string desc)
        {
            Developer d = DevRepo.FindByName(name);
            if (d == null)
            {
                if (checkExtension(image))
                {
                    if(desc.Length < 255)
                    {
                        return null;
                    }
                    return "Description cannot contain more than 255 letters";
                }
                return "File extension must be .png, .jpg, .jpeg, or .jfif";   
            }
            return "Developer name must be unique";
        }
        public static Boolean checkExtension(string image)
        {
            string extension = Path.GetExtension(image);
            if (extension == ".png" || extension == ".jpg" || extension == ".jpeg" || extension == ".jfif")
            {
                return true;
            }
            return false;
        }
    }
}