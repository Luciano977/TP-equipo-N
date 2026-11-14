<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Paginainicio.Clientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Menu de clientes.</h3>
        <p>Esta pagina fue creada para acceder a las opciones de Alta, Baja y/o Modificar Clientes.</p>
        <div class="d-flex gap-2 my-3">
            <asp:Button ID="AltaCliente" class="btn btn-primary" runat="server" OnClick="AltaCliente_Click" Text="Dar de Alta Cliente" />
            <asp:Button ID="BajaCliente" class="btn btn-primary" onclick="BajaCliente_Click" runat="server" Text="Dar de Baja Cliente" />
            <asp:Button ID="ModificarCliente" class="btn btn-primary" runat="server" OnClick="ModificarCliente_Click" Text="Modificar Cliente" />
        </div>
        <asp:GridView ID="GridClientes" runat="server"></asp:GridView>

    </main>
</asp:Content>
