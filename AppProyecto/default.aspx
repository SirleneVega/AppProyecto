<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="AppProyecto._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Todo el contenido --%>
    <div class="contenidoDefault">
        <%-- Carousel --%>
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <%-- Insertar imagenes para carousel --%>
                    <img src="www/css/img/1.jfif" class="d-block w-100 imganesCarousel imganesCarousel" alt="...">
                </div>
                <div class="carousel-item">
                    <%-- Insertar imagenes para carousel --%>
                    <img src="www/css/img/1.jfif" class="d-block w-100 imganesCarousel" alt="...">
                </div>
                <div class="carousel-item">
                    <%-- Insertar imagenes para carousel --%>
                    <img src="www/css/img/1.jfif" class="d-block w-100 imganesCarousel" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <h3 class="text-center font-italic" style="margin-top: 1%;">Productos de primera</h3>

        <div class="card-deck" style="margin-top: 2%;">
            <div class="card">
                <%-- Producto tipo 1 --%>
                <div align="center">
                    <img alt="Cambiar imagen" class="difuminado" width="400" height="400" onmouseout="this.src='www/css/img/2.jfif';" onmouseover="this.src='www/css/img/1.jfif';" src="www/css/img/2.jfif" />

                </div>

                <div class="card-body">
                    <h5 class="card-title">Imagen1</h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
            </div>

            <div class="card">
                <div align="center">
                    <img alt="Cambiar imagen" class="difuminado2" width="400" height="400" onmouseout="this.src='www/css/img/1.jfif';" onmouseover="this.src='www/css/img/2.jfif';" src="www/css/img/1.jfif" />
                </div>
                <div class="card-body">
                    <h5 class="card-title">Imagen2</h5>
                    <p class="card-text">.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
            </div>
            <div class="card">
                <div align="center">
                    <img alt="Cambiar imagen" width="400" class="difuminado" height="400" onmouseout="this.src='www/css/img/2.jfif';" onmouseover="this.src='www/css/img/1.jfif';" src="www/css/img/2.jfif" />
                </div>
                <div class="card-body">
                    <h5 class="card-title">Imagen3</h5>
                    <p class="card-text">.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
            </div>
        </div>


    </div>




</asp:Content>
