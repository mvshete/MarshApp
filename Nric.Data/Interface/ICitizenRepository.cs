using Nric.Domain.Model;
using System.Collections.Generic;

namespace Nric.Data.Interface
{
    public interface ICitizenRepository
    {
        List<Citizen> List(int offset, int pageSize, string searchTerm);
        void Add(Citizen citizen);
        void Edit(Citizen citizenToUpdate);
        Citizen GetById(int citizenId);
        void SetSubscriptionStatus(IReadOnlyCollection<int> ids, bool status);
        bool DoesCitizenAlreadyExist(Citizen citizenToCheck);
    }
}