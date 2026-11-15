using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paginainicio
{
    public partial class Marcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AltaMarca_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasAlta.aspx");
        }

        protected void ModificarMarca_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasAlta.aspx?modificar=1");
        }
    }
}