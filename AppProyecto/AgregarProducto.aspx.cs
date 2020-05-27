using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Referencias
using DAL;
using BLL;
using System.Data;
using System.Data.SqlClient;

namespace AppProyecto
{
    public partial class AgregarProducto : System.Web.UI.Page
         
    {
        private Producto producto;
        DistribuidoraPEntities entities;
        private String serie;
        private String funcion = "R";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            entities = new DistribuidoraPEntities();
            if (Request.QueryString["accion"] != null)
            {
                this.funcion = Request.QueryString["accion"];
            }
            if (Request.QueryString["codigoBarra"] != null)
            {
                this.serie = Request.QueryString["codigoBarra"];
            }

            //se valida la fincion
            switch (this.funcion)
            {
                case "R":
                    this.btnAgregar.Text = "Agregar Producto";
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
                        & u.descripcionPantalla.Equals("AgregarProducto")));
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
                this.producto = new Producto();
                this.producto.codigoDeBarra = this.txtCodigo.Text.Trim();
                this.producto.descripcion = this.txtDescripcion.Text.Trim();
                this.producto.precioCompra = int.Parse(this.txtPrecioCompra.Text.Trim());
                this.producto.calcularPrecioVenta();
                this.producto.cantidad = int.Parse(this.txtCantidad.Text.Trim());
                this.producto.calcularEstado();
                this.producto.exento = this.txtExcento.Text.Trim();
                this.producto.unidadMedia = this.txtUnidad.Text.Trim();    
                this.producto.foto = this.producto.codigoDeBarra + "_" + this.fileUpload.FileName;
                this.agregarProducto(this.producto);
                this.subirFoto(this.producto.codigoDeBarra, this.fileUpload.PostedFile);

                this.limpiarPantalla();     
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void agregarProducto(Producto producto)
        {
            try
            {
                Productos tblProductos = new Productos();
                tblProductos.codigoBarra = producto.codigoDeBarra;
                tblProductos.descripcion = producto.descripcion;
                tblProductos.precioCompra = producto.precioCompra;
                tblProductos.porcentajeIV = (Decimal)producto.precioIV;
                tblProductos.porcentajeIVA = (Decimal)producto.precioIVA;
                tblProductos.exento = producto.exento;
                tblProductos.unidadMedida = producto.unidadMedia;
                tblProductos.cantidad = producto.cantidad;
                tblProductos.foto = producto.foto;
                tblProductos.idCategoria = int.Parse(dropCategoria.SelectedValue);
                tblProductos.precioVenta = (Decimal)producto.precioVenta;
                tblProductos.estado = producto.estado;

                this.entities.Productos.Add(tblProductos);
                switch (this.funcion)
                {
                    case "R":
                        agregarProducto(producto);
                        if (this.fileUpload.HasFile)
                        {
                            this.subirFoto(this.producto.codigoDeBarra, this.fileUpload.PostedFile);
                        }
                        this.mensaje("Proveedor agregado correctamente");
                        break;
                    case "M":
                        this.modificar(this.producto);
                        if (this.fileUpload.HasFile)
                        {
                            this.subirFoto(this.producto.codigoDeBarra, this.fileUpload.PostedFile);
                        }
                        this.mensaje("Proveedor modificado correctamente");
                        break;
                    case "E":
                        this.eliminar(this.producto.codigoDeBarra);
                        this.mensaje("Proveedor eliminado correctamente");
                        break;

                }
                this.limpiarPantalla();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void subirFoto(string pCed, HttpPostedFile archivo)
        {
            try
            {
                string ruta = Server.MapPath(".") + @"\Productos\" + pCed + "_" + archivo.FileName;
                this.fileUpload.SaveAs(ruta);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void limpiarPantalla()
        {
            this.txtCodigo.Text = "";
            this.txtCantidad.Text = "";
            this.txtDescripcion.Text = "";
            this.txtPrecioCompra.Text = "";
            this.txtUnidad.Text = "";
            this.txtExcento.SelectedIndex = 0;
        }

        private void datosEntrada(bool estado)
        {
            this.txtCodigo.Enabled = false;
            this.txtCantidad.Enabled = estado;
            this.txtDescripcion.Enabled = estado;
            this.txtExcento.Enabled = estado;
            this.txtPrecioCompra.Enabled = estado;
            this.txtUnidad.Enabled = estado;
            this.txtCantidad.Enabled = estado;

        }

        private void consulta(string codigo)
        {
            try
            {
                Productos tblProducto = this.entities.Productos.FirstOrDefault(u => (u.codigoBarra == codigo));

                if (tblProducto != null)
                {
                    this.txtCodigo.Text = tblProducto.codigoBarra;
                    this.txtDescripcion.Text = tblProducto.descripcion;
                    this.txtExcento.Text = tblProducto.exento;
                    this.txtCantidad.Text =""+tblProducto.cantidad;
                    this.txtPrecioCompra.Text = ""+tblProducto.precioCompra;
                    this.txtUnidad.Text = tblProducto.unidadMedida;
                }

            }
            catch (Exception)
            {

                throw;
            }
        }


        private void modificar(Producto producto)
        {
            try
            {
                Productos tblProductos = this.entities.Productos.FirstOrDefault(p => (p.codigoBarra == producto.codigoDeBarra));
                if (tblProductos != null)
                {
                    tblProductos.codigoBarra = producto.codigoDeBarra;
                    tblProductos.descripcion = producto.descripcion;
                    tblProductos.cantidad = producto.cantidad;
                    tblProductos.idCategoria = int.Parse(dropCategoria.SelectedValue);
                    tblProductos.precioCompra = producto.precioCompra;
                    tblProductos.unidadMedida = producto.unidadMedia;
                    tblProductos.foto = producto.foto;


                    this.entities.SaveChanges();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private void eliminar(string codigoBarra)
        {
            try
            {

                Productos tblProductos = this.entities.Productos.FirstOrDefault(p => (p.codigoBarra == codigoBarra));

                if (tblProductos != null)
                {
                    this.entities.Productos.Remove(tblProductos);

                    this.entities.SaveChanges();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private void mensaje(string txt)
        {
            Response.Write("<script type='text/javascript'> alert('" + txt + "');</script>");
        }
    }
}