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
                this.entities.SaveChanges();
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
        
    }
}