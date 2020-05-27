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
        private String serie;
        private String funcion = "R";
        protected void Page_Load(object sender, EventArgs e)
        {
            entities = new DistribuidoraPEntities();

            if (Request.QueryString["accion"] != null)
            {
                this.funcion = Request.QueryString["accion"];
            }
            if (Request.QueryString["cedulaLegal"] != null)
            {
                this.serie = Request.QueryString["cedulaLegal"];
            }

            //se valida la fincion
            switch (this.funcion)
            {
                case "R":
                    this.btnAgregar.Text = "Agregar";
                    break;
                case "M":
                    this.datosEntrada(true);
                    this.btnAgregar.Text = "Guardar cambios";
                    break;
                case "E":
                    this.datosEntrada(false);
                    this.btnAgregar.Text = "Confirmar Eliminacion";
                    break;


            }
            if (!IsPostBack)
            {
                this.consulta(this.serie);
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
                        & u.descripcionPantalla.Equals("CatalogoProveedores")));
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


                switch (this.funcion)
                {
                    case "R":
                        agregarProveedor(proveedor);
                        this.mensaje("Proveedor agregado correctamente");
                        break;
                    case "M":
                        this.modificar(this.proveedor);
                        this.mensaje("Proveedor modificado correctamente");
                        break;
                    case "E":
                        this.eliminar(this.proveedor.cedulaLegal);
                        this.mensaje("Proveedor eliminado correctamente");
                        break;

                }
                this.limpiarPantalla();

            }
            catch (Exception ex)
            {
            }
            

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

        private void mensaje(string txt)
        {
            Response.Write("<script type='text/javascript'> alert('" + txt + "');</script>");
        }

        private void consulta(string cedula)
        {
            try
            {
                Proveedores tblProveedor = this.entities.Proveedores.FirstOrDefault(u => (u.cedulaLegal == cedula));

                if (tblProveedor != null)
                {
                    this.txtCedula.Text = tblProveedor.cedulaLegal;
                    this.txtNombreC.Text = tblProveedor.nombreComercial;
                    this.txtTelefono.Text = "" + tblProveedor.telefono;
                    this.txtDireccion.Text = tblProveedor.direccion;
                    this.txtContacto.Text = tblProveedor.contacto;
                    this.txtEmail.Text = tblProveedor.email;
                }

            }
            catch (Exception)
            {

                throw;
            }
        }


        private void modificar(Proveedor proveedor)
        {
            try
            {
                Proveedores tblProveedor = this.entities.Proveedores.FirstOrDefault(p => (p.cedulaLegal == proveedor.cedulaLegal));
                if (tblProveedor != null)
                {
                    tblProveedor.cedulaLegal = proveedor.cedulaLegal;
                    tblProveedor.nombreComercial = proveedor.nombreComercial;
                    tblProveedor.telefono = proveedor.telefono;
                    tblProveedor.contacto = proveedor.contacto;
                    tblProveedor.direccion = proveedor.direccion;
                    tblProveedor.email = proveedor.email;

                    this.entities.SaveChanges();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private void datosEntrada(bool estado)
        {
            this.txtCedula.Enabled = false;
            this.txtNombreC.Enabled = estado;
            this.txtTelefono.Enabled = estado;
            this.txtDireccion.Enabled = estado;
            this.txtContacto.Enabled = estado;
            this.txtEmail.Enabled = estado;

        }

        private void eliminar(string cedula)
        {
            try
            {

                Proveedores tblProveedores = this.entities.Proveedores.FirstOrDefault(m => (m.cedulaLegal == cedula));

                if (tblProveedores != null)
                {
                    this.entities.Proveedores.Remove(tblProveedores);

                    this.entities.SaveChanges();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }











    }
}