using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    internal class Imagenes
    {
        /*
        create table Imagenes
        (
            Id int IDENTITY(1,1) not null,
        	IdArticulo int not null,
            ImagenUrl Imagenes(1000) not null
        */
        public int Id { get; set; }
        public int IdArticulo { get; set; }

    }
}
