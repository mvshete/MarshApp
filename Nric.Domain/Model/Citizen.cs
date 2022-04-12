using System;

namespace Nric.Domain.Model
{
    public class Citizen
    {
        public int Id { get; set; }
        public int NricId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateLastActivated { get; set; }
        public DateTime DateLastDeActivated { get; set; }
        public Status Status { get; set; }
        public int TotalRecords { get; set; }
    }
}
