using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelEF.DAO;
using ModelEF.Model;

namespace TestUngDung.Areas.User.Controllers
{
    public class CustomerController : Controller
    {
        // GET: User/Customer
        public ActionResult Index()
        {
            
                var product = new ProductDAO();
                var model = product.ListAll();
                return View(model);
        }
    }
}