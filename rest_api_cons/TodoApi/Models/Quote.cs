using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Quote
    {
        public long Id { get; set; }
        public string? BuildingType { get; set; }
        public string? ProductLine { get; set; }
        public int? NoOfApartments { get; set; }
        public int? NoOfFloors { get; set; }
        public int? NoOfBasements { get; set; }
        public int? NoOfBusinesses { get; set; }
        public int? NoOfParkingSpaces { get; set; }
        public int? NoOfElevatorCages { get; set; }
        public int? MaxOfOccupantsPerFloor { get; set; }
        public int? NoOfHoursOfActivities { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int? NoOfElevatorsNeeded { get; set; }
        public int? UnitPrice { get; set; }
        public int? TotalPriceOfElevators { get; set; }
        public int? InstallationFees { get; set; }
        public int? FinalPrice { get; set; }
        public string? CompanyName { get; set; }
        public string? Email { get; set; }
        public string? FullName { get; set; }
        public string? Phone { get; set; }
        public string? Department { get; set; }
        public string? ProjectName { get; set; }
        public string? ProjectDesc { get; set; }
        public string? Message { get; set; }
        public bool? Processed { get; set; }
    }
}
