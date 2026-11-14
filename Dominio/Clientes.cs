using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Clientes
    {
        /*[IdCliente][int] IDENTITY(1,1) NOT NULL,
            [DNI] [varchar] (11) NULL,
           	[Nombre][varchar] (50) NULL,
        	[Apellido][varchar] (50) NULL,
        	[Telefono][int] NULL,
            [email][varchar] (50) NULL,
            [Domicilio][varchar] (50) NULL,
            [Activo][bit] NULL,
        */
        public int IdCliente { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Telefono { get; set; }
        public string Email { get; set; }
        public string Domicilio { get; set; }
        public bool Activo { get; set; }

    }
}
