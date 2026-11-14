//using System.Windows.Forms;
using dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;


namespace negocio
{
    public class ArticulosNegocio
    {
        public List<Articulos> listar()

        {
            List<Articulos> lista = new List<Articulos>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader Lector;

            try
            {
                conexion.ConnectionString = @"Server=(localdb)\MSSQLLocalDB;Database=CATALOGO_P3_DB;Integrated Security=True;";
                comando.CommandType = System.Data.CommandType.Text;
                //Esta es la consulta que quiero hacer a la base de datos, para traerme los articulos con sus marcas y categorias
                //comando.CommandText = @"select A.Id, A.Codigo, A.Nombre, A.Descripcion, M.Descripcion as Marca, C.Descripcion as Categoria, A.Precio, I.ImagenUrl from ARTICULOS A 
                   // left join MARCAS M on M.Id=A.Id 
                   // left join CATEGORIAS C on C.Id=A.Id 
                    // left join IMAGENES I on I.Id=A.Id";// la consulta que hago a la base de datos
                comando.CommandText = @"select A.Id, A.Codigo, A.Nombre, A.Descripcion, A.Precio, M.Descripcion AS Marca, C.Descripcion as Categoria, M.Id as IdMarca, C.Id as IdCategoria, I.ImagenUrl from ARTICULOS A 
                    INNER JOIN MARCAS M ON A.IdMarca = M.Id 
                    INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id
                    INNER JOIN IMAGENES I ON A.IdCategoria = I.Id";// la consulta que hago a la base de datos
                comando.Connection = conexion;
                conexion.Open();
                Lector = comando.ExecuteReader();

                while (Lector.Read())
                { 
                    Articulos aux = new Articulos();
                    aux.Id = (int)Lector["Id"];
                    aux.Codigo = (string)Lector["Codigo"] ;//esta es una forma
                    aux.Nombre = (string)Lector["Nombre"];
                    aux.Descripcion = (string)Lector["Descripcion"];
                    aux.Precio = (decimal)Lector["Precio"];

                    //Aqui tengo que hacer un if para agregar imagen
                    aux.UrlImagen = (string)Lector["ImagenUrl"];
                    aux.DescMarca = new Marcas();
                    aux.DescMarca.Id = (int)Lector["IdMarca"];
                    aux.DescMarca.Descripcion = (string)Lector["Marca"];
                    aux.DescCategoria = new Categoria();
                    aux.DescCategoria.Id = (int)Lector["IdCategoria"];
                    aux.DescCategoria.Descripcion = (string)Lector["Categoria"];

                                        
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally {conexion.Close(); }
        }
        public List<Marcas> listarMarcas()
        {
            List<Marcas> Marcas = new List<Marcas>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id, Descripcion FROM MARCAS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Marcas m = new Marcas();
                    m.Id = (int)datos.Lector["Id"];
                    m.Descripcion = (string)datos.Lector["Descripcion"];
                    Marcas.Add(m);
                }
                return Marcas;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public List<Categoria> listarCategorias()
        {
            List<Categoria> categorias = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id, Descripcion FROM CATEGORIAS");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria c = new Categoria();
                    c.Id = (int)datos.Lector["Id"];
                    c.Descripcion = (string)datos.Lector["Descripcion"];
                    categorias.Add(c);
                }
                return categorias;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void AgregarArt(Articulos nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into ARTICULOS(Codigo, Nombre, Descripcion, Precio, IdMarca, IdCategoria) values('" + nuevo.Codigo + "', '"+nuevo.Nombre+"', '"+nuevo.Descripcion+"', "+nuevo.Precio+", @IdMarca, @IdCategoria)");
                datos.setearParametro("@IdMarca", nuevo.DescMarca.Id);
                datos.setearParametro("@IdCategoria", nuevo.DescCategoria.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public List<Articulos> Buscar(string criterio, string filtro)
        {
            List<Articulos> lista = new List<Articulos>();
            AccesoDatos datos = new AccesoDatos();
            //using (SqlConnection conexion = new SqlConnection(@"Server=.\SQLEXPRESS;Database=CATALOGO_P3_DB;Integrated Security=True;"))
            {
                string campo = "";

                switch (criterio)
                {
                    case "Código":
                        campo = "A.Codigo";
                        break;
                    case "Nombre":
                        campo = "A.Nombre";
                        break;
                    case "Descripción":
                        campo = "A.Descripcion";
                        break;
                    default:
                        throw new Exception("Seleccione un criterio de búsqueda.");
                }

                string consulta = @"SELECT A.Codigo, A.Nombre, A.Descripcion, M.Descripcion AS Marca, C.Descripcion AS Categoria, A.Precio
                            FROM ARTICULOS A
                            INNER JOIN MARCAS M ON A.IdMarca = M.Id
                            INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id
                            WHERE " + campo + " LIKE @filtro";

                //using (SqlCommand comando = new SqlCommand(consulta, datos))
                {
                    datos.setearConsulta(consulta);
                    datos.setearParametro("@filtro", "%" + filtro + "%");
                    //comando.Parameters.AddWithValue("@filtro", "%" + filtro + "%");

                    datos.ejecutarLectura();
                    //conexion.Open();
                    //using (SqlDataReader lector = comando.ExecuteReader())
                    //{
                        //while (lector.Read())
                        while (datos.Lector.Read())
                        {
                            Articulos aux = new Articulos();

                            aux.Codigo = Convert.ToString(datos.Lector["Codigo"]);
                            aux.Nombre = Convert.ToString(datos.Lector["Nombre"]);
                            aux.Descripcion = Convert.ToString(datos.Lector["Descripcion"]);
                            aux.Precio = Convert.ToDecimal(datos.Lector["Precio"]);

                            aux.DescMarca = new Marcas();
                            aux.DescMarca.Descripcion = Convert.ToString(datos.Lector["Marca"]);

                            aux.DescCategoria = new Categoria();
                            aux.DescCategoria.Descripcion = Convert.ToString(datos.Lector["Categoria"]);

                            lista.Add(aux);
                        }
                    //}
                }
            }

            return lista;
        }

        public void ModifArt(Articulos modificar){
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update ARTICULOS set Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion, IdMarca = @IdMarca, IdCategoria = @IdCategoria, Precio = @Precio where Id = @Id");
                datos.setearParametro("@Codigo", modificar.Codigo);
                datos.setearParametro("@Nombre", modificar.Nombre);
                datos.setearParametro("@Descripcion", modificar.Descripcion);
                datos.setearParametro("@IdMarca", modificar.DescMarca.Id);
                datos.setearParametro("@IdCategoria", modificar.DescCategoria.Id);
                datos.setearParametro("@Precio", modificar.Precio);
                datos.setearParametro("@Id", modificar.Id);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void ElimArt(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from ARTICULOS where Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
