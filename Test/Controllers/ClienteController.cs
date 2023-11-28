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
    [RoutePrefix("Cliente")]
    public class ClienteController : ApiController
    {
        [HttpPost]
        [Route("insertarCliente")]
        public IHttpActionResult InsertarCliente(ClienteModel cliente)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ClienteLN.InsertarCliente(cliente);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar agregar el cliente");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarCliente-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpGet]
        [Route("obtenerClientes")]
        public IHttpActionResult ObtenerClientes(int idCliente = 0)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ClienteLN.ObtenerClientes(idCliente);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar obtener los datos");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerClientes-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }

        [HttpPut]
        [Route("actualizarCliente")]
        public IHttpActionResult ActualizarCliente(ClienteModel cliente)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ClienteLN.ActualizarCliente(cliente);
                if (!res.exito)
                    res.SetAdvertencia("Error al intentar actualizar el cliente");
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ActualizarCliente-controller");
                return Content(HttpStatusCode.InternalServerError, res);
            }
        }
    }
}
