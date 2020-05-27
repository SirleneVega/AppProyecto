<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="AppProyecto.AgregarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center" style="margin-top: 3%">
        <div class="form-group mt-4">
            <div class="row">
                <div class=" col-md-12">
                    <h3 class="font-italic">Agregar Productos</h3>
                </div>
            </div>
        </div>


        <div class=" col-md-12">
            <h1 style="color: mediumaquamarine">__________________________________</h1>
        </div>

        <div class="container text-center" style="margin-top: 3%">
            <%--Codigo de barras, descripcion--%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Codigo de barras" runat="server" />
                                <asp:TextBox ID="txtCodigo" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtCodigo"
                                    ErrorMessage="Por favor ingresar el codigo de barras"
                                    ControlToValidate="txtCodigo"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Descripcion del producto" runat="server" />
                                <asp:TextBox ID="txtDescripcion" CssClass="form-control text-xl-center" runat="server" MaxLength="60" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtDescripcion"
                                    ErrorMessage="Por favor ingresar la descripcion"
                                    ControlToValidate="txtDescripcion"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%--cantidad precio y porcentajes--%>
            <div class="row" style="margin-top: 1%">

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Precio del producto" runat="server" />
                                <asp:TextBox ID="txtPrecio" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtPrecio"
                                    ErrorMessage="Por favor ingresar el precio del producto"
                                    ControlToValidate="txtPrecio"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Porcentaje IV" runat="server" />
                                <asp:TextBox ID="txtPorcetajeIV" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtPorcetajeIV"
                                    ErrorMessage="Por favor ingresar el porcentaje de IV"
                                    ControlToValidate="txtPorcetajeIV"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Porcentaje IVA" runat="server" />
                                <asp:TextBox ID="txtPorcentajeIVA" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" />
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10 text-left">
                                <asp:RequiredFieldValidator ID="requiredTxtPorcetajeIVA"
                                    ErrorMessage="Por favor ingresar el porcentaje de IVA"
                                    ControlToValidate="txtPorcentajeIVA"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <%--cantidad, exento, unidad de medida --%>
            <div class="row">

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Cantidad de productos" runat="server" />
                                <asp:TextBox ID="txtCantidad" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtCantidad"
                                    ErrorMessage="Por favor ingresar la cantidad de productos"
                                    ControlToValidate="txtCantidad"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Precio Venta" runat="server" />
                                <asp:TextBox ID="txtPrecioVenta" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtPrecioVenta"
                                    ErrorMessage="Por favor ingresar el precio venta"
                                    ControlToValidate="txtPrecioVenta"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Exento" runat="server" />
                                <asp:DropDownList ID="txtExcento" runat="server">
                                    <asp:ListItem Text="Seleccione una opcion" />
                                    <asp:ListItem Text="Si" />
                                    <asp:ListItem Text="No" />
                                </asp:DropDownList>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10 text-left">
                                <asp:RequiredFieldValidator ID="requiredTxtExento"
                                    ErrorMessage="Por favor ingresar el porcentaje de IVA"
                                    ControlToValidate="txtExcento"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%-- unidad de medida--%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Unidad de medida" runat="server" />
                                <asp:TextBox ID="txtUnidad" CssClass="form-control text-xl-center" runat="server" MaxLength="15"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Estado" runat="server" />
                                <asp:DropDownList runat="server" ID="txtEstadoP" CssClass="form-control">
                                    <asp:ListItem Text="Seleccione un estado" />
                                    <asp:ListItem Text="Activo" />
                                    <asp:ListItem Text="Inactito" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtEstadoP"
                                    ErrorMessage="Por favor ingresar la descripcion"
                                    ControlToValidate="txtEstadoP"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%--cantidad categoria, cantidad, foto--%>
            <div class="row" style="margin-top: 1%">

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Categoria del producto" runat="server" />
                                <asp:DropDownList runat="server" ID="dropCategoria" CssClass="form-control text-xl-center" DataSourceID="dataCategorias" DataTextField="descripcion" DataValueField="idCategoria">
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredDropCategoria"
                                    ErrorMessage="Por favor ingresar la categoria del producto"
                                    ControlToValidate="dropCategoria"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-6" style="margin-top: 1.5%">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">
                                <asp:Label Font-Bold="true" Text="Foto" runat="server" />
                            </div>
                            <div class="col-md-9 text-left">
                                <asp:FileUpload Font-Bold="true" ID="fileUpload" runat="server" BorderStyle="None" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10 text-left">
                                <asp:ValidationSummary
                                    ForeColor="Red" ID="validaciones"
                                    DisplayMode="BulletList"
                                    runat="server"
                                    HeaderText="Por favor agregar la foto"
                                    Font-Names="verdana" Font-Size="12" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


             <div class="form-group mt-5">
                <div class="row">
                    <div class=" col-md-12">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-outline-primary" Text="Agregar"
                            OnClick="btnAgregar_Click" runat="server" />
                    </div>
                </div>
            </div>
            
        </div>



    </div>

    <asp:SqlDataSource runat="server" ID="dataCategorias" ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>' SelectCommand="SELECT [idCategoria], [descripcion] FROM [CategoriaProductos]" />


</asp:Content>
