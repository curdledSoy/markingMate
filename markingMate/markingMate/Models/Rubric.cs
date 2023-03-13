using System.ComponentModel.DataAnnotations;
namespace markingMate.Models
{
    public class Rubric
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Author { get; set; }

    }
}
