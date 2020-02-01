using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_ICA.Controllers
{
    public class CustomerController : Controller
    {
 
        AdamsModel.AdamsModel db = new AdamsModel.AdamsModel();   // database bd - this is where all of the data is kept.


 
        public ActionResult Index()  //This is where all the Customers are shown. 
        {
            var cus = db.Customers; //Variable cus is set to get all data from the database.
                return View(cus); // return the view with the parameter of cus.
        }



        // GET: Customer/Details/5
        public ActionResult Details(int? id)//This is checking to see if the customer exists in db.
        {       
            if (id == null) //if the id is equal to null
            {
                // Initializes a new instance of the HttpStatusCodeResult class using httpStatusCode.BadRequest
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            AdamsModel.Customer Customer = db.Customers.Find(id); //finding the Customers That exist

            if (Customer == null) //if the Customers are set to null
            {
                return HttpNotFound(); // send the message
            }
            return View(Customer);// otherwise return the Customer Details.
        }






        // GET: Customer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customer/Create
        [HttpPost]
        public ActionResult Create(AdamsModel.Customer Customer)
        {
            try
            {
                db.Customers.Add(Customer);  //Creating the new Customer within the db.
                    db.SaveChanges(); // save the changes to the db. 


                // after filling in the form the user is taken back to the index where all customers are showing
                return RedirectToAction("Index"); 
            }
            catch
            {
                return View(Customer); // return the view
            }
        }







        // GET: Customer/Edit/5
        public ActionResult Edit(int? id)//This is checking to see if the customer exists in db.
        {       
            if (id == null) //if the id is equal to null
            {
                // Initializes a new instance of the HttpStatusCodeResult class using httpStatusCode.BadRequest
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            AdamsModel.Customer Customer = db.Customers.Find(id); //finding the Customers That exist

            if (Customer == null) //if the Customers are set to null
            {
                return HttpNotFound(); // send the message
            }
            return View(Customer);// otherwise return the Customer Details.
        }

        // POST: Customer/Edit/5
        [HttpPost]
        public ActionResult Edit(AdamsModel.Customer Customers)
        {

            if (ModelState.IsValid) // tells me if any errors have been added to ModelState
            {
                // becuase model state was valid its allowing the changes to be made to Customer
                db.Entry(Customers).State = EntityState.Modified; 
                    db.SaveChanges(); // save changes when complete
                        return RedirectToAction("Index"); //returns to main page / Index where changes can be seen
            }
                            return View(Customers); //otherwise return back to the view.
        }













        // GET: Customer/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Customer/Delete/5
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
