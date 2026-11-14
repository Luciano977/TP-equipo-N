using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using System.Windows.Forms;

namespace dominio
{
    public class Marcas
    {
        /*CREATE TABLE[dbo].[MARCAS]
        (
            [Id][int] IDENTITY(1,1) NOT NULL,
            [Descripcion] [varchar] (50) NULL,
             CONSTRAINT[PK_MARCAS] PRIMARY KEY CLUSTERED
        (*/

        public int Id { get; set; }
        public string Descripcion { get; set; }
        public override string ToString()
        {
            return Descripcion;
        }
    }
}
