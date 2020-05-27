using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//referencia
using DAL;

namespace AppProyecto
{
     
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        DistribuidoraPEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipoUsuario"] == null)
            {
                Session["tipoUsuario"] = 0;
                FormsAuthentication.SignOut();
                Response.Redirect("default.aspx");
            }

            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Session["tipoUsuario"] = 0;
            }

        }

        public bool validarPantalla(int tipo, String pantalla)
        {
            try
            {
                if (tipo != 0)
                {
                    Vp_PantallaUsuario validar = this.entities.Vp_PantallaUsuario.FirstOrDefault(u => (u.idRol.Equals(tipo)
                       & u.descripcionPantalla.Equals(pantalla)));
                    if (validar != null)
                    {
                        return false;
                    }
                }

                return true;
            }
            catch (Exception)
            {
                throw;
            }

        }

    }
}