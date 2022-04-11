using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Elevator
    {
        public long Id { get; set; }
        public string? SerialNumber { get; set; }
        public string? Model { get; set; }
        public string? Type { get; set; }
        public string? Status { get; set; }
        public string? DateOfCommissioning { get; set; }
        public string? DateOfLastInspection { get; set; }
        public string? CertificateOfInspection { get; set; }
        public string? Information { get; set; }
        public string? Notes { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public long? ColumnId { get; set; }

        public virtual Column? Column { get; set; }
    }
}
