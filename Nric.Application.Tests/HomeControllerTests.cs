using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using Moq;
using Nric.Application.Controllers;
using Nric.Application.ViewModel;
using Nric.Domain.Interface;
using Nric.Domain.Model;

namespace Nric.Application.Tests
{
    [TestClass]
    public class HomeControllerTests
    {
        private List<Citizen> _citizens;

        private HomeController _sut;
        private Mock<ICitizenManager> _mockCitizenManager;

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

            _mockCitizenManager = new Mock<ICitizenManager>();
            _sut = new HomeController(_mockCitizenManager.Object);
        }

        [TestMethod]
        public void List_When_Called_Then_Returns_Result_AsExpected()
        {
            const int page = 1;
            const int pageSize = 10;
            var offset = (page - 1) * pageSize;
            var searchTerm = string.Empty;

            _mockCitizenManager.Setup(x => x.List(offset, pageSize, searchTerm)).Returns(_citizens);

            //Act
            var result = (_sut.Index(searchTerm) as ViewResult).Model as ListCitizenViewModel;

            Assert.AreEqual(1, result.Citizens.Count);
            Assert.AreEqual(1, result.Citizens[0].Id);
            Assert.AreEqual(123456, result.Citizens[0].NricId);
            Assert.AreEqual("FirstName", result.Citizens[0].FirstName);
            Assert.AreEqual("MiddleName", result.Citizens[0].MiddleName);
            Assert.AreEqual("LastName", result.Citizens[0].LastName);
            Assert.AreEqual(new DateTime(2022, 1, 1), result.Citizens[0].DateCreated);
            Assert.AreEqual(new DateTime(2022, 2, 2), result.Citizens[0].DateLastActivated);
            Assert.AreEqual(new DateTime(2022, 3, 3), result.Citizens[0].DateLastDeActivated);
            Assert.AreEqual(Status.New, result.Citizens[0].Status);

            //Assert
            _mockCitizenManager.Verify(x => x.List(offset, pageSize, searchTerm), Times.Once);
        }

        [TestMethod]
        public void Add_NewCitizen_Called_Then_Returns_EmptyModel_AsExpected()
        {
            //Act
            var result = (_sut.Save(0) as ViewResult).Model as CitizenViewModel;

            //Assert
            Assert.AreEqual(0, result.Id);
            Assert.AreEqual(0, result.Nric);
            Assert.IsNull(result.FirstName);
            Assert.IsNull(result.MiddleName);
            Assert.IsNull(result.LastName);
        }

        [TestMethod]
        public void Edit_ExistingCitizen_Called_Then_Returns_Model_AsExpected()
        {
            const int citizenId = 1;
            var citizen = new Citizen
            {
                Id = 1,
                NricId = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName",
                Status = Status.New
            };

            _mockCitizenManager.Setup(x => x.GetById(citizenId)).Returns(citizen);
            //Act
            var result = (_sut.Save(citizenId) as ViewResult).Model as CitizenViewModel;

            //Assert
            Assert.AreEqual(1, result.Id);
            Assert.AreEqual(123456, result.Nric);
            Assert.AreEqual("FirstName", result.FirstName);
            Assert.AreEqual("MiddleName", result.MiddleName);
            Assert.AreEqual("LastName", result.LastName);
            Assert.AreEqual(Status.New, result.Status);

            _mockCitizenManager.Verify(x => x.GetById(citizenId), Times.Once);
        }

        [DataTestMethod]
        [DataRow(true)]
        [DataRow(false)]
        public void Add_NewCitizenSaved_Called_Then_Returns_Response_AsExpected(bool isExist)
        {
            var model = new CitizenViewModel
            {
                Id = 0,
                Nric = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName"
            };

            _mockCitizenManager.Setup(x => x.DoesCitizenAlreadyExist(It.IsAny<Citizen>())).Returns(isExist);

            if (isExist)
            {
                var result = (_sut.Save(model) as JsonResult);

                Assert.AreEqual(false, GetVal<bool>(result, "success"));

                _mockCitizenManager.Verify(x => x.Add(It.IsAny<Citizen>()), Times.Never);
            }
            else
            {
                _mockCitizenManager.Setup(x => x.Add(It.IsAny<Citizen>())).Verifiable();

                var result = (_sut.Save(model) as JsonResult);

                Assert.AreEqual(true, GetVal<bool>(result, "success"));

                _mockCitizenManager.Verify(x => x.Add(It.IsAny<Citizen>()), Times.Once);
            }

        }

        [DataTestMethod]
        [DataRow(true)]
        [DataRow(false)]
        public void Update_ExistingCitizenSaved_Called_Then_Returns_Response_AsExpected(bool isExist)
        {
            var model = new CitizenViewModel
            {
                Id = 1,
                Nric = 123456,
                FirstName = "FirstName",
                MiddleName = "MiddleName",
                LastName = "LastName"
            };

            _mockCitizenManager.Setup(x => x.DoesCitizenAlreadyExist(It.IsAny<Citizen>())).Returns(isExist);

            if (isExist)
            {
                var result = (_sut.Save(model) as JsonResult);

                Assert.AreEqual(false, GetVal<bool>(result, "success"));

                _mockCitizenManager.Verify(x => x.Edit(It.IsAny<Citizen>()), Times.Never);
            }
            else
            {
                _mockCitizenManager.Setup(x => x.Edit(It.IsAny<Citizen>())).Verifiable();

                var result = (_sut.Save(model) as JsonResult);

                Assert.AreEqual(true, GetVal<bool>(result, "success"));

                _mockCitizenManager.Verify(x => x.Edit(It.IsAny<Citizen>()), Times.Once);
            }

        }

        [TestMethod]
        public void SetSubscriptionStatus_Called_Then_Returs_Response_AsExpected()
        {
            var model = new SubscriptionModel
            {
                citizenIds = new[] { 1, 2, 3, 4, 5 },
                Status = true
            };

            _mockCitizenManager.Setup(x => x.SetSubscriptionStatus(model.citizenIds, model.Status)).Verifiable();

            //Act
            var result = (_sut.SetSubscriptionStatus(model) as JsonResult);

            Assert.AreEqual(true, GetVal<bool>(result, "success"));

            _mockCitizenManager.Verify(x => x.SetSubscriptionStatus(model.citizenIds, model.Status), Times.Once);
        }

        private T GetVal<T>(JsonResult jsonResult, string propertyName)
        {
            var property = jsonResult.Data.GetType().GetProperties()
                .FirstOrDefault(p => string.CompareOrdinal(p.Name, propertyName) == 0);

            if (null == property)
                throw new ArgumentException("propertyName not found", "propertyName");

            return (T)property.GetValue(jsonResult.Data, null);
        }

    }
}
