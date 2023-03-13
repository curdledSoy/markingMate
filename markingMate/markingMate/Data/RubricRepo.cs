using markingMate.Models;
using Microsoft.EntityFrameworkCore.ChangeTracking;
namespace markingMate.Data
{
    public class RubricRepo: IRubricRepo
    {
        private readonly rubricDBContext _dbContext;
        public RubricRepo(rubricDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public bool AddRubric(Rubric rubric)
        {
            _dbContext.Rubrics.Add(rubric);
            _dbContext.SaveChanges();
            return true;
        }


    }
}
