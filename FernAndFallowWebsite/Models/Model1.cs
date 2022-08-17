using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace FernAndFallowWebsite.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Quote> Quotes { get; set; }
        public virtual DbSet<WishListItem> WishListItems { get; set; }
        public virtual DbSet<WishList> WishLists { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.ProductCategory)
                .HasForeignKey(e => e.ProductCategoriesId)
                .WillCascadeOnDelete(false);


            modelBuilder.Entity<WishList>()
                .HasMany(e => e.Quotes)
                .WithRequired(e => e.WishList)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<WishList>()
                .HasMany(e => e.WishListItems)
                .WithRequired(e => e.WishList)
                .WillCascadeOnDelete(false);
        }

        public System.Data.Entity.DbSet<FernAndFallowWebsite.Controllers.RoleViewModel> RoleViewModels { get; set; }
    }
}
