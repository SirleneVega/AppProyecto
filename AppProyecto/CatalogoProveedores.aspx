<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CatalogoProveedores.aspx.cs" Inherits="AppProyecto.CatalogoProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container col-lg-10 mt-05">
        <div class="justify-content-center text-center">
            <%--aqui se maneja el registro de proveedores--%>
            <div class="blog-card toast-body">
                <div class="card-header alert-primary">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="card-title">Catalogo de proveedores</h4>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12 text-right">
                                <a href="AgregarProveedor.aspx" class="btn btn-dark">Agregar</a>
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
                        DataKeyField="cedulaLegal">
                        <ItemTemplate>
                            <div class="card">

                                <div class="card-header alert-primary">
                                    <h5 class="card-title text-center ">Cedula Juridica: 
                                        <asp:Label ID="lblCedula"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"cedulaLegal") %>'
                                            runat="server" />
                                    </h5>
                                </div>

                                <div class="card-body" style="text-align: left">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Nombre de la Compañia: " runat="server" />
                                            <asp:Label ID="lblNombreC"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"nombreComercial") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Telefono: " runat="server" />
                                            <asp:Label ID="lblTelefono"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"telefono") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Direccion: " runat="server" />
                                            <asp:Label ID="lblDireccion"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"direccion") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Contacto: " runat="server" />
                                            <asp:Label ID="lblContacto"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"contacto") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Correo Electronico: " runat="server" />
                                            <asp:Label ID="lblEmail"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"email") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>


                                </div>
                                <%--fin del body--%>

                                <div class="card-footer alert-primary">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button type="button" class="btn btn-dark" data-toggle="modal"
                                                data-target='#ID<%# DataBinder.Eval(Container.DataItem,"cedulaLegal") %>'>
                                                Opciones
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <%--modal de  opciones --%>
                            <div id='ID<%# DataBinder.Eval(Container.DataItem,"cedulaLegal") %>'
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
        SelectCommand="SELECT [cedulaLegal], [nombreComercial], [telefono], [direccion], [contacto], [email] FROM [Proveedores] ORDER BY [cedulaLegal]" />




</asp:Content>
