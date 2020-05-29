<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CatalogoUsuarios.aspx.cs" Inherits="AppProyecto.CatalogoUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container container-fluid">
        <div class="justify-content-center text-center">
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
                <asp:DataList runat="server"
                    ID="listaUsuarios"
                    DataSourceID="tblUsuarios"
                    RepeatDirection="Horizontal"
                    RepeatColumns="2"
                    AlternatingItemStyle-Wrap="true"
                    CssClass="table table-responsive-lg"
                    DataKeyField="email">
                    <ItemTemplate>
                        <div class="card">
                            <%--Header--%>
                            <div class="card-header alert-primary">
                                <h5 class="card-title text-center ">Usuario: 
                                        <asp:Label ID="lblCorreo"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"email") %>'
                                            runat="server" />
                                    </h5>
                            </div>

                            <%--body--%>
                            <div class="card-body" style="text-align: left">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Nombre: " runat="server" />
                                            <asp:Label ID="lblNombreC"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"nombreCompleto") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Email: " runat="server" />
                                            <asp:Label ID="lblEmail"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"email") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Cedula: " runat="server" />
                                            <asp:Label ID="lblCedulaC"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"cedula") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--Piecito--%>
                            <div class="card-footer alert-primary">
                                <div class="row">
                                    <div class="col-md-12">
                                        <button type="button" class="btn btn-dark" data-toggle="modal"
                                            data-target='#ID<%# DataBinder.Eval(Container.DataItem,"email").ToString().Replace("@","").Replace(".","") %>'>
                                            Más información
                                        </button>
                                    </div>
                                </div>
                                </>
                            </div>

                            <%--Modal--%>
                            <div id='ID<%# DataBinder.Eval(Container.DataItem,"email").ToString().Replace("@","").Replace(".","") %>'
                                class="modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header alert-primary text-center">
                                            <h class="modal-title">Datos del usuario</h>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Email: " runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label ID="Label6"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"email") %>'
                                                            Font-Bold="true"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Nombre: " runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label ID="Label1"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"nombreCompleto") %>'
                                                            Font-Bold="true"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Cedula: " runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label ID="Label2"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"cedula") %>'
                                                            Font-Bold="true"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Tipo de cédula: " runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label ID="Label3"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"tipoCedula") %>'
                                                            Font-Bold="true"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Teléfono: " runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label ID="Label4"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"telefono") %>'
                                                            Font-Bold="true"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <asp:Label Text="Dirección: " runat="server" />
                                                    </div>
                                                    <div class="col-md-7 text-left">
                                                        <asp:Label ID="Label5"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"direccion") %>'
                                                            Font-Bold="true"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer alert-primary">
                                            <asp:Button ID="btnModificar" Text="Cerrar" runat="server"
                                                CssClass="btn btn-dark "
                                                data-dismiss="modal" />
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

    <%--Contenido de la bases de datos--%>
    <asp:SqlDataSource ID="tblUsuarios" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [email], [tipoCedula], [nombreCompleto], [telefono], [cedula], [direccion], [password] FROM [Usuarios]" />
</asp:Content>
