using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class CategoryDAO
    {
        private HuynhThanhXuyenContext db = null;
        public CategoryDAO()
        {
            db = new HuynhThanhXuyenContext();
        }

        public bool Insert(Category entityCat)
        {
        
                db.Categories.Add(entityCat);
                db.SaveChanges();
                return true;
        }

        public Category Find(string categoryID)
        {
            return db.Categories.Find(categoryID);
        }

        public List<Category> ListAll()
        {
            return db.Categories.ToList();
        }

        public bool Update(Category entityCat)
        {
            try
            {
                var catID = Find(entityCat.IDcategory);
                if (!string.IsNullOrEmpty(entityCat.Namecategory))
                {
                    catID.Namecategory = entityCat.Namecategory;
                }
                if (entityCat.IDcategory==null)
                {
                    catID.IDcategory = entityCat.IDcategory;
                }
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public bool Delete(string IDcategory)
        {
            try
            {
                Category category = db.Categories.Find(IDcategory);
                db.Categories.Remove(category);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

        }
    }
}
