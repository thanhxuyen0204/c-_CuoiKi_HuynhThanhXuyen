using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using TestUngDung.Common;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {

        //PhanTrang
        [HttpGet]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var user = new UserDAO();
        
            if (!string.IsNullOrEmpty(searchString))
            {
                var model = user.ListWhereAll(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model.ToPagedList(page, pageSize));
            }else
            {
                var model = user.ListAll();
                return View(model.ToPagedList(page, pageSize));
            }
        }
	[HttpDelete]
        public ActionResult Delete(int Id)
        {
            new UserDAO().Delete(Id);
            return RedirectToAction("Index");
        }
       

        public void setViewBag(long? selectedId = null)
        {
            var dao = new UserDAO();
            ViewBag.IDuser = new SelectList(dao.ListAll(), "UserName", "UserName", selectedId);
        }
    }
}