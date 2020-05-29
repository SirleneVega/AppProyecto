using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//Referencias
using DAL;

namespace AppProyecto
{
    public partial class AsignarRol : System.Web.UI.Page
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
                        & u.descripcionPantalla.Equals("AsignarRol")));
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

        protected void btnCambiarRol_Click(object sender, EventArgs e)
        {
            string email = this.dropUsuario.SelectedValue;
            int rol = int.Parse(this.dropProveedor.SelectedValue);

            this.modificarRol(email, rol);
        }

        public void modificarRol(String email, int rol)
        {
            try
            {
                this.entities.modificarRole(email, rol);
                this.entities.SaveChanges();
                if (Session["idIsuario"].ToString() == email)
                {
                    FormsAuthentication.SignOut();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Su rol ha cambiado, se cerro su sesión'); window.location.href='Login.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Rol del usuario modificado'); window.location.href='AsignarRol.aspx';", true);
                }
            }
            catch (Exception)
            {
                
            }
        }

        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
    }
}