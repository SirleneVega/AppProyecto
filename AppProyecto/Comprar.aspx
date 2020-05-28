<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="AppProyecto.Comprar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="form-group">
            <div class="text-center">
                <h2>Carrito</h2>
            </div>
            <div>
            </div>

            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Precio por unidad</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Sub total</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%--<asp:DataList ID="listatabla" runat="server"
                        OnItemCommand="listatabla_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <th scope="row"><%this.detalleFacturas. %></th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>--%>


                    <% 
                        foreach (BLL.DetalleFactura detalle in detalleFacturas)
                        { Response.Write(
                             "<tr>" +
                                 "<th scope='row' ID='id" + contador + "'>" + detalle.codigoDeBarra + "</th>" +
                                 "<td>" + detalle.descripcion + "</td>" +
                                 "<td>" + (detalle.subTotal) / (detalle.cantidad) + "</td>" +
                                 "<td>" + detalle.cantidad + "</td>" +
                                 "<td>" + detalle.subTotal + "</td>" +
                                 "<td>" +
                                     "<button type='button' class='btn btn-outline-info' ID='idBTN" + detalle.codigoDeBarra + "' data-toggle='modal' data-target='#ID"+detalle.codigoDeBarra+"'>Modificar</button>" +
                                 "</td>" +
                             "</tr>"+
                             "<div  ID='ID"+detalle.codigoDeBarra+"' class='modal' tabindex='-1' role='dialog'>"+
                                "<div class='modal-dialog modal-dialog-centered' role='document'>"+
                                    "<div class='modal-content'>"+
                                        "<div class='modal-header'>"+
                                            "<h5 class='modal-title'>Seleccione la acción a realizar</h5>"+
                                           " <button type='button' class='close' data-dismiss='modal' aria-label='Close'>"+
                                                "<span aria-hidden='true'></span>"+
                                           " </button>"+
                                            "<button type='button' class='close' data-dismiss='modal' aria-label='close'>"+
                                                "<span aria-hidden='true'>&times;</span>"+
                                           " </button>"+
                                       " </div>"+
                                        "<div class='modal-body'>"+

                                        "</div>"+
                                        "<div class='modal-footer'>"+
                                            "<asp:Button ID='btnAgregar' Text='Agregar al carrito' runat='server' "+
                                               " CommandName='agregar'"+
                                               " CommandArgument=''"+
                                               " CssClass='btn btn-outline-primary' />"+
                                            "<asp:Button ID='btnFinalizar' Text='Finalizar compra' runat='server' "+
                                               " CommandName='finalizar'"+
                                               " CommandArgument=''"+
                                                "CssClass='btn btn-outline-info' />"+
                                        "</div>"+
                                    "</div>"+
                                "</div>"+
                           " </div>"
                             
                             
                             );



                            this.contador = this.contador + 1;
                        }
                         %>


                </tbody>
               
            </table>
                       <%--modal de acciones--%>


        </div>
    </div>

</asp:Content>

