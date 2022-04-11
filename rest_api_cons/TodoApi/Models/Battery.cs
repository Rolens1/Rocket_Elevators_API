using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Battery
    {
        public Battery()
        {
            Columns = new HashSet<Column>();
        }

        public long Id { get; set; }
        public string? Status { get; set; }
        public DateOnly? DateOfCommissioning { get; set; }
        public DateOnly? DateOfLastInspection { get; set; }
        public string? CertificateOfOperations { get; set; }
        public string? Information { get; set; }
        public string? Notes { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public long? BuildingId { get; set; }
        public long? EmployeeId { get; set; }

        public virtual Building? Building { get; set; }
        public virtual ICollection<Column> Columns { get; set; }
    }
}
