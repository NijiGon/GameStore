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
                    if (DevController.checkExtension(image))
                    {
                        return null;
                    }
                    return "File extension must be .png, .jpg, .jpeg, or .jfif";
                }
                return "Description must be smaller than 255 characters";
            }
            return "Game name must be smaller than 50 characters";
        }
    }
}