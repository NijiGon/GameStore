//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GameStore.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Developer
    {
        public int Id { get; set; }
        public string name { get; set; }
        public string image { get; set; }
        public string description { get; set; }
    
        public virtual Game Game { get; set; }
    }
}