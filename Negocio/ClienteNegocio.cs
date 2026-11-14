using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace negocio
{
    public class ClienteNegocio
    {

        public List<Clientes> listar()
        {
            List<Clientes> clientes = new List<Clientes>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdCliente, DNI, Nombre, Apellido, Telefono, Email, Domicilio, Activo FROM CLIENTES");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Clientes c = new Clientes();
                    c.IdCliente = (int)datos.Lector["IdCliente"];
                    c.DNI = (string)datos.Lector["DNI"];
                    c.Nombre = (string)datos.Lector["Nombre"];
                    c.Apellido = (string)datos.Lector["Apellido"];
                    c.Telefono = (int)datos.Lector["Telefono"];
                    c.Email = (string)datos.Lector["Email"];
                    c.Domicilio = (string)datos.Lector["Domicilio"];
                    c.Activo = (bool)datos.Lector["Activo"];
                    clientes.Add(c);
                }
                return clientes ;
            }
            finally
            {
                datos.cerrarConexion();
            }
            
        }
    }
}
