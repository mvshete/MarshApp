using Nric.Domain.Model;
using System.Collections.Generic;

namespace Nric.Domain.Interface
{
    public interface ICitizenManager
    {
        void Add(Citizen citizenToSave);
        void Edit(Citizen citizenToUpdate);
        List<Citizen> List(int offset, int pageSize, string searchTerm);
        Citizen GetById(int citizenId);
        void SetSubscriptionStatus(IReadOnlyCollection<int> ids, bool status);
        bool DoesCitizenAlreadyExist(Citizen citizenToCheck);
    }
}