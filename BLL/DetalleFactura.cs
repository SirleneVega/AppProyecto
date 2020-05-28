using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DetalleFactura
    {
        public String codigoDeBarra { set; get; }
        public int cantidad { set; get; }
        public double subTotal { set; get; }
        public string descripcion { set; get; }

        public void calcularSubTotal(double precio)
        {
            this.subTotal = this.cantidad * precio;
        }
    }
}
