using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Producto
    {
        public String foto { set; get; }
        public String codigoDeBarra { set; get; }
        public String descripcion { set; get; }
        public int precioCompra { set; get; }
        public double precioIV { set; get; }
        public double precioIVA { set; get; }
        public String exento { set; get; }
        public String unidadMedia { set; get; }
        public double precioVenta { set; get; }
        public String estado { set; get; }
        public int cantidad { set; get; }

        public void calcularImpuesto()
        {
            this.precioIV = precioCompra * 0.13;
            this.precioIVA = precioCompra * 0.13;

        }

        public void calcularPrecioVenta()
        {
            calcularImpuesto();
            precioVenta = precioCompra * 1.1;
        }

        public void calcularEstado()
        {
            if (this.cantidad>0)
            {
                this.estado = "Activo";
            }
            else
            {
                this.estado = "Inactivo";
            }
        }
    }
    
}
