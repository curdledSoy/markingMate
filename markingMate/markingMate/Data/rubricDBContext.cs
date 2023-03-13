using Microsoft.EntityFrameworkCore;
using markingMate.Models;
namespace markingMate.Data
{
    public class rubricDBContext: DbContext
    {
        public rubricDBContext(DbContextOptions<rubricDBContext> options) : base(options) { }

        public DbSet<Rubric> Rubrics { get; set; }



    }
}
