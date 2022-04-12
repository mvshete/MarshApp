using Nric.Data.Interface;
using Nric.Domain.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Nric.Data.Repository
{
    public class CitizenRepository : ICitizenRepository
    {
        private readonly IDatabase _database;

        private const string GetCitizenById = "dbo.usp_GetCitizenById";
        private const string AddCitizen = "dbo.usp_AddCitizen";
        private const string CitizenAlreadyExistCheck = "dbo.usp_DoesCitizenAlreadyExist";
        private const string GetAllPaginated = "dbo.usp_ListPaginated";
        private const string SetCitizenSubscription = "dbo.usp_SetCitizenSubscription";
        private const string UpdateCitizen = "dbo.usp_UpdateCitizen";

        public CitizenRepository(IDatabase database)
        {
            _database = database ?? throw new ArgumentNullException("database");
        }

        public List<Citizen> List(int offset, int pageSize, string searchTerm)
        {
            var parameters = new[]
            {
                new SqlParameter("@OffsetValue", offset),
                new SqlParameter("@PagingSize", pageSize),
                new SqlParameter("@SearchTerm", string.IsNullOrWhiteSpace(searchTerm)? string.Empty: searchTerm)
            };

            return _database.List<Citizen>(GetAllPaginated, parameters);
        }

        public void Add(Citizen citizen)
        {
            var parameters = new[]
            {
                new SqlParameter("@NricId", citizen.NricId),
                new SqlParameter("@FirstName", citizen.FirstName),
                new SqlParameter("@MiddleName", citizen.MiddleName),
                new SqlParameter("@LastName", citizen.LastName)
            };

            _database.Save(AddCitizen, parameters);
        }

        public void Edit(Citizen citizenToUpdate)
        {
            var parameters = new[]
            {
                new SqlParameter("@Id", citizenToUpdate.Id),
                new SqlParameter("@NricId", citizenToUpdate.NricId),
                new SqlParameter("@FirstName", citizenToUpdate.FirstName),
                new SqlParameter("@MiddleName", citizenToUpdate.MiddleName),
                new SqlParameter("@LastName", citizenToUpdate.LastName)
            };

            _database.Update(UpdateCitizen, parameters);
        }

        public Citizen GetById(int citizenId)
        {
            var parameters = new[]
            {
                new SqlParameter("@Id", citizenId)
            };

            return _database.GetById<Citizen>(GetCitizenById, parameters);
        }

        public void SetSubscriptionStatus(IReadOnlyCollection<int> ids, bool status)
        {
            var parameters = new[]
            {
                new SqlParameter("@Ids", string.Join(",",ids)),
                new SqlParameter("@SubscriptionStatus", status? 1:2)
            };

            _database.Update(SetCitizenSubscription, parameters);
        }

        public bool DoesCitizenAlreadyExist(Citizen citizenToCheck)
        {
            var parameters = new[]
            {
                new SqlParameter("@Id", citizenToCheck.Id),
                new SqlParameter("@NricId", citizenToCheck.NricId),
                new SqlParameter("@FirstName", citizenToCheck.FirstName),
                new SqlParameter("@MiddleName", citizenToCheck.MiddleName),
                new SqlParameter("@LastName", citizenToCheck.LastName)
            };

            return _database.IsEntryAlreadyExist(CitizenAlreadyExistCheck, parameters);
        }

    }
}