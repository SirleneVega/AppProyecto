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
                this.producto.Descripcion = this.txtDescripcion.Text.Trim();
                this.producto.precioCompra = int.Parse(this.txtPrecio.Text.Trim());
                this.producto.precioIV = int.Parse(this.txtPorcetajeIV.Text.Trim());
                this.producto.precioIVA = int.Parse(this.txtPorcentajeIVA.Text.Trim());
                this.producto.precioVenta = Double.Parse(this.txtPrecioVenta.Text.Trim());
                this.producto.exento = this.txtExcento.Text.Trim();
                this.producto.unidadMedia = this.txtUnidad.Text.Trim();
                this.producto.cantidad = int.Parse(this.txtCantidad.Text.Trim());
                this.producto.Foto = this.producto.codigoDeBarra + "_" + this.fileUpload.FileName;
                if (this.txtEstadoP.Text.Trim().Equals("Activo"))
                {
                    this.producto.estado = true;
                }
                else
                {
                    this.producto.estado = false;
                }
                this.agregarProducto(this.producto);
                if (this.fileUpload.HasFile)
                {
                    this.subirFoto(this.producto.codigoDeBarra, this.fileUpload.PostedFile);
                }
                this.limpiarPantalla();
                
            }
            catch (Exception ex)
            {
            }
        }

        private void agregarProducto(Producto producto)
        {
            try
            {
                Productos tblProductos = new Productos();
                tblProductos.codigoBarra = producto.codigoDeBarra;
                tblProductos.descripcion = producto.Descripcion;
                tblProductos.precioCompra = producto.precioCompra;
                tblProductos.porcentajeIV = producto.precioIV;
                tblProductos.porcentajeIVA = producto.precioIVA;
                tblProductos.exento = producto.exento;
                tblProductos.unidadMedida = producto.unidadMedia;
                tblProductos.cantidad = producto.cantidad;
                tblProductos.foto = producto.Foto;
                tblProductos.idCategoria = int.Parse(dropCategoria.SelectedValue);
                tblProductos.precioVenta = producto.precioVenta.GetHashCode();
                if (producto.estado == true)
                {
                    tblProductos.estado = "Activo";
                }
                else
                {
                    tblProductos.estado = "Inactivo";
                }


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
            this.txtPrecioVenta.Text = "";
            this.txtDescripcion.Text = "";
            this.txtPrecio.Text = "";
            this.txtPorcentajeIVA.Text = "";
            this.txtPorcetajeIV.Text = "";
            this.txtEstadoP.Text = "";
            this.txtUnidad.Text = "";
            this.txtExento.Text = "";
        }


        
    }
}