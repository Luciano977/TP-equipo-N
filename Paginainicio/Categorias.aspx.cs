using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paginainicio
{
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AltaCategoria_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoriasAlta.aspx");
        }

        protected void ModificarCategoria_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoriasAlta.aspx?modificar=1");
        }
    }
}