<%@ Page Title="Categorías" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="Paginainicio.Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">Categorías</h2>
        <div class="d-flex gap-2 my-3">
            <asp:Button ID="AltaCategoria" class="btn btn-primary" runat="server" OnClick="AltaCategoria_Click" Text="Dar de Alta Categoría" />
            <asp:Button ID="BajaCategoria" class="btn btn-primary" runat="server" Text="Dar de Baja Categoría" />
            <asp:Button ID="ModificarCategoria" class="btn btn-primary" runat="server" OnClick="ModificarCategoria_Click" Text="Modificar Categoría" />
        </div>
        <asp:GridView ID="dgvCategorias" runat="server"></asp:GridView>
    </main>
</asp:Content>
