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
        public double motoTotal { set; get; }
        public String idCliente { set; get; }

    }
}
