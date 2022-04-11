using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
namespace DotNetCoreMySQL.Models
{
    public partial class pierrerolenscheridorContext : DbContext
    {
        public pierrerolenscheridorContext()
        {
        }

        public pierrerolenscheridorContext(DbContextOptions<pierrerolenscheridorContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Adress> Adresses { get; set; } = null!;

        public virtual DbSet<Battery> Batteries { get; set; } = null!;
        public virtual DbSet<Building> Buildings { get; set; } = null!;
        public virtual DbSet<Column> Columns { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<Detailsbuilding> Detailsbuildings { get; set; } = null!;
        public virtual DbSet<Elevator> Elevators { get; set; } = null!;
        public virtual DbSet<Employee> Employees { get; set; } = null!;
        public virtual DbSet<Intervention> Interventions { get; set; } = null!;
        public virtual DbSet<Lead> Leads { get; set; } = null!;
        public virtual DbSet<Map> Maps { get; set; } = null!;
        public virtual DbSet<Quote> Quotes { get; set; } = null!;

        public virtual DbSet<User> Users { get; set; } = null!;

    }
}
