using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_ICA.Controllers
{
    public class SalonController : Controller
    {

        AdamsModel.AdamsModel db = new AdamsModel.AdamsModel();
        // GET: Salon
        public ActionResult Index()
        {
            var sal = db.HairAndBeautySalons;
            return View(sal);
        }

        // GET: Salon/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Salon/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Salon/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Salon/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Salon/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Salon/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Salon/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
