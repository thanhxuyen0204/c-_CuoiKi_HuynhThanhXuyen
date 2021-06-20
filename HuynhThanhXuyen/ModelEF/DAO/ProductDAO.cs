using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ModelEF.DAO
{
    public class ProductDAO
    {
        private HuynhThanhXuyenContext db = null;
        public ProductDAO()
        {
            db = new HuynhThanhXuyenContext();
        }
        public List<Product> ListAll()
        {
            var sx = db.Products.OrderBy(s => s.Quantity).ThenByDescending(s => s.UnitCost);
            return sx.ToList();
        }

        
        public bool Insert(Product entityProduct)
        {
            try
            {

                db.Products.Add(entityProduct);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Update(Product entityProduct)
        {
            try
            {
                var product = Find(entityProduct.IDproduct);
                product.Nameproduct = entityProduct.Nameproduct;
                product.Description_pd = entityProduct.Description_pd;
                product.category = entityProduct.category;
                product.Size = entityProduct.Size;
                product.Quantity = entityProduct.Quantity;
                product.UnitCost = entityProduct.UnitCost;
                product.Image = entityProduct.Image;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool Delete(string IDproduct)
        {
            try
            {
                Product product = db.Products.Find(IDproduct);
                db.Products.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

        }
       

        public Product Find(string IDproduct)
        {
            return db.Products.Find(IDproduct);
        }


        public IEnumerable<Product> ListWhereAll(string searchKey, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchKey))
            {
                model = model.Where(x => x.Nameproduct.Contains(searchKey));
            }
            return model.OrderBy(x => x.Nameproduct);

        }



    }
}

