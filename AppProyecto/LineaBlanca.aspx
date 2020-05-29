<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LineaBlanca.aspx.cs" Inherits="AppProyecto.LineaBlanca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-lg-10 mt-05">
        <div class="justify-content-center text-center">
            <%--aqui se maneja el registro de proveedores--%>
            <div class="blog-card toast-body">
                <div class="card-header alert-primary">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="card-title">Linea Blanca</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" container-fluid col-lg-8 mt-05">
                    <div id="Carousel" class="carousel alert-primary mt-5" data-ride="carousel">
                        <%--creacion de los  indicadores para el carousel--%>
                        <ul class="carousel-indicators">
                            <asp:Repeater ID="ulList" runat="server" DataSourceID="dataSource">
                                <ItemTemplate>
                                    <li data-target="#Carousel" data-slide-to='ID<%# Eval("codigoBarra") %>' class="active"></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <%--creacion de slide  para  el  carousel--%>
                        <div class="carousel-inner text-center">
                            <asp:Repeater ID="ulInner" runat="server" DataSourceID="dataSource">
                                <ItemTemplate>
                                    <div <% if (this.contador == 0)
                                        {
                                            this.contador++;
                                            Response.Write("class='carousel-item active'");
                                        }
                                        else
                                        {
                                            Response.Write("class='carousel-item'");
                                        }%>>

                                        <%--escribimos  el contenido de cada item del  carousel--%>
                                        <div class="form-group">
                                            <%--aqui  ubicamos la foto  del  cliente--%>
                                            <div class="row">
                                                <div class="col-md-12" style="margin-top: 2%">
                                                    <img src='Productos/<%# Eval("foto") %>'
                                                        alt='<%# Eval("descripcion") %>'
                                                        class="img-fluid rounded"
                                                        style="width: 400px; height: 300px" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12" style="margin-bottom: 2%">
                                                    <div class="ItemCarousel">
                                                        <h3><%# Eval("descripcion") %></h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <a class="carousel-control-prev" href="#Carousel" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#Carousel" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <asp:DataList
                        ID="lista"
                        runat="server"
                        RepeatDirection="Horizontal"
                        RepeatColumns="4"
                        DataSourceID="dataSource"
                        AlternatingItemStyle-Wrap="true"
                        CssClass="table table-responsive-lg"
                        DataKeyField="codigoBarra">
                        <ItemTemplate>
                            <div class="card">
                                <div class="card-header alert-dark">
                                    <h5 class="card-title text-center ">
                                        <asp:Label
                                            Text='<%# DataBinder.Eval(Container.DataItem,"descripcion") %>'
                                            runat="server" />
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <img class="img-fluid img-thumbnail"
                                                src='Productos/<%# DataBinder.Eval(Container.DataItem,"foto") %>'
                                                alt='<%# DataBinder.Eval(Container.DataItem,"codigoBarra") %>'
                                                style="width: 300px; height: 200px" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Descripcion del producto:  " runat="server" />
                                            <asp:Label ID="lblDescripcion"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"descripcion") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Precio Venta:  " runat="server" />
                                            <asp:Label ID="precioC"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"precioVenta") %>'
                                                Font-Bold="true"
                                                runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label Text="Precio de venta:  $" runat="server" />
                                            <asp:Label ID="precioD"
                                                Text='<%# (((Decimal) DataBinder.Eval(Container.DataItem, "precioVenta"))/
                                             ((Decimal) Session["TipoCambio"]) ).ToString("0.00")%>'
                                               Font-Bold="true" runat="server" />
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
    <asp:SqlDataSource ID="dataSource" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>'
        SelectCommand="SELECT [codigoBarra], [precioCompra], [precioVenta], [descripcion], [exento], [estado], [unidadMedida], [cantidad], [idCategoria], [foto], [porcentajeIV], [porcentajeIVA] FROM [Productos] WHERE ([idCategoria] = @idCategoria)">


        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="idCategoria" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
