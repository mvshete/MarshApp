using Nric.Application.Helper;
using Nric.Application.ViewModel;
using Nric.Domain.Interface;
using Nric.Domain.Model;
using System.Linq;
using System.Web.Mvc;

namespace Nric.Application.Controllers
{
    public class HomeController : Controller
    {

        private readonly ICitizenManager _citizenManager;

        public HomeController(ICitizenManager citizenManager)
        {
            _citizenManager = citizenManager;
        }

        public ActionResult Index(string searchTerm, int page = 1)
        {
            const int pageSize = 10;
            var offset = (page - 1) * pageSize;

            var result = _citizenManager.List(offset, pageSize, searchTerm);

            var model = new ListCitizenViewModel
            {
                Citizens = result,
                Pager = new Pager(result.FirstOrDefault()?.TotalRecords > 0 ? result.FirstOrDefault().TotalRecords : 0, page)
            };

            return View(model);
        }

        [HttpGet]
        public ActionResult Save(int id = 0)
        {
            if (id == 0)
            {
                return View(new CitizenViewModel());
            }

            var citizen = _citizenManager.GetById(id);
            var model = new CitizenViewModel
            {
                Id = citizen.Id,
                Nric = citizen.NricId,
                FirstName = citizen.FirstName,
                MiddleName = citizen.MiddleName,
                LastName = citizen.LastName,
                Status = citizen.Status
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Save(CitizenViewModel model)
        {
            if (model.Id == 0)
            {
                var citizen = new Citizen
                {
                    NricId = model.Nric,
                    FirstName = model.FirstName,
                    MiddleName = model.MiddleName,
                    LastName = model.LastName
                };

                var doesCitizenAlreadyExist = _citizenManager.DoesCitizenAlreadyExist(citizen);

                if (doesCitizenAlreadyExist)
                {
                    return Json(new { success = false, message = "Citizen with same NRIC or Combination of First Name, Middle Name, Last name already exist", JsonRequestBehavior.AllowGet });
                }

                _citizenManager.Add(citizen);
                return Json(new { success = true, message = "Saved Successfully", JsonRequestBehavior.AllowGet });
            }
            else
            {
                var citizen = new Citizen
                {
                    Id = model.Id,
                    NricId = model.Nric,
                    FirstName = model.FirstName,
                    MiddleName = model.MiddleName,
                    LastName = model.LastName,
                    Status = model.Status
                };

                var doesCitizenAlreadyExist = _citizenManager.DoesCitizenAlreadyExist(citizen);

                if (doesCitizenAlreadyExist)
                {
                    return Json(new { success = false, message = "Citizen with same NRIC or Combination of First Name, Middle Name, Last name already exist", JsonRequestBehavior.AllowGet });
                }

                _citizenManager.Edit(citizen);
                return Json(new { success = true, message = "Updated Successfully", JsonRequestBehavior.AllowGet });
            }
        }

        [HttpPost]
        public ActionResult SetSubscriptionStatus(SubscriptionModel model)
        {
            _citizenManager.SetSubscriptionStatus(model.citizenIds, model.Status);
            return Json(new { success = true, message = "Updated Successfully", JsonRequestBehavior.AllowGet });
        }
    }
}
