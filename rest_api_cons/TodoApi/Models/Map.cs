using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Map
    {
        public long Id { get; set; }
        public string? LocationOfTheBuilding { get; set; }
        public int? NoOfFloorsInTheBuilding { get; set; }
        public string? ClientName { get; set; }
        public int? NoOfBatteries { get; set; }
        public int? NoOfColumns { get; set; }
        public int? NoOfElevators { get; set; }
        public string? FullNameOfTechnicalContact { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string? Latitude { get; set; }
        public string? Longitude { get; set; }
    }
}
