using System.Web.Mvc;

namespace TestUngDung.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Ud_default",
                "Admin/{controller}/{action}/{userName}",
                new {Controller="User", action = "Edit", userName = UrlParameter.Optional }
            );

            context.MapRoute(
            "Us_default",
            "Admin/{controller}",
            new { Controller = "User", userName = UrlParameter.Optional }
            );


            context.MapRoute(
                "Dl_default",
                "Admin/{controller}/{action}/{userName}",
                new { Controller = "User", action = "Delete", userName = UrlParameter.Optional }
            );


            context.MapRoute(
                "Ud_Category_default",
                "Admin/{controller}/{action}/{Id_Category}",
                new { Controller = "Category", action = "Edit", Id_Category = UrlParameter.Optional }
            );

            context.MapRoute(
                "Dl_Category_default",
                "Admin/{controller}/{action}/{Id_Category}",
                new { Controller = "Category", action = "Delete", Id_Category = UrlParameter.Optional }
            );

            context.MapRoute(
               "Ad_default",
               "Admin/{controller}/{action}/{id}",
               new { action = "Index", id = UrlParameter.Optional }
           );

        }
    }
}