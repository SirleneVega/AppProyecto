//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class DetalleFacturas
    {
        public int idFactura { get; set; }
        public string idProducto { get; set; }
        public int cantidad { get; set; }
        public decimal subTotal { get; set; }
    
        public virtual Facturas Facturas { get; set; }
        public virtual Productos Productos { get; set; }
    }
}
