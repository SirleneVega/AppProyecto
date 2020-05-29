<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AsociarProveedor.aspx.cs" Inherits="AppProyecto.AsociarProveedor" %>
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
                            <h4 class="card-title">Asociar provedores</h4>

                        </div>
                    </div>
                </div>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="row" style="margin-right: auto; margin-left: auto;">
                                <div class="col-md-4">
                                    <asp:Label Text="Seleccione el producto" runat="server" />
                                </div>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="dropProducto" CssClass="form-control" runat="server" DataSourceID="bdProductos" DataTextField="descripcion" DataValueField="codigoBarra">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row" style="margin-right: auto; margin-left: auto;">
                                <div class="col-md-4">
                                    <asp:Label Text="Seleccione el proveedor" runat="server" />
                                </div>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="dropProveedor" CssClass="form-control" runat="server" DataSourceID="bdProveedores" DataTextField="nombreComercial" DataValueField="cedulaLegal">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer alert-primary">
                        <div class="row">
                            <div class=" col-md-12">
                                <asp:Button ID="btnAsosiar" CssClass="btn btn-outline-primary" Text="Asociar"
                                    OnClick="btnAsosiar_Click" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="bdProveedores" runat="server" 
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [cedulaLegal], [nombreComercial] FROM [Proveedores]" />
    <asp:SqlDataSource ID="bdProductos" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [codigoBarra], [descripcion] FROM [Productos]" />
</asp:Content>
