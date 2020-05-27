<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CatalogoProductos.aspx.cs" Inherits="AppProyecto.CatalogoProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-lg-10 mt-05">
        <div class="justify-content-center text-center">
            <%--aqui se maneja el registro de productos--%>
            <div class="blog-card toast-body">
                <div class="card-header alert-primary">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="card-title">Inventario de productos</h4>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <a href="AgregarProducto.aspx" class="btn btn-dark">Agregar Productos</a>
                            </div>
                        </div>
                    </div>
                    <%--implementación de un datalist--%>
                    <asp:DataList
                        ID="lista"
                        runat="server"
                        RepeatDirection="Horizontal"
                        RepeatColumns="2"
                        DataSourceID="dataSource"
                        AlternatingItemStyle-Wrap="true"
                        CssClass="table table-responsive-lg"
                        OnItemCommand="lista_ItemCommand"
                        DataKeyField="codigoBarra">
                        <ItemTemplate>
                            <div class="card">

                                <div class="card-header alert-primary">
                                    <h5 class="card-title text-center ">Codigo del Producto: 
                                        <asp:Label ID="lblCodigo"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"codigoBarra") %>'
                                            runat="server" />
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
											  <div class="row">
												  <div class="col-md-12">
													  <img class="img-fluid img-thumbnail"
													src='Productos/<%# DataBinder.Eval(Container.DataItem,"foto") %>' 
												    alt='<%# DataBinder.Eval(Container.DataItem,"codigoBarra") %>'
													style="width:300px;height:300px"/>
												  </div>
											  </div>
										  </div>
										  <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Descripcion del Producto: " runat="server" />
                                            <asp:Label ID="lblNombreC"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"descripcion") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Precio de compra: " runat="server" />
                                            <asp:Label ID="lblPrecioC"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"precioCompra") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Precio de venta: " runat="server" />
                                            <asp:Label ID="lblPrecioV"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"precioVenta") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Cantidad en inventario: " runat="server" />
                                            <asp:Label ID="lblCantidad"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"cantidad") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="card-footer alert-primary">
                                        <%--campo para el boton de opciones--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-dark" data-toggle="modal"
                                                    data-target='#ID<%# DataBinder.Eval(Container.DataItem,"codigoBarra") %>'>
                                                    Opciones
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--fin del body--%>
                            </div>
                            <%-- fin del card--%>




                           
                             <%--modal de  opciones --%>
                            <div id='ID<%# DataBinder.Eval(Container.DataItem,"codigoBarra") %>'
                                class="modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header alert-primary text-center">
                                            <h class="modal-title">Seleccione la opcion que desea</h>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <asp:Button ID="btnModificar" Text="Modificar" runat="server"
                                                CommandName="modificar"
                                                CommandArgument='<%# ( (DataListItem) Container).ItemIndex %>'
                                                CssClass="btn btn-dark" />
                                            <asp:Button ID="btnEliminar" Text="Eliminar" runat="server"
                                                CommandName="eliminar"
                                                CommandArgument='<%# ( (DataListItem) Container).ItemIndex %>'
                                                CssClass="btn btn-dark" />
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>

                </div>

                <div class="card-footer alert-primary">
                    <h5 class="card-title text-center">Distribuidora del Pacifico</h5>
                </div>

            </div>
        </div>



    </div>
    <asp:SqlDataSource ID="dataSource" runat="server" 
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>' 
        SelectCommand="SELECT [codigoBarra], [descripcion], [porcentajeIV], [precioCompra], [precioVenta], [porcentajeIVA], [exento], [unidadMedida], [estado], [foto], [idCategoria], [cantidad] FROM [Productos] ORDER BY [codigoBarra]" />    

</asp:Content>
