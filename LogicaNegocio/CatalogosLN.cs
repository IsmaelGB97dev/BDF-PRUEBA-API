using DataAccess;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTILS;

namespace LogicaNegocio
{
    public static class CatalogosLN
    {
        #region Obtener Catalogos
        public static Respuesta ObtenerCatalogos()
        {
            Respuesta res = new Respuesta();
            try
            {
                res = CatalogosDA.ObtenerCatalogos();
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerCatalogos-LN");
            }
            return res;
        }
        #endregion

        #region Insertar Cliente
        public static Respuesta InsertarDireccion(DireccionModel direccion)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (direccion == null)
                    res.SetAdvertencia("Indicar los datos de la dirección");
                else
                {
                    if (string.IsNullOrEmpty(direccion.descripcion))
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    else
                    {
                        res = CatalogosDA.InsertarDireccion(direccion);
                    }
                }

            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarDireccion-LN");
            }
            return res;
        }
        #endregion

        #region Insertar Tipo Identificacion
        public static Respuesta InsertarTipoIdentificacion(TipoIdentificacionModel tipoIdentificacion)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (tipoIdentificacion == null)
                    res.SetAdvertencia("Indicar los datos del tipo de identificación");
                else
                {
                    if (string.IsNullOrEmpty(tipoIdentificacion.nombre))
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    else
                    {
                        res = CatalogosDA.InsertarTipoIdentificacion(tipoIdentificacion);
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarTipoIdentificacion-LN");
            }
            return res;
        }
        #endregion

        #region Insertar Tipo prestamo
        public static Respuesta InsertarTipoPrestamo(TipoPrestamoModel tipoPrestamo)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (tipoPrestamo == null)
                    res.SetAdvertencia("Indicar los datos del tipo de prestamo");
                else
                {
                    if (string.IsNullOrEmpty(tipoPrestamo.nombre))
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    else
                    {
                        res = CatalogosDA.InsertarTipoPrestamo(tipoPrestamo);
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarTipoPrestamo-LN");
            }
            return res;
        }
        #endregion

        #region Insertar Moneda
        public static Respuesta InsertarMoneda(MonedaModel moneda)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (moneda == null)
                    res.SetAdvertencia("Indicar los datos de la moneda");
                else
                {
                    if (string.IsNullOrEmpty(moneda.nombre))
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    else
                    {
                        res = CatalogosDA.InsertarMoneda(moneda);
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarMoneda-LN");
            }
            return res;
        }
        #endregion
    }
}
