using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Column
    {
        public Column()
        {
            Elevators = new HashSet<Elevator>();
        }

        public long Id { get; set; }
        public string? SetType { get; set; }
        public int? NbOfFloorsServed { get; set; }
        public string? Status { get; set; }
        public string? Information { get; set; }
        public string? Notes { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public long? BatteryId { get; set; }

        public virtual Battery? Battery { get; set; }
        public virtual ICollection<Elevator> Elevators { get; set; }
    }
}
