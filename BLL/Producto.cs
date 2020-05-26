using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Producto
    {
        public String Foto { set; get; }
        public String codigoDeBarra { set; get; }
        public String Descripcion { set; get; }
        public int precioCompra { set; get; }
        public int precioIV { set; get; }
        public int precioIVA { set; get; }
        public String exento { set; get; }
        public String unidadMedia { set; get; }
        public double precioVenta { set; get; }
        public Boolean estado { set; get; }
        public int cantidad { set; get; }
    }
}
