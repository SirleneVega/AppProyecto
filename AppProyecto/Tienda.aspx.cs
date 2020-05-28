using System;
using System.Collections;
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
    public partial class Tienda : System.Web.UI.Page
    {
        //Atributos
        DistribuidoraPEntities entities;
        List<DetalleFactura> listaDetalleFactura;


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
                        & u.descripcionPantalla.Equals("Tienda")));
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
            listaDetalleFactura = (List<DetalleFactura>)Session["elcarritoquetodolopuede"];
        }


        //Carrito
        public void carrito(Producto produc, int cantidad)
        {
            try
            {
                if (listaDetalleFactura == null)
                {
                    listaDetalleFactura = new List<DetalleFactura>();
                }
                for (int i = 0; i < listaDetalleFactura.Count(); i++)
                {
                    if (listaDetalleFactura.Exists(x => x.codigoDeBarra.Contains(produc.codigoDeBarra)))
                    {
                        listaDetalleFactura.RemoveAt(i);
                        break;
                    }
                }
                DetalleFactura dFactura = new DetalleFactura();
                dFactura.codigoDeBarra = produc.codigoDeBarra;
                dFactura.cantidad = cantidad;
                dFactura.descripcion = produc.descripcion;
                dFactura.calcularSubTotal(produc.precioVenta);
                listaDetalleFactura.Add(dFactura);
                Session["elcarritoquetodolopuede"] = listaDetalleFactura;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }

        //Factura
        public void comprar()
        {
            
            if (listaDetalleFactura != null)
            {
                Session["elcarritoquetodolopuede"] = listaDetalleFactura;
                Response.Redirect("Comprar.aspx");
            }
            else
            {
                mensaje("Carrito vacio");
            }
        }


        //llama al carrito
        protected void lista_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int indiceItem = Convert.ToInt32(e.CommandArgument);
            DataListItem item = this.lista.Items[indiceItem];
            //Items
            Label label = (Label)item.FindControl("lblCodigo");
            TextBox textBox = (TextBox)item.FindControl("cantidad");
            RequiredFieldValidator requiredFieldValidator = (RequiredFieldValidator)item.FindControl("requiredCantidad");

            int codigo = int.Parse(label.Text.Trim());
            if (textBox.Text.Trim().Equals(""))
            {
                mensaje("La cantidad no puede estar vacia");
            }
            else
            {
                int cantidad = int.Parse(textBox.Text.Trim());

                Productos produc = this.entities.Productos.FirstOrDefault(u => (u.codigoBarra.Equals("" + codigo)));

                if (e.CommandName.Equals("agregar"))
                {
                    try
                    {
                        carrito(llenarProducto(produc), cantidad);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

                if (e.CommandName.Equals("finalizar"))
                {
                    carrito(llenarProducto(produc), cantidad);
                    comprar();
                }
            }
            
        }

        public Producto llenarProducto(Productos productos)
        {
            Producto producto = new Producto();
            producto.codigoDeBarra = productos.codigoBarra;
            producto.descripcion = productos.descripcion;
            producto.precioCompra = productos.precioCompra;
            producto.precioIV = (Double)(productos.porcentajeIV);
            producto.precioIVA = (Double)productos.porcentajeIVA;
            producto.precioVenta = (Double)productos.precioVenta;
            producto.exento = productos.exento;
            producto.unidadMedia = productos.unidadMedida;
            producto.estado = productos.estado;
            producto.cantidad = productos.cantidad;
            producto.foto = productos.foto;
            return producto;
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            comprar();
        }

        private void mensaje(string texto)
        {
            Response.Write("<script type='text/javascript'> alert('" + texto + "');</script>");
        }
    }
}