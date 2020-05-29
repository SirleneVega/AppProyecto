using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Referencias
using DAL;

namespace AppProyecto
{
    public partial class CatalogoUsuarios : System.Web.UI.Page
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
                        & u.descripcionPantalla.Equals("CatalogoUsuarios")));
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

        protected void listaUsuarios_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                //calcular indice
                int indice = Convert.ToInt32(e.CommandArgument);
                //tomamos el indice
                DataListItem item = this.listaUsuarios.Items[indice];
                Label lbl = (Label)item.FindControl("lblCorreo");
                Session["identificacion"] = null;
                Session["identificacion"] = lbl.Text.Trim();

                if (e.CommandName.Equals("modificar"))
                {
                    Response.Redirect("Registrarme.aspx?accion=M");
                }
                if (e.CommandName.Equals("eliminar"))
                {
                    Response.Redirect("Registrarme.aspx?accion=E");
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}