<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Paginainicio.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Su página de Productos.</h3>
        <p>Esta pagina fue creada para dar de Alta/ Baja/ modificar y eliminar productos.</p>
         <div class="d-flex gap-2 my-3">
            <asp:Button ID="AltaProductos" class="btn btn-primary" runat="server" Text="Dar de Alta Productos" />
            <asp:Button ID="BajaProductos" class="btn btn-primary" runat="server" Text="Dar de Baja Productos" />
            <asp:Button ID="ModificarProductos" class="btn btn-primary" runat="server" Text="Modificar Productos" />
        </div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        
    </main>
</asp:Content>