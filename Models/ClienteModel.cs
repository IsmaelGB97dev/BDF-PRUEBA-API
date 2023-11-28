using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ClienteModel
    {
        public int idCliente { get; set; }
        public string numeroIdentificacion { get; set; }
        public TipoIdentificacionModel tipoIdentificacion { set; get; }
        public string primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public DireccionModel direccion { set; get; }
        public bool estado { get; set; }
    }
}
