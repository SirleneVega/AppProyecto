<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AgregarRol.aspx.cs" Inherits="AppProyecto.AgregarRol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="container-fluid text-center">
            <div class="form-group justify-content-center" style="margin-top: 3%;">

                <div class="card">
                    <div class="card-header alert-primary">
                        <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <h4 class="card-title">Crear rol</h4>

                        </div>
                    </div>
                </div>
                    </div>
                    <div class="card-body">
                        <asp:DataList ID="Pantallas" runat="server"
                            OnItemCommand="Pantallas_ItemCommand"
                            DataSourceID="bdPantallas"
                            RepeatDirection="Horizontal"
                            RepeatColumns="3"
                            AlternatingItemStyle-Wrap="true"
                            CssClass="table table-responsive-lg">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-header alert-primary">
                                        <h5 class="card-title text-center ">Pantalla: 
                                        <asp:Label ID="lblPantalla"
                                            Text='<%# DataBinder.Eval(Container.DataItem,"idPantalla") %>'
                                            runat="server" />
                                        </h5>
                                    </div>
                                    <div class="card-body" style="text-align: left">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <asp:Label Text="Pantalla: " runat="server" />
                                                </div>
                                                <div class="row">
                                                    <asp:Label ID="lblDescripción"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"descripcion") %>'
                                                    Font-Bold="true"
                                                    runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer alert-primary">
                                        <asp:Button ID="btnAgregar" Text="Agregar Pantalla" runat="server"
                                            CommandName="agregar"
                                            CommandArgument='<%# ( (DataListItem) Container).ItemIndex %>'
                                            CssClass="btn btn-dark"
                                            CausesValidation="false"/>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <div class="card-footer alert-primary">
                        <button id="btnAgregarPantalla" type="button" class="btn btn-outline-dark" data-toggle="modal"
                            data-target="#ElIdQueTodoLoPuede">
                            Crear rol
                        </button>

                    </div>
                </div>


                <div id="ElIdQueTodoLoPuede"
                    class="modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Creación rol</h5>
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
                                            <asp:Label Text="Descripción del rol" runat="server" />
                                        </div>
                                        <div class="col-md-6 text-left">
                                            <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server" />
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="requeriedDescripcion"
                                                ControlToValidate="txtDescripcion"
                                                runat="server"
                                                ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnAgregar" Text="Crear rol" runat="server"
                                    CssClass="btn btn-outline-dark" OnClick="btnAgregar_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="bdPantallas" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [idPantalla], [descripcion] FROM [Pantallas]" />

</asp:Content>
