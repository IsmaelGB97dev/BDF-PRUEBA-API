using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTILS;

namespace LogicaNegocio
{
    public static class CatalogosLN
    {
        #region Obtener Catalogos
        public static Respuesta ObtenerCatalogos()
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosDA.ObtenerCatalogos();
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerCatalogos-LN");
            }
            return res;
        }
        #endregion
    }
}
