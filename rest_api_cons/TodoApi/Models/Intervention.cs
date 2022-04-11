using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Intervention
    {
        public long Id { get; set; }
        [JsonIgnore]
        public int? Author { get; set; }
        [JsonIgnore]
        public int? CustomerId { get; set; }
        [JsonIgnore]
        public int? BuildingId { get; set; }
        [JsonIgnore]
        public int? BatteryId { get; set; }
        [JsonIgnore]
        public int? ColumnId { get; set; }
        [JsonIgnore]
        public int? ElevatorId { get; set; }
        [JsonIgnore]
        public int? EmployeeId { get; set; }
        public DateTime? StartDateIntervention { get; set; }
        public DateTime? EndDateIntervention { get; set; }
        [JsonIgnore]

         public string? Result { get; set; }
        [JsonIgnore]
        public string? Report { get; set; }
        public string? Status { get; set; }
        [JsonIgnore]
        public DateTime CreatedAt { get; set; }
        [JsonIgnore]
        public DateTime UpdatedAt { get; set; }
    }
}
