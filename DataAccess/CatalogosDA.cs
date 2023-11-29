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
    public static class CatalogosDA
    {
        private static readonly string cadenaDB = DA.GetConexionDB();

        #region Obtener Catalogos
        public static Respuesta ObtenerCatalogos()
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            object listaCatalogos = new object();
            List<TipoIdentificacionModel> listaTipoIdentificacion = new List<TipoIdentificacionModel>();
            List<TipoPrestamoModel> listaTipoPrestamo = new List<TipoPrestamoModel>();
            List<MonedaModel> listaMoneda = new List<MonedaModel>();
            List<DireccionModel> listaDireccion = new List<DireccionModel>();

            try
            {
                SqlCommand cmd = new SqlCommand("spObtenerCatalogos", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    TipoIdentificacionModel ti = new TipoIdentificacionModel();
                    ti.idTipoIdentificacion = reader.GetInt32(0);
                    ti.nombre = reader.GetString(1);
                    ti.activo = reader.GetBoolean(2);
                    listaTipoIdentificacion.Add(ti);

                }

                reader.NextResult();

                while(reader.Read())
                {
                    TipoPrestamoModel tp = new TipoPrestamoModel();
                    tp.idTipoPrestamo = reader.GetInt32(0);
                    tp.nombre = (string)reader.GetString(1);
                    listaTipoPrestamo.Add(tp);
                }

                reader.NextResult();

                while(reader.Read())
                {
                    MonedaModel mo = new MonedaModel();
                    mo.idMoneda = reader.GetInt32(0);
                    mo.nombre = reader.GetString(1);
                    listaMoneda.Add(mo);
                }

                reader.NextResult();

                while(reader.Read())
                {
                    DireccionModel di = new DireccionModel();
                    di.idDireccion = reader.GetInt32(0);
                    di.descripcion = reader.GetString(1);
                    listaDireccion.Add(di);
                }

                listaCatalogos = new {
                    tipoIdentificacion = listaTipoIdentificacion,
                    tipoPrestamo = listaTipoPrestamo,
                    moneda = listaMoneda,
                    direccion = listaDireccion
                };

                res.dato = listaCatalogos;
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerCatalogos-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion



        #region Insertar Direccion
        public static Respuesta InsertarDireccion(DireccionModel _direccion)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            DireccionModel direccion = new DireccionModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spInsertarDireccion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_descripcion", SqlDbType.VarChar).Value = _direccion.descripcion;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spInsertarDireccion-DA");
                    }
                    else
                    {
                        direccion.idDireccion = reader.GetInt32(1);
                        direccion.descripcion = reader.GetString(2);
                        res.dato = direccion;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarDireccion-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion


        #region Insertar Tipo Identificacion
        public static Respuesta InsertarTipoIdentificacion(TipoIdentificacionModel _tipoIdentificacion)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            TipoIdentificacionModel tipoIdentificacion = new TipoIdentificacionModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spInsertarTipoIdentificacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_nombre", SqlDbType.VarChar).Value = _tipoIdentificacion.nombre;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spInsertarTipoIdentificacion-DA");
                    }
                    else
                    {
                        tipoIdentificacion.idTipoIdentificacion = reader.GetInt32(1);
                        tipoIdentificacion.nombre = reader.GetString(2);
                        res.dato = tipoIdentificacion;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarTipoIdentificacion-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion

        #region Insertar Tipo prestamo
        public static Respuesta InsertarTipoPrestamo(TipoPrestamoModel _tipoPrestamo)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            TipoPrestamoModel tipoPrestamo = new TipoPrestamoModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spInsertarTipoPrestamo]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_nombre", SqlDbType.VarChar).Value = _tipoPrestamo.nombre;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spInsertarTipoPrestamo-DA");
                    }
                    else
                    {
                        tipoPrestamo.idTipoPrestamo = reader.GetInt32(1);
                        tipoPrestamo.nombre = reader.GetString(2);
                        res.dato = tipoPrestamo;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarTipoPrestamo-AD");
            }
            finally
            {
                conn.Close();
            }
            return res;
        }
        #endregion

        #region Insertar Moneda
        public static Respuesta InsertarMoneda(MonedaModel _moneda)
        {
            SqlConnection conn = new SqlConnection(cadenaDB);
            Respuesta res = new Respuesta();
            MonedaModel moneda = new MonedaModel();

            try
            {
                SqlCommand cmd = new SqlCommand("[spInsertarMoneda]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@_nombre", SqlDbType.VarChar).Value = _moneda.nombre;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.GetBoolean(0))                      // Validar exito
                    {
                        res.SetAdvertencia(reader.GetString(1));    // Obtener mensaje
                        if (reader.GetString(2) != "")              // Validar si existe mensaje de error
                            res.SetError(reader.GetString(2), "spInsertarMoneda-DA");
                    }
                    else
                    {
                        moneda.idMoneda = reader.GetInt32(1);
                        moneda.nombre = reader.GetString(2);
                        res.dato = moneda;
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarMoneda-AD");
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
