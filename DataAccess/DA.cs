using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public static class DA
    {
        /// <summary>
        /// Retorna la cadena de conexion especificada en el Web config
        /// </summary>
        /// <returns>Cadena de conexion</returns>
        public static string GetConexionDB()
        {
            return ConfigurationManager.ConnectionStrings["connDB"].ConnectionString.ToString();
        }
    }
}
