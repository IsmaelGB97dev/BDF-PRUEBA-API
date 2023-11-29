using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTILS;

namespace LogicaNegocio
{
    public static class ReporteLN
    {
        #region Reporte #1
        public static Respuesta ObtenerReportePrestamosXestado(bool estado, int idMoneda)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ReportesDA.ObtenerReportePrestamosXestado(estado, idMoneda);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerReportePrestamosXestado-LN");
            }
            return res;
        }
        #endregion

        #region Reporte #2
        public static Respuesta ObtenerReportePrestamosActivos()
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ReportesDA.ObtenerReportePrestamosActivos();
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerReportePrestamosActivos-LN");
            }
            return res;
        }
        #endregion
    }
}
