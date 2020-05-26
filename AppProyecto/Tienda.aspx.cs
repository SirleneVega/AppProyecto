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
            listaDetalleFactura = new List<DetalleFactura>();
            listaDetalleFactura = (List<DetalleFactura>)Session["elcarritoquetodolopuede"];
        }

        public void carrito(Producto produc, int cantidad)
        {
            for (int i=0; i< listaDetalleFactura.Count(); i++)
            {
                if (listaDetalleFactura.Exists(x => x.codigoDeBarra.Contains(produc.codigoDeBarra)))
                {
                    listaDetalleFactura.RemoveAt(i);
                    break;
                }
            }
            //foreach (Producto p in listaProductos)
            //{
            //    if (p.codigoDeBarra.Equals(produc.codigoDeBarra))
            //    {
            //        listaProductos.Remove(p);
            //    }
            //}
            DetalleFactura dFactura = new DetalleFactura();
            dFactura.codigoDeBarra = produc.codigoDeBarra;
            dFactura.cantidad = cantidad;
            dFactura.calcularSubTotal(produc.precioVenta);
            listaDetalleFactura.Add(dFactura);
        }


        public void comprar()
        {
            Session["elcarritoquetodolopuede"] = listaDetalleFactura;
            Response.Redirect("Comprar.aspx");
        }
    }
}