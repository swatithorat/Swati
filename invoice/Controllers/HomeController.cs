using invoice.Models;
using invoice.Services;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace invoice.Controllers
{
    public class HomeController : Controller
    {
        private ReportService reportservice;
        public HomeController()
        {
            reportservice = new ReportService();
        }
        // GET: Home
        public ActionResult Index()
        {
            //GenerateInvoiceReport(Response);
            return View();
        }

        public ActionResult Invoice()
        {
            //GenerateInvoiceReport(Response);
            return View();
        }
        public ActionResult Customer()
        {
            //GenerateCustomerReport(Response);
            using (var db = new InvoiceEntities1())
            {
                List<tblcustomer> cust = db.tblcustomers.ToList();
                return View(cust);
            }
        }
        // GET: Home
        public ActionResult Indexcust()
        {
            using (var db = new InvoiceEntities1())
            {
                List<tblcustomer> cust = db.tblcustomers.ToList();
                return View(cust);
            }
        }
        public ActionResult indexproduct()
        {
            using (var db = new InvoiceEntities1())
            {
                List<tblproduct> pro = db.tblproducts.ToList();
                return View(pro);
            }
        } // GET: Home
        public ActionResult addcustomer()
        {
            return View();
        } // GET: Home
        public ActionResult addproduct()
        {
            return View();
        }

        [HttpGet]
        public ActionResult edit(int id)
        {
            using (var db = new InvoiceEntities1())
            {
                tblcustomer cust = db.tblcustomers.Where(x=>x.idcustomer==id).FirstOrDefault();
                return View(cust);
            }
            
        }
        [HttpPost]
        public ActionResult edit(tblcustomer obj)
        {
            using (var db = new InvoiceEntities1())
            {
                tblcustomer customer = db.tblcustomers.Where(x => x.idcustomer == obj.idcustomer).FirstOrDefault();
                customer.name = obj.name;
                customer.mobileno = obj.mobileno;
                customer.emailid = obj.emailid;
                customer.address = obj.address;
                db.SaveChanges();
                return RedirectToAction("Indexcust");
            }

        }

        public ActionResult delete(int id)
        {
            using (var db = new InvoiceEntities1())
            {
                tblcustomer cust = db.tblcustomers.FirstOrDefault(x => x.idcustomer == id);
                db.tblcustomers.Remove(cust);
                db.SaveChanges();
                return RedirectToAction("Indexcust");
            }
           
        }
        public ActionResult editproduct()
        {
            return View();
        }
        [HttpGet]
        public ActionResult editproduct(int id)
        {
            using (var db = new InvoiceEntities1())
            {
                tblproduct product = db.tblproducts.Where(x => x.idproduct == id).FirstOrDefault();
                return View(product);
            }

        }
        [HttpPost]
        public ActionResult editproduct(tblproduct obj)
        {
            using (var db = new InvoiceEntities1())
            {
                tblproduct product = db.tblproducts.Where(x => x.idproduct == obj.idproduct).FirstOrDefault();
                product.name = obj.name;
                product.price = obj.price;

                db.SaveChanges();
                return RedirectToAction("indexproduct");
            }

        }

        public ActionResult deleteproduct(int id)
        {
            using (var db = new InvoiceEntities1())
            {
                tblproduct product = db.tblproducts.FirstOrDefault(x => x.idproduct == id);
                db.tblproducts.Remove(product);
                db.SaveChanges();
                return RedirectToAction("indexproduct");
            }

        }
        [HttpPost]
        public ActionResult addcustomer(tblcustomer obj)
        {
            if (ModelState.IsValid)
            {
                int billno;
                InvoiceEntities1 db = new InvoiceEntities1();
                tblcustomer customer = new tblcustomer();
                customer.name = obj.name;
                customer.mobileno = obj.mobileno;
                customer.emailid = obj.emailid;
                customer.address = obj.address;
                customer.billno = db.tblcustomers.Count() + 1;
                db.tblcustomers.Add(customer);
                db.SaveChanges();
            }
            return View(obj);
        }
        [HttpPost]
        public ActionResult addproduct(tblproduct obj)

        {
            if (ModelState.IsValid)
            {
                InvoiceEntities1 db = new InvoiceEntities1();
                tblproduct product = new tblproduct();
                product.name = obj.name;
                product.price = obj.price;
                product.srno = obj.srno;
                db.tblproducts.Add(product);
                db.SaveChanges();
            }
            return View(obj);
        }

        public ActionResult GetCustomerId(int Id)
        {

            using (var db = new InvoiceEntities1())
            {
                List<customerproduct> data = db.customerproducts.Where(x => x.customer == Id).ToList();
                List<tblproduct> Products = new List<tblproduct>();
                tblproduct product;
                double SumOfPrice = 0;
                foreach (customerproduct productmap in data)
                {
                    product = db.tblproducts.Where(x => x.idproduct == productmap.product).FirstOrDefault();
                    if (product != null)
                    {
                        Products.Add(product);
                        SumOfPrice += (double)product.price;
                    }
                }

                List<tblcustomer> customer = db.tblcustomers.Where(x => x.idcustomer == Id).ToList();
                reportservice.GenerateInvoiceReport(SumOfPrice, customer, Products, Response, Server);
                return RedirectToAction("Customer");
            }
        }
    }
}