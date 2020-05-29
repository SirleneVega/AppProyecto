using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Referencias
using DAL;

namespace AppProyecto
{
    public partial class AsociarProveedor : System.Web.UI.Page
    {
        DistribuidoraPEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {     
            entities = new DistribuidoraPEntities();
            try
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    int tipo = (int)Session["tipoUsuario"];
                    Vp_PantallaUsuario pantalla = this.entities.Vp_PantallaUsuario.FirstOrDefault(u => (u.idRol.Equals(tipo)
                        & u.descripcionPantalla.Equals("AsociarProveedor")));
                    if (pantalla == null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAsosiar_Click(object sender, EventArgs e)
        {
            String cedula = this.dropProveedor.SelectedValue;
            String codigo = this.dropProducto.SelectedValue;
            this.asociarProveedor(cedula, codigo);
        }

        public void asociarProveedor(String cedulaLegal, String codigo)
        {
            try
            {
                this.entities.asociarProveedor(cedulaLegal, codigo);
                this.entities.SaveChanges();

            }
            catch (Exception)
            {
                mensaje("Proveedor ya ha sido previamente aosciado");
            }
        }

        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
    }
}