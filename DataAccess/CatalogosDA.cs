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
    }
}
