<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarme.aspx.cs" Inherits="AppProyecto.Registrarme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center" style="margin-top: 3%">
        <div class="form-group mt-4">
            <div class="row">
                <div class=" col-md-12">
                    <h3 class="font-italic">Registro</h3>
                </div>
            </div>
        </div>


        <div class=" col-md-12">
            <h1 style="color: mediumaquamarine">---------------</h1>
        </div>

        <%--Cedula, telefono--%>
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Cedula:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtCedula" CssClass="form-control" runat="server" placeholder="##-####-####" MaxLength="9" />
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="requiredTxtCedula"
                                ErrorMessage="Por favor llenar Cedula"
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
                        <div class="col-md-4">
                            <asp:Label Text="Teléfono:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" TextMode="Number" placeholder="####-####" MaxLength="8" />
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="RequiredTxtTelefono"
                                ErrorMessage="Por favor llenar Cedula"
                                ControlToValidate="txtTelefono"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--Tipo Cedula, nombre Completo--%>
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Tipo Cedula:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList runat="server" ID="txtTipoCedula" CssClass="form-control">
                                <asp:ListItem Text="" />
                                <asp:ListItem Text="Nacional" />
                                <asp:ListItem Text="Extranjero" />
                                <asp:ListItem Text="Residente" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="RequiredTxtTipoCedula"
                                ErrorMessage="Por favor elegir tipo Cedula"
                                ControlToValidate="txtTipoCedula"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-lg-6">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Nombre Completo:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" placeholder="Nombre Apellido1 Apellido2" MaxLength="50" />
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="RequiredTxtNombre"
                                ErrorMessage="Por favor llenar Direccion"
                                ControlToValidate="txtNombre"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--Email, dirección--%>
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Email:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="correo@domain.com" TextMode="Email" MaxLength="50" />
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="requiredTxtEmail"
                                ErrorMessage="Por favor llenar Email"
                                ControlToValidate="txtEmail"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Dirección:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" placeholder="Dirección" MaxLength="30" />
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="RequiredTxtDireccion"
                                ErrorMessage="Por favor llenar Direccion"
                                ControlToValidate="txtDireccion"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--Contraseña--%>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-6" style="margin-left: auto; margin-right: auto">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Contraseña:" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" MaxLength="50" />
                        </div>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="requieredTxtPassword"
                                ErrorMessage="Por favor llenar Contraseña"
                                ControlToValidate="txtPassword"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%--Contenedor para mostrar los mensajes de validación de campos obligatorios--%>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-3 col-md-4 text-left" style="margin-left: auto; margin-right: auto">
                    <asp:ValidationSummary
                        ID="validaciones"
                        ForeColor="black"
                        DisplayMode="List"
                        HeaderText="Datos requeridos"
                        Font-Names="verdana"
                        Font-Size="12"
                        runat="server" />
                </div>
            </div>
        </div>

        <div class="form-group mt-4">
            <div class="row">
                <div class=" col-md-12">
                    <asp:Button ID="btnRegistro" CssClass="btn btn-outline-primary" Text="Registrar" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
