using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Building
    {
        public Building()
        {
            Batteries = new HashSet<Battery>();
            Detailsbuildings = new HashSet<Detailsbuilding>();
        }

        public long Id { get; set; }
        public string? FullNameOfTheBuildingAdministrator { get; set; }
        public string? EmailOfTheAdministratorOfTheBuilding { get; set; }
        public string? PhoneNumberOfTheBuildingAdministrator { get; set; }
        public string? FullNameOfTheTechnicalContactForTheBuilding { get; set; }
        public string? TechnicalContactEmailForTheBuilding { get; set; }
        public string? TechnicalContactPhoneForTheBuilding { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public long? CustomerId { get; set; }
        public long? AdressId { get; set; }
        public int? NoOfFloors { get; set; }

        public virtual Adress? Adress { get; set; }
        public virtual Customer? Customer { get; set; }
        public virtual ICollection<Battery> Batteries { get; set; }
        public virtual ICollection<Detailsbuilding> Detailsbuildings { get; set; }
    }
}
