using System.ComponentModel;
using Nric.Domain.Model;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Nric.Application.ViewModel
{
    [DataContract]
    public class CitizenViewModel
    {
        private const string Expression = @"^\d{6}$";

        public int Id { get; set; }

        [Required]
        [DisplayName("Nric Number")]
        [RegularExpression(Expression, ErrorMessage = "Enter six digit number")]
        public int Nric { get; set; }

        [Required]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [Required]
        [DisplayName("Middle Name")]
        public string MiddleName { get; set; }

        [Required]
        [DisplayName("Last Name")]
        public string LastName { get; set; }

        public Status Status { get; set; }
    }
}