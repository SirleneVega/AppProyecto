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
    public partial class AgregarRol : System.Web.UI.Page
    {
        DistribuidoraPEntities entities;
        List<String> array;

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
                        & u.descripcionPantalla.Equals("AgregarRol")));
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
            array = new List<String>();
            if (!IsPostBack)
            {
                Session["lista"]=null;
            }
            array = (List<String>)Session["lista"];
        }

        protected void Pantallas_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int indice = Convert.ToInt32(e.CommandArgument);
            DataListItem item = this.Pantallas.Items[indice];
            Label lbl = (Label)item.FindControl("lblPantalla");
            if (e.CommandName.Equals("agregar"))
            {
                if (array!=null)
                {
                    foreach (string variable in array)
                    {
                        if (variable == lbl.Text.Trim())
                        {
                            array.Remove(variable);
                            break;
                        }

                    }
                }
                else
                {
                    array = new List<String>();
                }
                array.Add(lbl.Text.Trim());
            }
            Session["lista"] = array;

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            array =(List<String>)Session["lista"];
            if (array==null)
            {
                mensaje("Debe ingresar al menos una pantalla");
            }
            else
            {
                String descripcion = this.txtDescripcion.Text.Trim();
                insertRol(descripcion);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Rol insertado correctamente'); window.location.href='default.aspx';", true);
            }
        }

        public void insertRol(String descrip)
        {
            try
            {
                Roles roles = new Roles();
                roles.descripcion = descrip;
                this.entities.Roles.Add(roles);
                this.entities.SaveChanges();
                insertPantallaRol();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void insertPantallaRol()
        {
            try
            {
                foreach (string variable in array)
                {
                    this.entities.agregarPantallas(variable);
                }
                this.entities.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }


        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
    }
}