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
    [RoutePrefix("catalogos")]
    public class CatalogosController : ApiController
    {
        [HttpGet]
        [Route("obtenerCatalogos")]
        public IHttpActionResult ObtenerCatalogos()
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosLN.ObtenerCatalogos();
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar obtener los datos");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerCatalogos-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }
    }
}
