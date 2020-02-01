namespace AdamsModel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AdamsModel : DbContext
    {
        public AdamsModel()
            : base("name=AdamsModel")
        {
        }

        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<HairAndBeautySalon> HairAndBeautySalons { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<HairAndBeautySalon>()
                .HasMany(e => e.Employees)
                .WithRequired(e => e.HairAndBeautySalon)
                .WillCascadeOnDelete(false);
        }
    }
}
