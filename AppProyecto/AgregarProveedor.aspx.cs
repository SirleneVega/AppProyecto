using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Referencias
using DAL;
using BLL;

namespace AppProyecto
{
    public partial class AgregarProveedor : System.Web.UI.Page
    {
       
       
        DistribuidoraPEntities entities;
        Proveedor proveedor;
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
                        & u.descripcionPantalla.Equals("AgregarProveedor")));
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                this.proveedor = new Proveedor();
                this.proveedor.cedulaLegal = this.txtCedula.Text.Trim();
                this.proveedor.nombreComercial = this.txtNombreC.Text.Trim();
                this.proveedor.telefono = int.Parse(this.txtTelefono.Text.Trim());
                this.proveedor.contacto = this.txtContacto.Text.Trim();
                this.proveedor.direccion = this.txtDireccion.Text.Trim();
                this.proveedor.email = this.txtEmail.Text.Trim();
                agregarProveedor(proveedor);

            }
            catch (Exception ex)
            {
            }

            this.limpiarPantalla();

        }

        private void agregarProveedor(Proveedor proveedor)
        {
            try
            {
                Proveedores tblProveedor = new Proveedores();
                tblProveedor.cedulaLegal = proveedor.cedulaLegal;
                tblProveedor.nombreComercial = proveedor.nombreComercial;
                tblProveedor.telefono = proveedor.telefono;
                tblProveedor.contacto = proveedor.contacto;
                tblProveedor.direccion = proveedor.direccion;
                tblProveedor.email = proveedor.email;



                this.entities.Proveedores.Add(tblProveedor);
                this.entities.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void limpiarPantalla()
        {
            this.txtCedula.Text = "";
            this.txtNombreC.Text = "";
            this.txtTelefono.Text = "";
            this.txtContacto.Text = "";
            this.txtDireccion.Text = "";
            this.txtEmail.Text = "";
            
        }




    }
}