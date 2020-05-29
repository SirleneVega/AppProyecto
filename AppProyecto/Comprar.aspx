<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="AppProyecto.Comprar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <asp:DataList ID="myDataList" runat="server"
            OnItemCommand="myDataList_ItemCommand"
            CssClass="table table-striped table-dark">
                    <HeaderTemplate>
                                <th scope="col">Codigo</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Precio por unidad</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Sub total</th>
                                <th scope="col">Opciones</th>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <th scope="row">
                                <asp:Label ID="idCodigo" Text='<%# DataBinder.Eval(Container.DataItem, "Codigo") %>' runat="server" />
                            </th>
                            <td><%# DataBinder.Eval(Container.DataItem, "Descripción") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Precio por unidad") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Cantidad") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Sub toal") %></td>
                            <td>
                                <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target='#--<%# DataBinder.Eval(Container.DataItem,"Codigo")%>'>Modificar</button>
                            </td>

                        <div id='--<%# DataBinder.Eval(Container.DataItem,"Codigo")%>'
                                class="modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Seleccione la acción a realizar</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true"></span>
                                            </button>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"Descripción")%>' runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <asp:Label Text="Existencias" runat="server" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:Label Text='<%# this.maxCantidad(DataBinder.Eval(Container.DataItem,"Codigo").ToString())%>' runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <asp:Label Text="Seleccione la  nueva cantidad" runat="server" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="cantidad" TextMode="Number" CssClass="form-control" min="1" max='<%# this.maxCantidad(DataBinder.Eval(Container.DataItem,"Codigo").ToString())%>' runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            

                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnModificar" Text="Modificar" runat="server" 
                                                CommandName="modificar"
                                                CommandArgument='<%# ((DataListItem)Container).ItemIndex%>'
                                                CssClass="btn btn-outline-primary" 
                                                CausesValidation="false"/>
                                            <asp:Button ID="btnFinalizar" Text="Eliminar" runat="server" 
                                                CommandName="eliminar"
                                                CommandArgument='<%# ((DataListItem)Container).ItemIndex%>'
                                                CssClass="btn btn-outline-info"
                                                CausesValidation="false"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    </ItemTemplate>
        </asp:DataList>


        <div class="container" style="margin-top:3%;">
            <div class="form-group text-center">
                <div>
                    <h2>Selecione su metodo de pago</h2>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label Text="Metodo de pago" runat="server" />
                        </div>
                        <div class="col-md-5 ">
                            <asp:DropDownList ID="dropMetodoPago" CssClass="form-control" runat="server" OnSelectedIndexChanged="dropMetodoPago_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="" Selected="True" />
                                <asp:ListItem Text="Efectivo" />
                                <asp:ListItem Text="Tarjeta" />
                                <asp:ListItem Text="Cheque" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requeriedMetodoPago"
                                    ControlToValidate="dropMetodoPago"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                    </div>
                </div>

                <div id="idMetodoP" runat="server">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Numero de cheque" runat="server" />
                            </div>
                            <div class="col-md-5">
                                <asp:TextBox ID="txtNumeroCheque" TextMode="Number" CssClass="form-control" runat="server" />
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requeriedNumero"
                                    ControlToValidate="txtNumeroCheque"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Banco" runat="server" />
                            </div>
                            <div class="col-md-5 ">
                                <asp:DropDownList ID="dropBancos" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="" />
                                    <asp:ListItem Text="Banco de Costa Rica" />
                                    <asp:ListItem Text="Banco Nacional" />
                                    <asp:ListItem Text="Banco Popular" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requeriedBanco"
                                    ControlToValidate="dropBancos"
                                    runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Button ID="btnRealizarCompra" Text="Finalizar compra" CssClass="btn btn-outline-primary" OnClick="btnRealizarCompra_Click" runat="server" />
            </div>
        </div>

    </div>


</asp:Content>

