using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class PrestamoModel
    {
        public int numeroPrestamo { get; set; }
        public TipoPrestamoModel tipoPrestamo { get; set; }
        public ClienteModel cliente { get; set; }
        public DateTime fechaInicio { get; set; }
        public DateTime fechaFin { get; set; }
        public decimal montoSolicitado { get; set; }
        public MonedaModel moneda { get; set; }
        public decimal montoAprobado { get; set; }
        public int plazoFinanciamiento { get; set; }
        public bool estado { get; set; }

    }
}
