using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace AppProyecto
{
     
    public partial class MasterPage : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Session["tipoUsuario"] = 0;
            }

            if (Session["tipoUsuario"] == null){
                Session["tipoUsuario"] = 0;

            }
            
        }
        
    }
}