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
   

        <div class=" col-md-12 ">
            <h1 style="color: mediumaquamarine">__________________________________</h1>
        </div>
    </div>
        <div class="container text-center" style="margin-top: 3%">
            <%--Codigo de barras, descripcion--%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Codigo de barras" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
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
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Descripcion del producto" runat="server" />
                            </div>
                          </div>  
                        <div class="row">
                            <div class="col-md-11"> 
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


            <%--cantidad, exento--%>
            <div class="row">

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Cantidad de productos" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
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

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Exento" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
                                <asp:DropDownList ID="txtExcento" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="" />
                                    <asp:ListItem Text="Sí" />
                                    <asp:ListItem Text="No" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtExento"
                                    ErrorMessage="Por favor ingresar excento"
                                    ControlToValidate="txtExcento"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%-- unidad de medida, estado--%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Unidad de medida" runat="server" />
                            </div>
                        </div>
                        <div class=" row">
                            <div class="col-md-11">
                                <asp:TextBox ID="txtUnidad" CssClass="form-control text-xl-center" runat="server" MaxLength="15"/>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="RequiredFieldtxtUnidad"
                                    ErrorMessage="Por favor ingresar la unidad de medida"
                                    ControlToValidate="txtUnidad"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Precio de compra" runat="server" />                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
                                <asp:TextBox ID="txtPrecioCompra" CssClass="form-control text-xl-center" runat="server" MaxLength="15" TextMode="Number" min="1"/>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtEstadoP"
                                    ErrorMessage="Por favor ingresar el precio de compra"
                                    ControlToValidate="txtPrecioCompra"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%--cantidad categoria, foto--%>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Categoria del producto" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
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

                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Font-Bold="true" Text="Foto" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
                                <asp:FileUpload Font-Bold="true" ID="fileUpload" runat="server" BorderStyle="None" />
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="RequiredFieldFileUpload"
                                    ErrorMessage="Por favor ingresar la foto"
                                    ControlToValidate="fileUpload"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--validaciones--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <asp:ValidationSummary
                            ForeColor="Red" ID="validaciones"
                            DisplayMode="BulletList"
                            runat="server"
                            HeaderText="Por favor llenar los siguiente campos"
                            Font-Names="verdana" 
                            CssClass="text-left"
                            Font-Size="12" />
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

    <asp:SqlDataSource runat="server" ID="dataCategorias" ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>' SelectCommand="SELECT [idCategoria], [descripcion] FROM [CategoriaProductos]" />


</asp:Content>
