using LogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using UTILS;

namespace Test.Controllers
{
    [RoutePrefix("reportes")]
    public class ReporteController : ApiController
    {

        [HttpGet]
        [Route("prestamosXestado")]
        public IHttpActionResult ObtenerReportePrestamosXestado(bool estado, int idMoneda)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ReporteLN.ObtenerReportePrestamosXestado(estado, idMoneda);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar obtener los datos");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerReportePrestamosXestado-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpGet]
        [Route("prestamosActivos")]
        public IHttpActionResult ObtenerReportePrestamosActivos()
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ReporteLN.ObtenerReportePrestamosActivos();
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar obtener los datos");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerReportePrestamosActivos-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

    }
}
