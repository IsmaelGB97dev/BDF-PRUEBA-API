using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using Models;
using UTILS;

namespace LogicaNegocio
{
    public class ClienteLN
    {
        #region Insertar Cliente
        public static Respuesta InsertarCliente(ClienteModel cliente)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if(cliente == null)
                    res.SetAdvertencia("Indicar los datos del cliente");
                else
                {
                    if(string.IsNullOrEmpty(cliente.numeroIdentificacion) || 
                        string.IsNullOrEmpty(cliente.primerNombre) ||
                        string.IsNullOrEmpty(cliente.primerApellido))
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    res = ClienteDA.InsertarCliente(cliente);
                }

            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarCliente-LN");
            }
            return res;
        }
        #endregion

        #region Obtener Cliente(s)
        public static Respuesta ObtenerClientes(int idCliente)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = ClienteDA.ObtenerClientes(idCliente);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerClientes-LN");
            }
            return res;
        }
        #endregion

        #region Actualizar Cliente
        public static Respuesta ActualizarCliente(ClienteModel cliente)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (cliente == null)
                    res.SetAdvertencia("Indicar los datos del cliente");
                else
                {
                    if (string.IsNullOrEmpty(cliente.numeroIdentificacion) ||
                        string.IsNullOrEmpty(cliente.primerNombre) ||
                        string.IsNullOrEmpty(cliente.primerApellido) ||
                        cliente.idCliente == 0)
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    res = ClienteDA.ActualizarCliente(cliente);
                }

            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ActualizarCliente-LN");
            }
            return res;
        }
        #endregion
    }
}
