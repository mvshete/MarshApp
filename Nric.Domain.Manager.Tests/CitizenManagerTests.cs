using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using Nric.Data.Interface;
using Nric.Domain.Model;
using System;
using System.Collections.Generic;

namespace Nric.Domain.Manager.Tests
{
    [TestClass]
    public class CitizenManagerTests
    {
        private List<Citizen> _citizens;

        private CitizenManager _sut;
        private Mock<ICitizenRepository> _mockCitizenRepository;

        [TestInitialize]
        public void SetUp()
        {
            _citizens = new List<Citizen>
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
                }
            };

            _mockCitizenRepository = new Mock<ICitizenRepository>();
            _sut = new CitizenManager(_mockCitizenRepository.Object);
        }

        [TestMethod]
        public void List_When_Called_Then_Returns_Result_AsExpected()
        {
            const int offset = 0;
            const int pageSize = 1;
            var searchTerm = string.Empty;

            _mockCitizenRepository.Setup(x => x.List(offset, pageSize, searchTerm)).Returns(_citizens);

            //Act
            var result = _sut.List(offset, pageSize, searchTerm);

            Assert.AreEqual(1, result.Count);
            Assert.AreEqual(1, result[0].Id);
            Assert.AreEqual(123456, result[0].NricId);
            Assert.AreEqual("FirstName", result[0].FirstName);
            Assert.AreEqual("MiddleName", result[0].MiddleName);
            Assert.AreEqual("LastName", result[0].LastName);
            Assert.AreEqual(new DateTime(2022, 1, 1), result[0].DateCreated);
            Assert.AreEqual(new DateTime(2022, 2, 2), result[0].DateLastActivated);
            Assert.AreEqual(new DateTime(2022, 3, 3), result[0].DateLastDeActivated);
            Assert.AreEqual(Status.New, result[0].Status);

            //Assert
            _mockCitizenRepository.Verify(x => x.List(offset, pageSize, searchTerm), Times.Once);
        }

        [TestMethod]
        public void Add_When_Called_Then_Call_Add_AsExpected()
        {
            var citizen = new Citizen
            {
                NricId = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName"
            };

            _mockCitizenRepository.Setup(x => x.Add(citizen)).Verifiable();

            //Act
            _sut.Add(citizen);

            //Assert
            _mockCitizenRepository.Verify(x => x.Add(citizen), Times.Once);
        }

        [TestMethod]
        public void Edit_When_Called_Then_Call_Edit_AsExpected()
        {
            var citizen = new Citizen
            {
                Id = 1,
                NricId = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName"
            };

            _mockCitizenRepository.Setup(x => x.Edit(citizen)).Verifiable();

            //Act
            _sut.Edit(citizen);

            //Assert
            _mockCitizenRepository.Verify(x => x.Edit(citizen), Times.Once);
        }

        [TestMethod]
        public void GetById_When_Called_Then_Returns_CorrectCitizen()
        {
            const int citizenId = 1;
            var citizen = new Citizen
            {
                Id = 1,
                NricId = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName",
                DateCreated = new DateTime(2022, 1, 1),
                DateLastActivated = new DateTime(2022, 2, 2),
                DateLastDeActivated = new DateTime(2022, 3, 3)
            };

            _mockCitizenRepository.Setup(x => x.GetById(citizenId)).Returns(citizen);

            //Act
            var result = _sut.GetById(citizenId);

            Assert.AreEqual(1, result.Id);
            Assert.AreEqual(123456, result.NricId);
            Assert.AreEqual("FirstName", result.FirstName);
            Assert.AreEqual("MiddleName", result.MiddleName);
            Assert.AreEqual("LastName", result.LastName);
            Assert.AreEqual(new DateTime(2022, 1, 1), result.DateCreated);
            Assert.AreEqual(new DateTime(2022, 2, 2), result.DateLastActivated);
            Assert.AreEqual(new DateTime(2022, 3, 3), result.DateLastDeActivated);

            _mockCitizenRepository.Verify(x => x.GetById(citizenId), Times.Once);
        }

        [TestMethod]
        public void SetSubscriptionStatus_When_Called_Then_Call_SetSubscriptionStatus_AsExpected()
        {
            var citizenIds = new List<int> {1, 2, 3, 4, 5};
            const bool status = true;

            _mockCitizenRepository.Setup(x => x.SetSubscriptionStatus(citizenIds,status)).Verifiable();

            //Act
            _sut.SetSubscriptionStatus(citizenIds,status);

            //Assert
            _mockCitizenRepository.Verify(x => x.SetSubscriptionStatus(citizenIds, status), Times.Once);
        }

        [DataTestMethod]
        [DataRow(true)]
        [DataRow(false)]
        public void DoesCitizenAlreadyExist_When_Called_Then_Returns_Result_AsExpected(bool expectedResult)
        {
            var citizen = new Citizen
            {
                Id = 1,
                NricId = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName"
            };

            _mockCitizenRepository.Setup(x => x.DoesCitizenAlreadyExist(citizen)).Returns(expectedResult);
            //Act
            var result = _sut.DoesCitizenAlreadyExist(citizen);

            Assert.AreEqual(expectedResult, result);
            //Assert
            _mockCitizenRepository.Verify(x => x.DoesCitizenAlreadyExist(citizen), Times.Once);
        }
    }
}
