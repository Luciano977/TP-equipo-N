using System;
using System.Collections.Generic;
using dominio;

namespace negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> listar()
        {
            List<Categoria> categorias = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdCategoria, Nombre, Activo FROM Categorias WHERE Activo = 1");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria c = new Categoria();
                    c.Id = (int)datos.Lector["IdCategoria"];
                    c.Nombre = (string)datos.Lector["Nombre"];
                    c.Activo = (bool)datos.Lector["Activo"];
                    categorias.Add(c);
                }
                return categorias;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void agregar(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Categorias (Nombre) VALUES (@nombre)");
                datos.setearParametro("@nombre", categoria.Nombre);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Categorias SET Nombre = @nombre WHERE IdCategoria = @id");
                datos.setearParametro("@nombre", categoria.Nombre);
                datos.setearParametro("@id", categoria.Id);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Categorias SET Activo = 0 WHERE IdCategoria = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}