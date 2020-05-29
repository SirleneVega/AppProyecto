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
													style="width:300px;height:200px"/>
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
                                            <asp:Label ID="Label1"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"precioVenta") %>'
                                                Font-Bold="true"
                                                runat="server" />
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
