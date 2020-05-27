<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="AppProyecto.Tienda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 text-center">
        <h2>Tienda</h2>
    </div>

    <div>
        <div class="row">
            <div class="col-md-12 text-center">
                <asp:Button ID="btnFinalizar" Text="Finalizar compra" CssClass="btn btn-outline-primary" OnClick="btnFinalizar_Click" runat="server" />
            </div>
        </div>
    </div>

    <div class="container col-lg-10 mt-5">
        <div class="justify-content-center text-center">
            <div class="card">
                <%--Cabeza del card--%>
                <div class="card-header">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="card-title">Productos</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Cuerpo del card--%>
                <div class="card-body">

                    <%--opcion para agregar una foto--%>
                    

                    <%--creacion de card para cada moto registrada en la bd--%>
                    <%--implementación de un data-list--%>
                    <asp:DataList ID="lista" runat="server" RepeatLayout="Table"
                        RepeatDirection="Horizontal"
                        RepeatColumns="4"
                        DataSourceID="Productos"
                        AlternatingItemStyle-Wrap="true"
                        CssClass="table table-responsive-lg"
                        OnItemCommand="lista_ItemCommand">

                        <ItemTemplate>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title text-center">Codigo de Barra
                                        <br><asp:Label ID="lblCodigo" Text='<%# DataBinder.Eval(Container.DataItem,"codigoBarra") %>'
                                            Font-Bold="true"
                                            runat="server" />
                                    </h5>
                                </div>

                                <div class="card-body">
                                    <%--campo para mostrar la foto--%>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <img class="img-fluid img-thumbnail"
                                                    src='Productos/<%# DataBinder.Eval(Container.DataItem,"Foto") %>'
                                                    alt='<%# DataBinder.Eval(Container.DataItem,"codigoBarra")%>'
                                                    style="width: 150px; height: 150px" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <%--descripcion--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label Text="Descripción " runat="server" />
                                                <asp:Label ID="lblDescripción"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"descripcion")%>'
                                                    Font-Bold="true"
                                                    runat="server" />
                                            </div>
                                        </div>

                                        <%--precioVenta--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label Text="Precio Venta $" runat="server" />
                                                <asp:Label Text='<%#(((Decimal)DataBinder.Eval(Container.DataItem,"precioVenta")))%>' Font-Bold="true" runat="server" />
                                                <%--<asp:Label Text='<%#(((Decimal)DataBinder.Eval(Container.DataItem,"PrecioVenta"))/
                                                        ((Decimal)Session["TipoCambio"])).ToString("0.00") %>' Font-Bold="true" runat="server" />--%>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="card-footer">
                                    <%--boton--%>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                                    data-target='#--<%# DataBinder.Eval(Container.DataItem,"codigoBarra")%>'>
                                                    Añadir</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--modal de acciones--%>
                            <div id='--<%# DataBinder.Eval(Container.DataItem,"codigoBarra")%>'
                                class="modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Seleccione la acción a realizar</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true"></span>
                                            </button>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <asp:Label Text="Existencias" runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"cantidad")%>' runat="server" />
                                                    </div>
                                                </div>
                                                </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <asp:Label Text="Seleccione la cantidad" runat="server" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="cantidad" TextMode="Number" CssClass="form-control" min="1" max='<%# DataBinder.Eval(Container.DataItem,"cantidad")%>' runat="server" />
                                                    </div>
                                                    <div class="col-md-1">
                                                        <%--<asp:RequiredFieldValidator ID="requiredCantidad"
                                                            ControlToValidate="cantidad"
                                                            runat="server"
                                                            ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <asp:Label Text="Se vende por" runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"unidadMedida")%>' runat="server" />
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnAgregar" Text="Agregar al carrito" runat="server" 
                                                CommandName="agregar"
                                                CommandArgument='<%# ((DataListItem)Container).ItemIndex%>'
                                                CssClass="btn btn-outline-primary" />
                                            <asp:Button ID="btnFinalizar" Text="Finalizar compra" runat="server" 
                                                CommandName="finalizar"
                                                CommandArgument='<%# ((DataListItem)Container).ItemIndex%>'
                                                CssClass="btn btn-outline-info" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <%--Piecito del card--%>
                <div class="card-footer">
                    <h5 class="card-title text-center">Distribuciones del Pacífico</h5>
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="Productos" runat="server" ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [codigoBarra], [descripcion], [precioCompra], [precioVenta], [exento], [estado], [unidadMedida], [cantidad], [idCategoria], [porcentajeIVA], [porcentajeIV], [foto] FROM [Productos] WHERE ([estado] = @estado)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Activo" Name="estado" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
