using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace DotNetCoreMySQL.Models
{
    public partial class Lead
    {
        public long Id { get; set; }
        public string? FullName { get; set; }
        public string? CieName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? ProjectName { get; set; }
        public string? ProjectDescription { get; set; }
        public string? DepartmentInCharge { get; set; }
        public string? Message { get; set; }
        public byte[]? AttachedFiles { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
