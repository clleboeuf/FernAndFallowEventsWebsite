namespace FernAndFallowWebsite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Quantity { get; set; }

        [Required]
        public string Price { get; set; }

        public int ProductCategoriesId { get; set; }

        public byte[] Image { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}
