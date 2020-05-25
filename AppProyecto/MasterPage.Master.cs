using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
namespace AppProyecto
{
     
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        public String validarAdmin;
        public String validarCliente;
        public String validarDependiente;
        DistribuidoraPEntities entidades;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipoUsuario"] == null){
                Session["tipoUsuario"] = 0;

            }
            entidades = new DistribuidoraPEntities();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                
            switch ((int)Session["tipoUsuario"])
            {
                case 1:
                        validarAdmin = "Style='display:none'";
                        validarDependiente = "Style='display:none'";
                    break;

                case 2:
                       
                        validarDependiente = "";
                    break;

                case 3:
                        validarCliente = "Style='display:none'";
                        validarAdmin = "Style='display:none'";
                    break;
            }

           }else
            {
                validarAdmin = "Style='display:none'";
                validarCliente = "Style='display:none'";
                validarDependiente = "Style='display:none'";
            }
        }
        
    }
}