using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Buildings = new HashSet<Building>();
        }

        public long Id { get; set; }
        public string? CustomersCreationDate { get; set; }
        public string? CompanyName { get; set; }
        public string? FullNameOfTheCompanyContact { get; set; }
        public string? CompanyContactPhone { get; set; }
        public string? EmailOfTheCompanyContact { get; set; }
        public string? CompanyDescription { get; set; }
        public string? FullNameOfServiveTechnicalAuthority { get; set; }
        public string? TechnicalManagerEmailForServive { get; set; }
        public string? TechnicalManagerEmailForService { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public long? UserId { get; set; }
        public long? AdressId { get; set; }

        public virtual Adress? Adress { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<Building> Buildings { get; set; }
    }
}
