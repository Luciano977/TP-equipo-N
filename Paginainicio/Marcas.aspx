<%@ Page Title="Marcas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="Paginainicio.Marcas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">Marcas</h2>
        <div class="d-flex gap-2 my-3">
            <asp:Button ID="AltaMarca" class="btn btn-primary" runat="server" OnClick="AltaMarca_Click" Text="Dar de Alta Marca" />
            <asp:Button ID="BajaMarca" class="btn btn-primary" runat="server" Text="Dar de Baja Marca" />
            <asp:Button ID="ModificarMarca" class="btn btn-primary" runat="server" OnClick="ModificarMarca_Click" Text="Modificar Marca" />
        </div>
        <asp:GridView ID="dgvMarcas" runat="server"></asp:GridView>
    </main>
</asp:Content>