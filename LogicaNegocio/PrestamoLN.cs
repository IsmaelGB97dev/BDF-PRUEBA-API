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
    public static class PrestamoLN
    {
        #region Obtener prestamo(s)
        public static Respuesta ObtenerPrestamos(int idCliente, int idPrestamo)
        {
            Respuesta res = new Respuesta();
            try
            {
                res = PrestamoDA.ObtenerPrestamos(idCliente, idPrestamo);
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ObtenerPrestamos-LN");
            }
            return res;
        }
        #endregion

        #region Insertar Prestamo
        public static Respuesta InsertarPrestamo(PrestamoModel prestamo)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (prestamo == null)
                    res.SetAdvertencia("Indicar los datos del prestamo");
                else
                {
                    if (prestamo.montoSolicitado <= 0 ||
                        prestamo.montoAprobado <= 0 ||
                        prestamo.plazoFinanciamiento <= 0)
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    else
                    {
                        res = PrestamoDA.InsertarPrestamo(prestamo);
                    }
                }
            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "InsertarPrestamo-LN");
            }
            return res;
        }
        #endregion

        #region Insertar Prestamo
        public static Respuesta ActualizarPrestamo(PrestamoModel prestamo)
        {
            Respuesta res = new Respuesta();
            try
            {
                // Validaciones
                if (prestamo == null)
                    res.SetAdvertencia("Indicar los datos del prestamo");
                else
                {
                    if (prestamo.montoSolicitado <= 0 ||
                        prestamo.montoAprobado <= 0 ||
                        prestamo.plazoFinanciamiento <= 0)
                    {
                        res.SetAdvertencia("Indicar todos los campos requeridos");
                    }
                    else
                    {
                        res = PrestamoDA.ActualizarPrestamo(prestamo);
                    }
                }

            }
            catch (Exception ex)
            {
                res.SetError(ex.ToString(), "ActualizarPrestamo-LN");
            }
            return res;
        }
        #endregion

    }
}
