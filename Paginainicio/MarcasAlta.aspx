<%@ Page Title="Alta de marca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarcasAlta.aspx.cs" Inherits="Paginainicio.MarcasAlta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
        </div>

        <div class="d-flex gap-2">
            <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" runat="server" />
            <a href="Marcas.aspx" class="btn btn-secondary">Volver</a>
        </div>
    </main>
</asp:Content>