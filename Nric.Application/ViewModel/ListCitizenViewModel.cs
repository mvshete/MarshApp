using System.Collections.Generic;
using Nric.Application.Helper;
using Nric.Domain.Model;

namespace Nric.Application.ViewModel
{
    public class ListCitizenViewModel
    {
        public List<Citizen> Citizens { get; set; }
        public bool Selected { get; set; }
        public Pager Pager { get;set; }
    }
}