using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTILS;
using System.Runtime.Remoting.Proxies;

namespace DataAccess
{
    public static class PrestamoDA
    {
        private static readonly string cadenaDB = DA.GetConexionDB();

        #region Obtener Prestamo(s)
        public static Respuesta ObtenerPrestamos(int idCliente)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            List <PrestamoModel> listaPrestamos = new List<PrestamoModel>();

            try
            {
                SqlCommand cmd = new SqlCommand("spObtenerPrestamos", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_idCliente", SqlDbType.Int).Value = idCliente;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    PrestamoModel pr = new PrestamoModel();

                    pr.numeroPrestamo = reader.GetInt32(0);
                    pr.tipoPrestamo = new TipoPrestamoModel();
                    pr.tipoPrestamo.idTipoPrestamo = reader.GetInt32(1);
                    pr.tipoPrestamo.nombre = reader.GetString(2);
                    pr.cliente = new ClienteModel();
                    pr.cliente.idCliente = reader.GetInt32(3);
                    pr.cliente.numeroIdentificacion = reader.GetString(4);
                    pr.cliente.primerNombre = reader.GetString(5);
                    pr.cliente.segundoNombre = reader.GetString(6);
                    pr.cliente.primerApellido = reader.GetString(7);
                    pr.cliente.segundoApellido = reader.GetString(8);
                    pr.fechaInicio = reader.GetDateTime(9);
                    pr.fechaFin = reader.GetDateTime(10);
                    pr.montoSolicitado = reader.GetDecimal(11);
                    pr.moneda = new MonedaModel();
                    pr.moneda.idMoneda = reader.GetInt32(12);
                    pr.moneda.nombre = reader.GetString(13);
                    pr.montoAprobado = reader.GetDecimal(14);
                    pr.plazoFinanciamiento = reader.GetInt32(15);
                    pr.estado = reader.GetBoolean(16);

                    listaPrestamos.Add(pr);
                }
                res.dato = listaPrestamos;
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

        #region Insertar Cliente
        public static Respuesta InsertarPrestamo(PrestamoModel _prestamo)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            PrestamoModel prestamo = new PrestamoModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spInsertarPrestamo]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_idTipoPrestamo", SqlDbType.Int).Value = _prestamo.tipoPrestamo.idTipoPrestamo;
                cmd.Parameters.Add("@_idCliente", SqlDbType.Int).Value = _prestamo.cliente.idCliente;
                cmd.Parameters.Add("@_fechaInicio", SqlDbType.DateTime).Value = _prestamo.fechaInicio;
                cmd.Parameters.Add("@_fechaFin", SqlDbType.DateTime).Value = _prestamo.fechaFin;
                cmd.Parameters.Add("@_montoSolicitado", SqlDbType.Decimal).Value = _prestamo.montoSolicitado;
                cmd.Parameters.Add("@_idMoneda", SqlDbType.Int).Value = _prestamo.moneda.idMoneda;
                cmd.Parameters.Add("@_montoAprobado", SqlDbType.Decimal).Value = _prestamo.montoAprobado;
                cmd.Parameters.Add("@_plazoFinanciamiento", SqlDbType.Int).Value = _prestamo.plazoFinanciamiento;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spInsertarPrestamo-DA");
                    }
                    else
                    {
                        prestamo.numeroPrestamo = reader.GetInt32(1);
                        prestamo.tipoPrestamo = new TipoPrestamoModel();
                        prestamo.tipoPrestamo.idTipoPrestamo = reader.GetInt32(2);
                        prestamo.cliente = new ClienteModel();
                        prestamo.cliente.idCliente = reader.GetInt32(3);
                        prestamo.fechaInicio = reader.GetDateTime(4);
                        prestamo.fechaFin = reader.GetDateTime(5);
                        prestamo.montoSolicitado = reader.GetDecimal(6);
                        prestamo.moneda = new MonedaModel();
                        prestamo.moneda.idMoneda = reader.GetInt32(7);
                        prestamo.montoAprobado = reader.GetDecimal(8);
                        prestamo.plazoFinanciamiento = reader.GetInt32(9);
                        prestamo.estado = reader.GetBoolean(10);

                        res.dato = prestamo;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarPrestamo-AD");
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
