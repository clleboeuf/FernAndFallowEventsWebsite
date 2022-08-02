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

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Guest> Guests { get; set; }
        public virtual DbSet<ProductCategory> ProductCatergories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Quote> Quotes { get; set; }
        public virtual DbSet<WishListItem> WishListItems { get; set; }
        public virtual DbSet<WishList> WishLists { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .HasMany(e => e.Quotes)
                .WithRequired(e => e.Admin)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Quotes)
                .WithRequired(e => e.Customer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.ProductCatergory)
                .HasForeignKey(e => e.ProductCatergoriesId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<WishListItem>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.WishListItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<WishList>()
                .HasMany(e => e.Customers)
                .WithRequired(e => e.WishList)
                .HasForeignKey(e => e.WishList_Id)
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

        public System.Data.Entity.DbSet<FernAndFallowWebsite.Models.SendEmailViewModel> SendEmailViewModels { get; set; }
    }
}
