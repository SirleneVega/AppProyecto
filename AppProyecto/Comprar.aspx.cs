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
            this.DisplayDiv(false);
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
                Factura fac = crearFactura();

                Facturas facturas = new Facturas();
                facturas.idFactura = id;
                facturas.tipoPago = fac.tipoPago;
                facturas.subTotal = (Decimal)fac.subTotal;
                facturas.montoImpuesto = (Decimal)fac.montoImpuesto;
                facturas.descuento = (Decimal)fac.descuento;
                facturas.montoTotal = (Decimal)fac.montoTotal;
                facturas.idCliente = fac.idCliente;
                facturas.transporte = (Decimal)fac.transporte;
                facturas.numeroCheque = fac.numeroCheque;
                facturas.nombreBanco = fac.entidadBancaria;

                entities.Facturas.Add(facturas);
                entities.SaveChanges();

                insertDetalleFactura(id);
                try
                {
                    entities.calcularFactura(id);
                    entities.SaveChanges();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                Session["elcarritoquetodolopuede"] = null;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public Factura crearFactura()
        {
            Factura factura = new Factura();
            factura.tipoPago = this.dropMetodoPago.SelectedValue;
            factura.subTotal = 0;
            factura.montoImpuesto = 0;
            factura.descuento = 0;
            factura.montoTotal = 0;
            factura.idCliente = (string)Session["idIsuario"];
            factura.transporte = 0;
            if (this.dropMetodoPago.SelectedValue.Equals("Cheque"))
            {
                factura.numeroCheque = int.Parse(this.txtNumeroCheque.Text.Trim());
                factura.entidadBancaria = this.dropBancos.SelectedValue;
            }
            else
            {
                factura.numeroCheque = 0;
                factura.entidadBancaria = "";
            }
            return factura;
        }

        public void insertDetalleFactura(int idFactura)
        {
            try
            {
                foreach (DetalleFactura d in detalleFacturas)
                {
                    DetalleFacturas detalleFacturasBD = new DetalleFacturas();
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

        public void modicarDetalle(DetalleFactura df)
        {
            try
            {
                if (detalleFacturas == null)
                {
                    detalleFacturas = new List<DetalleFactura>();
                }
                foreach (DetalleFactura detalles in detalleFacturas)
                {
                    if (detalles.codigoDeBarra.Equals(df.codigoDeBarra))
                    {
                        double precio = (detalles.subTotal / detalles.cantidad);
                        detalles.cantidad = df.cantidad;
                        detalles.calcularSubTotal(precio);
                        break;
                    }
                }
                Session["elcarritoquetodolopuede"] = detalleFacturas;
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
                TextBox textBox = (TextBox)item.FindControl("cantidad");
                if (e.CommandName.Equals("modificar"))
                {
                    try
                    {               
                        if (textBox.Text.Trim().Equals(""))
                        {
                            mensaje("La cantidad no puede estar vacia");
                        }
                        else
                        {
                            int cantidad = int.Parse(textBox.Text.Trim());
                            DetalleFactura detalle = new DetalleFactura();
                            detalle.codigoDeBarra = codigo;
                            detalle.cantidad = cantidad;
                            modicarDetalle(detalle);
                            Response.Redirect("Comprar.aspx");
                        }
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

        public int maxCantidad(string id)
        {
            int cantidad = this.entities.Productos.FirstOrDefault(u => (u.codigoBarra.Equals(id))).cantidad;
            return cantidad;
        }

        protected void dropMetodoPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.dropMetodoPago.SelectedValue.Equals("Cheque"))
            {
                this.DisplayDiv(true);
            }
        }

        private void DisplayDiv(bool isShow)
        {
            idMetodoP.Visible = isShow;
        }


        protected void btnRealizarCompra_Click(object sender, EventArgs e)
        {
            try
            {
                insertFactura();
                Response.Redirect("default.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}