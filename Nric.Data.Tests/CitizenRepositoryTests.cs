using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using Nric.Data.Interface;
using Nric.Data.Repository;
using Nric.Domain.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Nric.Data.Tests
{
    [TestClass]
    public class CitizenRepositoryTests : CitizenTestBase
    {
        private CitizenRepository _sut;
        private Mock<IDatabase> _mockDatabase;

        [TestInitialize]
        public override void SetUp()
        {
            base.SetUp();

            _mockDatabase = new Mock<IDatabase>();
            _sut = new CitizenRepository(_mockDatabase.Object);
        }

        [TestMethod]
        public void List_When_Called_Then_Returns_Result_AsExpected()
        {
            _mockDatabase.Setup(x => x.List<Citizen>(It.IsAny<string>(), It.IsAny<SqlParameter[]>()))
                .Returns(citizenList);

            //Act
            var result = _sut.List(0, 1, string.Empty);

            Assert.AreEqual(3, result.Count);
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
            _mockDatabase.Verify(x => x.List<Citizen>(It.IsAny<string>(), It.IsAny<SqlParameter[]>()), Times.Once);
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

            _mockDatabase.Setup(x => x.Save(It.IsAny<string>(), It.IsAny<SqlParameter[]>())).Verifiable();

            //Act
            _sut.Add(citizen);

            //Assert
            _mockDatabase.Verify(x => x.Save(It.IsAny<string>(), It.IsAny<SqlParameter[]>()), Times.Once);
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

            _mockDatabase.Setup(x => x.Update(It.IsAny<string>(), It.IsAny<SqlParameter[]>())).Verifiable();

            //Act
            _sut.Edit(citizen);

            //Assert
            _mockDatabase.Verify(x => x.Update(It.IsAny<string>(), It.IsAny<SqlParameter[]>()), Times.Once);
        }

        [TestMethod]
        public void GetById_When_Called_Then_Returns_CorrectCitizen()
        {
            var citizenId = 1;
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

            _mockDatabase.Setup(x => x.GetById<Citizen>(It.IsAny<string>(), It.IsAny<SqlParameter[]>()))
                .Returns(citizen);

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

            _mockDatabase.Verify(x => x.GetById<Citizen>(It.IsAny<string>(), It.IsAny<SqlParameter[]>()), Times.Once);
        }

        [TestMethod]
        public void SetSubscriptionStatus_When_Called_Then_Call_SetSubscriptionStatus_AsExpected()
        {
            _mockDatabase.Setup(x => x.Update(It.IsAny<string>(), It.IsAny<SqlParameter[]>())).Verifiable();

            //Act
            _sut.SetSubscriptionStatus(new List<int>() { 1, 2, 3, 4, 5 }, true);

            //Assert
            _mockDatabase.Verify(x => x.Update(It.IsAny<string>(), It.IsAny<SqlParameter[]>()), Times.Once);
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

            _mockDatabase.Setup(x => x.IsEntryAlreadyExist(It.IsAny<string>(), It.IsAny<SqlParameter[]>()))
                .Returns(expectedResult);
            //Act
            var result = _sut.DoesCitizenAlreadyExist(citizen);

            Assert.AreEqual(expectedResult, result);
            //Assert
            _mockDatabase.Verify(x => x.IsEntryAlreadyExist(It.IsAny<string>(), It.IsAny<SqlParameter[]>()), Times.Once);
        }

    }
}