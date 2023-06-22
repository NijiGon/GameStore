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
        public static string AlbumValidator(string name, string description, int price, int stock, string image, int size)
        {
            if (name.Length < 50)
            {
                if (description.Length < 255)
                {
                    if (price >= 100000 && price <= 1000000)
                    {
                        if (stock > 0)
                        {
                            int mbsize = (size / (1024 * 1024));
                            if (mbsize < 2)
                            {
                                if (DevController.checkExtension(image))
                                {
                                    return null;
                                }
                                return "File extension must be .png, .jpg, .jpeg, or .jfif";
                            }
                            return "File size must be lower than 2MB";
                        }
                        return "Stock must be more than 0";
                    }
                    return "Price must be between 100000 and 1000000";
                }
                return "Description must be smaller than 255 characters";
            }
            return "Album name must be smaller than 50 characters";
        }
    }
}