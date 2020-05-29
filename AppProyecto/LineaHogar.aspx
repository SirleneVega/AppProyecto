<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LineaHogar.aspx.cs" Inherits="AppProyecto.LineaHogar" %>
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
                                <h2 class="card-title">Linea Hogar</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <asp:DataList
                        ID="hogar"
                        runat="server"
                        RepeatDirection="Horizontal"
                        RepeatColumns="4"
                        DataSourceID="dataSourceHogar"
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
													  <img class="rounded img-fluid img-thumbnail"
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
        
    <asp:SqlDataSource ID="dataSourceHogar" runat="server" ConnectionString='<%$ ConnectionStrings:DistribuidoraPConnectionString %>' SelectCommand="SELECT [codigoBarra], [descripcion], [precioCompra], [precioVenta], [exento], [unidadMedida], [estado], [cantidad], [idCategoria], [porcentajeIVA], [porcentajeIV], [foto] FROM [Productos] WHERE ([idCategoria] = @idCategoria)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="idCategoria" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
