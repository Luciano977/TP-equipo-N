
using System;
using System.Collections.Generic;
using dominio;

namespace negocio
{
    public class MarcaNegocio
    {
        public List<Marcas> Listar()
        {
            List<Marcas> lista = new List<Marcas>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "SELECT Id, Descripcion FROM MARCAS"
                );

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Marcas marca = new Marcas();

                    marca.Id = (int)datos.Lector["Id"];
                    marca.Descripcion =
                        datos.Lector["Descripcion"].ToString();

                    lista.Add(marca);
                }

                return lista;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool Existe(string descripcion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "SELECT COUNT(*) FROM MARCAS WHERE Descripcion = @descripcion"
                );

                datos.setearParametro("@descripcion", descripcion);
                datos.ejecutarLectura();

                return datos.Lector.Read()
                    && Convert.ToInt32(datos.Lector[0]) > 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Agregar(string descripcion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "INSERT INTO MARCAS (Descripcion) VALUES (@descripcion)"
                );

                datos.setearParametro("@descripcion", descripcion);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Modificar(int id, string descripcion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "UPDATE MARCAS SET Descripcion = @descripcion WHERE Id = @id"
                );

                datos.setearParametro("@descripcion", descripcion);
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("DELETE FROM MARCAS WHERE Id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception(
                    "Error al eliminar la marca: " + ex.Message
                );
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}   

