//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FernAndFallowWebsite.App_Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class WishListItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string QuantityRequest { get; set; }
        public string UnitCost { get; set; }
        public string SubTotal { get; set; }
        public int WishListId { get; set; }
    
        public virtual WishList WishList { get; set; }
    }
}
