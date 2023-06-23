using GameStore.Model;
using GameStore.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace GameStore.Controller
{
    public class GameController
    {
        public static string GameValidator(string name, string description, int price, string image)
        {
            if (name.Length < 50)
            {
                if (description.Length < 255)
                {
                    if (price >= 100000 && price <= 1000000)
                    {
                        if (DevController.checkExtension(image))
                        {
                            return null;
                        }
                        return "File extension must be .png, .jpg, .jpeg, or .jfif";
                    }
                    return "Price must be between 100000 and 1000000";
                }
                return "Description must be smaller than 255 characters";
            }
            return "Album name must be smaller than 50 characters";
        }
        public static string EditValidator(string name, string description, int? price, string image)
        {
            if (name.Length < 50 || !string.IsNullOrEmpty(name))
            {
                if (description.Length < 255 || !string.IsNullOrEmpty(image))
                {
                    if (price >= 100000 && price <= 1000000 || price == null)
                    {
                        if (DevController.checkExtension(image) || !string.IsNullOrEmpty(image))
                        {
                            return null;
                        }
                        return "File extension must be .png, .jpg, .jpeg, or .jfif";
                    }
                    return "Price must be between 100000 and 1000000";
                }
                return "Description must be smaller than 255 characters";
            }
            return "Album name must be smaller than 50 characters";
        }
    }
}