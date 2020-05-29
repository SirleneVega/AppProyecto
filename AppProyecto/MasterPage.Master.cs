  using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//referencia
using DAL;
using AppProyecto.cr.fi.bccr.gee;
using System.Data;

namespace AppProyecto
{
     
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        DistribuidoraPEntities entities;
        private wsindicadoreseconomicos wsindicadoreseconomicos = null;

        private DataSet datos = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            entities = new DistribuidoraPEntities();
            
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
            try
            {
                this.tipoCambio();
            }
            catch (Exception ex)
            {

                throw ex;
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

        private void tipoCambio()
        {
            try
            {
                this.wsindicadoreseconomicos = new wsindicadoreseconomicos();
                this.datos = this.wsindicadoreseconomicos.ObtenerIndicadoresEconomicos("318",
                    DateTime.Now.ToString("dd/MM/yyyy"), DateTime.Now.ToString("dd/MM/yyyy"),
                    "Marlene Vega Gonzalez", "N", "vegagonzalez.marlene@gmail.com", "E1ZNAMAEAL");
                Session["TipoCambio"] = Decimal.Parse(this.datos.Tables[0].Rows[0][2].ToString());

            }
            catch (Exception)
            {

                throw;
            }
        }


    }
}