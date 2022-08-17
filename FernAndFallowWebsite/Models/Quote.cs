namespace FernAndFallowWebsite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Quote
    {
        public int Id { get; set; }

        [Required]
        public string Location { get; set; }

        [Required]
        public string Date { get; set; }

        [Required]
        public string Description { get; set; }
        public virtual WishList WishList { get; set; }

    }
}
