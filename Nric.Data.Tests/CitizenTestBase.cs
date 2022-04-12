using Nric.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nric.Data.Tests
{
    public class CitizenTestBase
    {
        protected List<Citizen> citizenList;

        public virtual void SetUp()
        {
            citizenList = new List<Citizen>
            {
                new Citizen
                {
                    Id = 1,
                    NricId = 123456,
                    FirstName = "FirstName",
                    MiddleName = "MiddleName",
                    LastName = "LastName",
                    DateCreated = new DateTime(2022, 1, 1),
                    DateLastActivated = new DateTime(2022, 2, 2),
                    DateLastDeActivated = new DateTime(2022, 3, 3),
                    Status = Status.New
                },

                new Citizen
                {
                    Id =2 ,
                    NricId = 123457,
                    FirstName ="Akshay",
                    MiddleName = "K",
                    LastName = "Jain",
                    DateCreated = DateTime.Now,
                    DateLastActivated = DateTime.Now,
                    DateLastDeActivated = DateTime.Now,
                    Status = Status.New
                },
                new Citizen
                {
                    Id =1 ,
                    NricId = 123458,
                    FirstName ="john",
                    MiddleName = "K",
                    LastName = "Smith",
                    DateCreated = DateTime.Now,
                    DateLastActivated = DateTime.Now,
                    DateLastDeActivated = DateTime.Now,
                    Status = Status.New
                }
            };
        }
    }
}
