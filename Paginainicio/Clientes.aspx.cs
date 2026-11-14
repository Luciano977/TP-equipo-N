using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Paginainicio
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            /*
            GridClientes.DataSource = negocio.listar();
            GridClientes.DataBind();*/
            

        }
        protected void AltaCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes.aspx");
        }
        protected void BajaCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes.aspx");
        }
        protected void ModificarCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes.aspx");
        }
    }
}