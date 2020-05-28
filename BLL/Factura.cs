using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Factura
    {
        public String tipoPago { set; get; }
        public double subTotal { set; get; }
        public double montoImpuesto { set; get; }
        public double descuento { set; get; }
        public double montoTotal { set; get; }
        public String idCliente { set; get; }
        public double transporte { set; get; }
        public int numeroCheque { set; get; }
        public string entidadBancaria { set; get; }
    }
}
