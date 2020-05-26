<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="AppProyecto.AgregarProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center" style="margin-top: 3%">
        <div class="form-group mt-4">
            <div class="row">
                <div class=" col-md-12">
                    <h3 class="font-italic">Agregar Proveedor</h3>
                </div>
            </div>
        </div>


        <div class=" col-md-12">
            <h1 style="color: mediumaquamarine">_______________________________</h1>
        </div>

        <div class="container text-center" style="margin-top: 3%">
            <%--CEDULA - compania --%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Cedula Juridica" runat="server" />
                                <asp:TextBox ID="txtCedula" CssClass="form-control text-xl-center" runat="server" placeholder="0-000-000000" MaxLength="15" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtCedula"
                                    ErrorMessage="Por favor ingrese la cedula juridica"
                                    ControlToValidate="txtCedula"
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
                                <asp:Label Font-Bold="true" Text="Nombre Compañia" runat="server" />
                                <asp:TextBox ID="txtNombreC" CssClass="form-control text-xl-center" runat="server" MaxLength="15" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtNombreC"
                                    ErrorMessage="Por favor ingresar el nombre de la Compañia"
                                    ControlToValidate="txtNombreC"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%--telefono-direccion - --%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Telefono" runat="server" />
                                <asp:TextBox ID="txtTelefono" CssClass="form-control text-xl-center" runat="server" placeholder="0000-0000" MaxLength="15" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTelefono"
                                    ErrorMessage="Por favor ingresar el numero de telefono"
                                    ControlToValidate="txtTelefono"
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
                                <asp:Label Font-Bold="true" Text="Direccion" runat="server" />
                                <asp:TextBox ID="txtDireccion" CssClass="form-control text-xl-center" runat="server" MaxLength="15" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredDireccion"
                                    ErrorMessage="Por favor ingresar la direccion"
                                    ControlToValidate="txtDireccion"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



  <%--telefono-direccion - --%>

            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label Font-Bold="true" Text="Contacto" runat="server" />
                                <asp:TextBox ID="txtContacto" CssClass="form-control text-xl-center" runat="server" MaxLength="15" />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtContacto"
                                    ErrorMessage="Por favor ingresar el contacto"
                                    ControlToValidate="txtTelefono"
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
                                <asp:Label Font-Bold="true" Text="Email" runat="server" />
                                <asp:TextBox ID="txtEmail" CssClass="form-control text-xl-center" runat="server" MaxLength="15"  />
                            </div>

                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtEmail"
                                    ErrorMessage="Por favor ingresar el correo"
                                    ControlToValidate="txtEmail"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
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

</asp:Content>
