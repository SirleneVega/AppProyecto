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
    
    public partial class Vp_Informe_Facturas
    {
        public int idFactura { get; set; }
        public string tipoPago { get; set; }
        public decimal subTotal { get; set; }
        public decimal MontoImpuesto { get; set; }
        public decimal transporte { get; set; }
        public Nullable<int> numeroCheque { get; set; }
        public string nombreBanco { get; set; }
        public string nombreCompleto { get; set; }
    }
}