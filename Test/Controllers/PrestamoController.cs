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
    [RoutePrefix("prestamo")]
    public class PrestamoController : ApiController
    {
        [HttpGet]
        [Route("obtenerPrestamos")]
        public IHttpActionResult ObtenerPrestamos(int idCliente = 0)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = PrestamoLN.ObtenerPrestamos(idCliente);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar obtener los datos");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerPrestamos-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpPost]
        [Route("insertarPrestamo")]
        public IHttpActionResult InsertarPrestamo(PrestamoModel prestamo)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = PrestamoLN.InsertarPrestamo(prestamo);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar agregar el prestamo");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarPrestamo-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }
    }
}
