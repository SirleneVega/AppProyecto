using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
namespace AppProyecto
{
    public partial class CatalogoProductos : System.Web.UI.Page
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
                        & u.descripcionPantalla.Equals("CatalogoProductos")));
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
                        & u.descripcionPantalla.Equals("AgregarProductos")));
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

        protected void lista_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                //calcular indice
                int indice = Convert.ToInt32(e.CommandArgument);
                //tomamos el indice
                DataListItem item = this.lista.Items[indice];
                Label lbl = (Label)item.FindControl("lblCodigo");

                if (e.CommandName.Equals("modificar"))
                {
                    Response.Redirect("AgregarProducto.aspx?accion=M&codigoBarra=" + lbl.Text);
                }
                if (e.CommandName.Equals("eliminar"))
                {
                    Response.Redirect("AgregarProducto.aspx?accion=E&codigoBarra=" + lbl.Text);
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}