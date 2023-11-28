using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace UTILS
{
    /// <summary>
    /// Clase con las propiedades para encapsular diversas respuestas, con metodos para el registro de errores
    /// </summary>
    public class Respuesta
    {
        public bool exito { get; set; } = true;
        public object dato { get; set; }
        public string mensaje { get; set; } = "";

        /// <summary>
        /// Establecer exito en false y un mensaje que es devuelto en el objeto Respuesta
        /// </summary>
        /// <param name="mensaje">Mensaje de advertencia</param>
        public void SetAdvertencia(string mensaje)
        {
            exito = false;
            if (string.IsNullOrEmpty(this.mensaje))
                this.mensaje = mensaje;
        }

        /// <summary>
        /// Establece el exito en false y registra un error en la carpeta Log en el directorio raiz del API
        /// </summary>
        /// <param name="mensajeError">Mensaje de error Exeption.ToString() / Mensaje</param>
        /// <param name="archivo">Nombre de archivo/metodo donde ocurre la incidencia</param>
        public void SetError(string mensajeError, string archivo)
        {
            exito = false;
            RegistrarErrorLog(mensajeError, archivo);
        }


        /// <summary>
        /// Registrar error en un archivo generado, por mes del año, en la carpeta Log en la raiz de la API
        /// </summary>
        /// <param name="mensaje">Mensaje de error</param>
        /// <param name="archivo">Archivo/Metodo donde ocurre la incidencia</param>
        private void RegistrarErrorLog(string mensaje, string archivo)
        {
            string raizProyecto = HttpContext.Current.Server.MapPath("~/Logs");
            string mesAnio = DateTime.Now.ToString("MMMM") + "_" + DateTime.Now.ToString("yyyy") + ".txt";
            string rutaArchivo = Path.Combine(raizProyecto, mesAnio);
            string fecha = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt");

            using (StreamWriter sw = new StreamWriter(rutaArchivo, true))
            {
                sw.WriteLine(fecha + " - [" + archivo + "] - " + mensaje + "\n");
            }
        }
    }
}
