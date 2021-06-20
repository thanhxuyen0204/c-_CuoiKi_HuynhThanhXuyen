using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelEF.Model;

namespace ModelEF.DAO
{
    public class UserDAO
    {
        private HuynhThanhXuyenContext db ;
        public UserDAO()
        {
            db = new HuynhThanhXuyenContext();
        }
        
        public int login(string user, string pass)
        {
            var kq = db.UserAccounts.SingleOrDefault(x => x.UserName.Contains(user) && x.Password.Contains(pass));
            if (kq == null)
            {
                return 0;
            }
            else
            {
                    return 1;
            }
        }

         
        public bool Delete(int Id)
        {
            try
            {
                UserAccount ID = db.UserAccounts.Find(Id);
                if (ID.Status == "activity")
                {
                    return false;
                }
                db.UserAccounts.Remove(ID);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
     
        public UserAccount Find(int Id)
        {
            return db.UserAccounts.Find(Id);
        }


        public List<UserAccount> ListAll()
        {
            return db.UserAccounts.ToList();
        }

        
        public IEnumerable<UserAccount> ListWhereAll(string searchKey, int page, int pageSize)
        {
            IQueryable<UserAccount> model = db.UserAccounts;
            if (!string.IsNullOrEmpty(searchKey))
            {
                model = model.Where(x => x.UserName.Contains(searchKey));
            }
            return model.OrderBy(x => x.UserName);
        }
        
        
    }
}
