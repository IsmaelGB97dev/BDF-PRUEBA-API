using LogicaNegocio;
using Models;
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


        [HttpPost]
        [Route("insertarDireccion")]
        public IHttpActionResult InsertarDireccion(DireccionModel direccion)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosLN.InsertarDireccion(direccion);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar agregar la dirección");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarDireccion-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpPost]
        [Route("insertarTipoIdentificacion")]
        public IHttpActionResult InsertarTipoIdentificacion(TipoIdentificacionModel tipoIdentificacion)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosLN.InsertarTipoIdentificacion(tipoIdentificacion);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar agregar el tipo de identificación");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarTipoIdentificacion-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpPost]
        [Route("insertarTipoPrestamo")]
        public IHttpActionResult InsertarTipoPrestamo(TipoPrestamoModel tipoPrestamo)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosLN.InsertarTipoPrestamo(tipoPrestamo);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar agregar el tipo de prestamo");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarTipoPrestamo-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpPost]
        [Route("insertarMoneda")]
        public IHttpActionResult InsertarMoneda(MonedaModel moneda)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosLN.InsertarMoneda(moneda);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar agregar la moneda");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarMoneda-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }
    }
}
