<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppProyecto.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="container col-lg-6 col-md-6 col-sm-6 col-xl-6 text-center TextoContenido">
            <div class=" justify-content-center text-center">
                
                <%--titulo formulario--%>
                <div class="form-group mt-4">
                    <div class="row">
                        <div class=" col-md-12">
                            <asp:Label Text="Login" runat="server" />
                        </div>
                    </div>
                </div>

                <%--correo--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label Text="Email: " runat="server" />
                        </div>

                        <div class="col-md-8">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="correo@domain.com" MaxLength="50" TextMode="Email" runat="server" />
                        </div>

                        <%--Validador dde campo reuerido--%>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="requiredEmail"
                                ErrorMessage="Por favor llenar Email"
                                ControlToValidate="txtEmail"
                                runat="server"
                                ForeColor="red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <%--contraseña--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label Text="Contraseña: " runat="server" />
                        </div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txtContrasena" CssClass="form-control" runat="server" placeholder="********" TextMode="Password" />
                        </div>

                        <%--Validador de campo requerido--%>
                        <div class="col-md-1">
                            <asp:RequiredFieldValidator ID="requiredTxtContrasena"
                                ErrorMessage="Por favor llenar Contraseña"
                                ControlToValidate="txtContrasena"
                                runat="server"
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>

                <%--Contenedor apra mostrar los mensajes de validación dde campos obligatorios--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12 text-left">
                            <asp:ValidationSummary
                                ID="validaciones"
                                ForeColor="black"
                                DisplayMode="BulletList"
                                HeaderText="Datos requeridos"
                                Font-Names="verdana"
                                Font-Size="12"
                                runat="server" />
                        </div>
                    </div>
                </div>

                <%--boton login--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnIniciarSesion" CssClass="btn btn-outline-primary my-2 my-sm-0" Text="Iniciar Sesión" 
                                OnClick="btnIniciarSesion_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
