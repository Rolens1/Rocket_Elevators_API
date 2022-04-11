#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DotNetCoreMySQL.Models;

namespace TodoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InterventionController : ControllerBase
    {
        private readonly pierrerolenscheridorContext _context;

        public InterventionController(pierrerolenscheridorContext context)
        {
            _context = context;
        }

        // GET: api/Intervention
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Intervention>>> GetInterventions()
        {
            return await _context.Interventions.ToListAsync();
        }
        
        // GET: api/Intervention/5
        [HttpGet("{status}")]
        public async Task<ActionResult<Intervention>> GetInterventionStatus(string status)
        {
            var intervention = await _context.Interventions.FindAsync(status);

            if (intervention == null)
            {
                return NotFound();
            }
            if (status != intervention.Status)
            {
                return BadRequest();
            }
            if (intervention.Status == "InProgress")
            {
                intervention.StartDateIntervention = DateTime.Now;
            }
            else if (intervention.Status == "Completed")
            {
                intervention.EndDateIntervention = DateTime.Now;
            }

            return intervention;
        }
    }
}
