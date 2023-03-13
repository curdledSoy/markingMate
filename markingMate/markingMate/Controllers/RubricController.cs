using Microsoft.AspNetCore.Mvc;
using markingMate.Data;
using markingMate.Models;
namespace markingMate.Controllers
{
    [ApiController]
    [Route("api")]
    public class RubricController : ControllerBase
    {
        
        private readonly IRubricRepo _repo;
        private readonly ILogger<RubricController> _logger;

        public RubricController(ILogger<RubricController> logger, IRubricRepo repo)
        {
            _logger = logger;
            _repo = repo;
        }

        [HttpGet("Version")]
        public String GetVersion()
        {
            return "1.0.0";
            
        }
        [HttpPost("AddRubric")]
        public ActionResult AddRubric(Rubric rubric)
        {
            if (_repo.AddRubric(rubric))
            {
                return Ok("Success");
            }
            else
            {
                return BadRequest("Failure");
            }
        }
    }
}