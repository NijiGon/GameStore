﻿using GameStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Repository
{
    public class HeaderRepo
    {
        static DatabaseEntities db = DatabaseSingleton.GetInstance();
    }
}