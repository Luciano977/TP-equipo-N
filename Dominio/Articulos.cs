using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using System.Windows.Forms;

namespace dominio
{
    public class Articulos
    {
        /*
         CREATE TABLE[dbo].[ARTICULOS]
        (
            [Id][int] IDENTITY(1,1) NOT NULL,
            [Codigo] [varchar] (50) NULL,
           	[Nombre][varchar] (50) NULL,
        	[Descripcion][varchar] (150) NULL,
        	[IdMarca][int] NULL,
            [IdCategoria][int] NULL,
            [Precio][money] NULL,
             CONSTRAINT[PK_ARTICULOS] PRIMARY KEY CLUSTERED
        */
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int IdMarca { get; set; }
        public int IdCategoria { get; set; }
        public decimal Precio { get; set; }
        public Marcas DescMarca { get; set; }
        public Categoria DescCategoria { get; set; }
        public string UrlImagen { get; set; }

    }
}
