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
                            <h4 class="card-title">Cambiar rol</h4>

                        </div>
                    </div>
                </div>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="row" style="margin-right: auto; margin-left: auto;">
                                <div class="col-md-4">
                                    <asp:Label Text="Seleccione el usuario" runat="server" />
                                </div>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="dropUsuario" CssClass="form-control" runat="server" DataSourceID="bdUsuarios" DataTextField="nombreCompleto" DataValueField="email">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" style="margin-right: auto; margin-left: auto;">
                                <div class="col-md-4">
                                    <asp:Label Text="Seleccione el nuevo rol" runat="server" />
                                </div>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="dropProveedor" CssClass="form-control" runat="server" DataSourceID="bdRoles" DataTextField="descripcion" DataValueField="idRol">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer alert-primary">
                        <div class="row">
                            <div class=" col-md-12">
                                <asp:Button ID="btnCambiarRol" CssClass="btn btn-outline-primary" Text="Asociar"
                                    OnClick="btnCambiarRol_Click" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="bdUsuarios" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [email], [nombreCompleto] FROM [Usuarios]" />
    <asp:SqlDataSource ID="bdRoles" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [idRol], [descripcion] FROM [Roles]" />

</asp:Content>
