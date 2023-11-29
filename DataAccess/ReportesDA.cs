using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTILS;

namespace DataAccess
{
    public class ReportesDA
    {
        private static readonly string cadenaDB = DA.GetConexionDB();

        #region Obtener Prestamo(s)
        public static Respuesta ObtenerReportePrestamosXestado(bool estado, int idMoneda)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            List<PrestamoModel> listaPrestamos = new List<PrestamoModel>();

            try
            {
                SqlCommand cmd = new SqlCommand("[spPrestamosXestadoXMoneda]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_estado", SqlDbType.Bit).Value = estado;
                cmd.Parameters.Add("@_idMoneda", SqlDbType.Int).Value = idMoneda;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    PrestamoModel pr = new PrestamoModel();
                    pr.cliente = new ClienteModel();
                    pr.cliente.numeroIdentificacion = reader.GetString(0);
                    pr.cliente.primerNombre = reader.GetString(1);
                    pr.cliente.direccion = new DireccionModel();
                    pr.cliente.direccion.descripcion = reader.GetString(2);
                    pr.numeroPrestamo = reader.GetInt32(3);
                    pr.tipoPrestamo = new TipoPrestamoModel();
                    pr.tipoPrestamo.nombre = reader.GetString(4);
                    pr.fechaInicio = reader.GetDateTime(5);
                    pr.fechaFin = reader.GetDateTime(6);
                    pr.moneda = new MonedaModel();
                    pr.moneda.nombre = reader.GetString(7);
                    pr.montoSolicitado = reader.GetDecimal(8);
                    pr.montoAprobado = reader.GetDecimal(9);
                    pr.plazoFinanciamiento = reader.GetInt32(10);

                    listaPrestamos.Add(pr);
                }
                res.dato = listaPrestamos;
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerReportePrestamosXestado-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion

        #region Obtener Prestamo(s)
        public static Respuesta ObtenerReportePrestamosActivos()
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            List<PrestamoModel> listaPrestamos = new List<PrestamoModel>();

            try
            {
                SqlCommand cmd = new SqlCommand("[spClientesPrestamosActivos]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    PrestamoModel pr = new PrestamoModel();
                    pr.cliente = new ClienteModel();
                    pr.cliente.numeroIdentificacion = reader.GetString(0);
                    pr.cliente.primerNombre = reader.GetString(1);
                    pr.cliente.direccion = new DireccionModel();
                    pr.cliente.direccion.descripcion = reader.GetString(2);
                    pr.numeroPrestamo = reader.GetInt32(3);
                    pr.tipoPrestamo = new TipoPrestamoModel();
                    pr.tipoPrestamo.nombre = reader.GetString(4);
                    pr.fechaInicio = reader.GetDateTime(5);
                    pr.fechaFin = reader.GetDateTime(6);
                    pr.moneda = new MonedaModel();
                    pr.moneda.nombre = reader.GetString(7);
                    pr.montoSolicitado = reader.GetDecimal(8);
                    pr.montoAprobado = reader.GetDecimal(9);
                    pr.plazoFinanciamiento = reader.GetInt32(10);

                    listaPrestamos.Add(pr);
                }
                res.dato = listaPrestamos;
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerReportePrestamosActivos-AD");
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
