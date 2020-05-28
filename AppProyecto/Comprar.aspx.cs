using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
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
            
            if (!IsPostBack)
            {
                myDataList.DataSource = CreateDataSource();
                myDataList.DataBind();
            }        
        }

        public ICollection CreateDataSource()
        {
            DataTable myDataTable = new DataTable();
            DataRow myDataRow;

            myDataTable.Columns.Add(new DataColumn("Codigo", typeof(string)));
            myDataTable.Columns.Add(new DataColumn("Descripción", typeof(string)));
            myDataTable.Columns.Add(new DataColumn("Precio por unidad", typeof(int)));
            myDataTable.Columns.Add(new DataColumn("Cantidad", typeof(int)));
            myDataTable.Columns.Add(new DataColumn("Sub toal", typeof(double)));

            foreach (DetalleFactura detalle in detalleFacturas)
            {
                myDataRow = myDataTable.NewRow();
                myDataRow[0] = detalle.codigoDeBarra;
                myDataRow[1] = detalle.descripcion;
                myDataRow[2] = (detalle.subTotal) / (detalle.cantidad);
                myDataRow[3] = (detalle.cantidad);
                myDataRow[4] = (detalle.subTotal);
                myDataTable.Rows.Add(myDataRow);
            }
            DataView dataView = new DataView(myDataTable);
            return dataView;
        }

        public void eliminar(string codigoDeBarra)
        {
            foreach (DetalleFactura dfactura in detalleFacturas)
            {
                if (dfactura.codigoDeBarra.Equals(codigoDeBarra))
                {
                    detalleFacturas.Remove(dfactura);
                    break;
                }
            }
            Session["elcarritoquetodolopuede"] = detalleFacturas;
            if (detalleFacturas.Count == 0)
            {
                Session["elcarritoquetodolopuede"] = null;
            }
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

        protected void myDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                int indiceItem = Convert.ToInt32(e.CommandArgument);

                DataListItem item = this.myDataList.Items[indiceItem];
                //Items
                Label label = (Label)item.FindControl("idCodigo");
                String codigo = label.Text.Trim();
                if (e.CommandName.Equals("agregar"))
                {
                    try
                    {

                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

                if (e.CommandName.Equals("eliminar"))
                {
                    eliminar(codigo);
                    
                    Response.Redirect("Comprar.aspx");
                    mensaje("Producto eliminado");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
    }
}