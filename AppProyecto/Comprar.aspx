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
                                            <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"Descripción")%>' runat="server" />
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnFinalizar" Text="Eliminar" runat="server" 
                                                CommandName="eliminar"
                                                CommandArgument='<%# ((DataListItem)Container).ItemIndex%>'
                                                CssClass="btn btn-outline-info" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                    </ItemTemplate>
                </asp:DataList>
    </div>
                

</asp:Content>

