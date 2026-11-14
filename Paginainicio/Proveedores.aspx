<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Paginainicio.Proveedores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Pagina de proveedores.</h3>
        <p>Esta pagina fue creada para dar de alta/ baja/ modificar o eliminar proveedores.</p>

         <div class="d-flex gap-2 my-3">
            <asp:Button ID="AltaProveedores" class="btn btn-primary" runat="server" Text="Dar de Alta Proveedor" />
            <asp:Button ID="BajaProveedores" class="btn btn-primary" runat="server" Text="Dar de Baja Proveedor" />
            <asp:Button ID="ModificarProveedores" class="btn btn-primary" runat="server" Text="Modificar Proveedor" />

    </div>

    </main>
    
</asp:Content>