using Nric.Data.Interface;
using Nric.Domain.Interface;
using Nric.Domain.Model;
using System.Collections.Generic;


namespace Nric.Domain.Manager
{
    public class CitizenManager : ICitizenManager
    {
        private readonly ICitizenRepository _citizenRepository;

        public CitizenManager(ICitizenRepository citizenRepository)
        {
            _citizenRepository = citizenRepository;
        }

        public List<Citizen> List(int offset, int pageSize, string searchTerm)
        {
            return _citizenRepository.List(offset, pageSize, searchTerm);
        }

        public void Add(Citizen citizenToSave)
        {
            _citizenRepository.Add(citizenToSave);
        }

        public Citizen GetById(int citizenId)
        {
            return _citizenRepository.GetById(citizenId);
        }

        public void SetSubscriptionStatus(IReadOnlyCollection<int> ids, bool status)
        {
            _citizenRepository.SetSubscriptionStatus(ids, status);
        }

        public bool DoesCitizenAlreadyExist(Citizen citizenToCheck)
        {
            return _citizenRepository.DoesCitizenAlreadyExist(citizenToCheck);
        }

        public void Edit(Citizen citizenToUpdate)
        {
            _citizenRepository.Edit(citizenToUpdate);
        }
    }
}
