using ModelEF.DAO;
using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using System.Web.Mvc;
using TestUngDung.Common;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
      

        [HttpGet]
        public ActionResult Index()
        {
            var product = new ProductDAO();
            var model = product.ListAll();
            return View(model);
        }


        [HttpGet]
        public ActionResult Create()
        {
            setViewBag();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Product product)
        {

            if (ModelState.IsValid)
            {
                var dao = new ProductDAO();
                if (dao.Find(product.IDproduct) != null)
                {
                    setAlert("Mã sản phẩm đã tồn tại", "warning");
                    return RedirectToAction("Create", "Product");
                }
                if (dao.Find(product.Nameproduct) != null)
                {
                    setAlert("Tên sản phẩm đã tồn tại", "warning");
                    return RedirectToAction("Create", "Product");
                }
                var kq = dao.Insert(product);
                if (kq==true)
                {
                    setAlert("Thêm sản phẩm  thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    setAlert("Thêm sản phẩm không thành công", "error");
                    return RedirectToAction("Create", "Product");
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(string IDproduct)
        {
            setViewBag();
            var value = Request["IDproduct"];
            var dao = new ProductDAO();
            var kq = dao.Find(value);
            if (kq != null)
                return View(kq);
            return View();

        }
            
        [HttpDelete]
        public ActionResult Delete(string IDproduct)
        {
            new ProductDAO().Delete(IDproduct);
            return RedirectToAction("Index");
        }


        public void setViewBag(long? selectedId = null)
        {
            var dao = new CategoryDAO();
            ViewBag.IDcategory = new SelectList(dao.ListAll(), "IDcategory", "Namecategory", selectedId);
        }
    }
}
