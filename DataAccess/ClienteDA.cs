using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTILS;
using Models;

namespace DataAccess
{
    public static class ClienteDA
    {
        private static readonly string cadenaDB = DA.GetConexionDB(); 

        #region Insertar Cliente
        public static Respuesta InsertarCliente(ClienteModel _cliente)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            ClienteModel cliente = new ClienteModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spInsertarCliente]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_numeroIdentificacion", SqlDbType.VarChar).Value = _cliente.numeroIdentificacion;
                cmd.Parameters.Add("@_idTipoIdentificacion", SqlDbType.Int).Value = _cliente.tipoIdentificacion.idTipoIdentificacion;
                cmd.Parameters.Add("@_primerNombre", SqlDbType.VarChar).Value = _cliente.primerNombre;
                cmd.Parameters.Add("@_segundoNombre", SqlDbType.VarChar).Value = _cliente.segundoNombre;
                cmd.Parameters.Add("@_primerApellido", SqlDbType.VarChar).Value = _cliente.primerApellido;
                cmd.Parameters.Add("@_segundoApellido", SqlDbType.VarChar).Value = _cliente.segundoApellido;
                cmd.Parameters.Add("@_idDireccion", SqlDbType.Int).Value = _cliente.direccion.idDireccion;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spInsertarCliente-DA");
                    }
                    else
                    {
                        cliente.idCliente = reader.GetInt32(1);
                        cliente.numeroIdentificacion = reader.GetString(2);
                        cliente.tipoIdentificacion = new TipoIdentificacionModel();
                        cliente.tipoIdentificacion.idTipoIdentificacion = reader.GetInt32(3);
                        cliente.primerNombre = reader.GetString(4);
                        cliente.segundoNombre = reader.GetString(5);
                        cliente.primerApellido = reader.GetString(6);
                        cliente.segundoApellido = reader.GetString(7);
                        cliente.direccion = new DireccionModel();
                        cliente.direccion.idDireccion = reader.GetInt32(8);
                        cliente.estado = reader.GetBoolean(9);

                        res.dato = cliente;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarCliente-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion

        #region Obtener cliente(s)
        public static Respuesta ObtenerClientes(int idCliente)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            List<ClienteModel> listaClientes = new List<ClienteModel>();

            try
            {
                SqlCommand cmd = new SqlCommand("spObtenerClientes", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_idCliente", SqlDbType.Int).Value = idCliente;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ClienteModel cliente = new ClienteModel();
                    cliente.idCliente = reader.GetInt32(0);
                    cliente.numeroIdentificacion = reader.GetString(1);
                    cliente.tipoIdentificacion = new TipoIdentificacionModel();
                    cliente.tipoIdentificacion.idTipoIdentificacion = reader.GetInt32(2);
                    cliente.tipoIdentificacion.nombre = reader.GetString(3);
                    cliente.tipoIdentificacion.activo = reader.GetBoolean(4);
                    cliente.primerNombre = reader.GetString(5);
                    cliente.segundoNombre = reader.GetString(6);
                    cliente.primerApellido = reader.GetString(7);
                    cliente.segundoApellido = reader.GetString(8);
                    cliente.direccion = new DireccionModel();
                    cliente.direccion.idDireccion = reader.GetInt32(9);
                    cliente.direccion.descripcion = reader.GetString(10);
                    cliente.estado = reader.GetBoolean(11);

                    listaClientes.Add(cliente);
                }
                res.dato = listaClientes;
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerClientes-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion

        #region Actualizar Cliente
        public static Respuesta ActualizarCliente(ClienteModel _cliente)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            ClienteModel cliente = new ClienteModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spActualizarCliente]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_idCliente", SqlDbType.Int).Value = _cliente.idCliente;
                cmd.Parameters.Add("@_numeroIdentificacion", SqlDbType.VarChar).Value = _cliente.numeroIdentificacion;
                cmd.Parameters.Add("@_idTipoIdentificacion", SqlDbType.Int).Value = _cliente.tipoIdentificacion.idTipoIdentificacion;
                cmd.Parameters.Add("@_primerNombre", SqlDbType.VarChar).Value = _cliente.primerNombre;
                cmd.Parameters.Add("@_segundoNombre", SqlDbType.VarChar).Value = _cliente.segundoNombre;
                cmd.Parameters.Add("@_primerApellido", SqlDbType.VarChar).Value = _cliente.primerApellido;
                cmd.Parameters.Add("@_segundoApellido", SqlDbType.VarChar).Value = _cliente.segundoApellido;
                cmd.Parameters.Add("@_idDireccion", SqlDbType.Int).Value = _cliente.direccion.idDireccion;
                cmd.Parameters.Add("@_estado", SqlDbType.Bit).Value = _cliente.estado;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spActualizarCliente-DA");
                    }
                    else
                    {
                        cliente.idCliente = reader.GetInt32(1);
                        cliente.numeroIdentificacion = reader.GetString(2);
                        cliente.tipoIdentificacion = new TipoIdentificacionModel();
                        cliente.tipoIdentificacion.idTipoIdentificacion = reader.GetInt32(3);
                        cliente.primerNombre = reader.GetString(4);
                        cliente.segundoNombre = reader.GetString(5);
                        cliente.primerApellido = reader.GetString(6);
                        cliente.segundoApellido = reader.GetString(7);
                        cliente.direccion = new DireccionModel();
                        cliente.direccion.idDireccion = reader.GetInt32(8);
                        cliente.estado = reader.GetBoolean(9);

                        res.dato = cliente;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ActualizarCliente-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion
    }
}
