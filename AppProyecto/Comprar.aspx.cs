using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
//Referencias
using DAL;

namespace AppProyecto
{
    public partial class Comprar : System.Web.UI.Page
    {
        //atributos
        DistribuidoraPEntities entities;
        public List<DetalleFactura> detalleFacturas;
        public int contador;
        public int contador2=0;

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
                        & u.descripcionPantalla.Equals("Comprar")));
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
            if (Session["elcarritoquetodolopuede"] == null)
            {
                mensaje("Carrito vacio");
                Response.Redirect("Tienda.aspx");
            }
            detalleFacturas = (List<DetalleFactura>)Session["elcarritoquetodolopuede"];
            this.contador = 0;
        }

        public int idContador()
        {
            return contador;
        }

        public void eliminar(string codigoDeBarra)
        {
            foreach (DetalleFactura dfactura in detalleFacturas)
            {
                if (dfactura.codigoDeBarra.Equals(codigoDeBarra))
                {
                    detalleFacturas.Remove(dfactura);
                }
            }
            Session["elcarritoquetodolopuede"] = detalleFacturas;
        }

        public void insertFactura()
        {
            try
            {
                int id = entities.Facturas.Count()+1;
                //insertFactura
                insertDetalleFactura(id);
                entities.calcularFactura(id);
                Session["elcarritoquetodolopuede"] = null;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void insertDetalleFactura(int idFactura)
        {
            DetalleFacturas detalleFacturasBD = new DetalleFacturas();
            try
            {
                foreach (DetalleFactura d in detalleFacturas)
                {
                    detalleFacturasBD.idFactura = idFactura;
                    detalleFacturasBD.idProducto = d.codigoDeBarra;
                    detalleFacturasBD.subTotal = (Decimal)d.subTotal;
                    detalleFacturasBD.cantidad = d.cantidad;

                    entities.DetalleFacturas.Add(detalleFacturasBD);
                    entities.SaveChanges();
                }
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

        protected void listatabla_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }
}