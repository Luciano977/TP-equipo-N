<%@ Page Title="Alta de producto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosAlta.aspx.cs" Inherits="Paginainicio.ProductosAlta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>

        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="txtCodigo" class="form-label">Código</label>
                <asp:TextBox ID="txtCodigo" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-4 mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-4 mb-3">
                <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox ID="txtDescripcion" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="ddlMarca" class="form-label">Marca</label>
                <asp:DropDownList ID="ddlMarca" ClientIDMode="Static" CssClass="form-select" runat="server">
                    <asp:ListItem Text="Seleccione una marca" Value="0" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4 mb-3">
                <label for="ddlCategoria" class="form-label">Categoría</label>
                <asp:DropDownList ID="ddlCategoria" ClientIDMode="Static" CssClass="form-select" runat="server">
                    <asp:ListItem Text="Seleccione una categoría" Value="0" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="txtStockActual" class="form-label">Stock actual</label>
                <asp:TextBox ID="txtStockActual" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-4 mb-3">
                <label for="txtStockMinimo" class="form-label">Stock mínimo</label>
                <asp:TextBox ID="txtStockMinimo" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-4 mb-3">
                <label for="txtPorcentaje" class="form-label">Porcentaje de ganancia (%)</label>
                <asp:TextBox ID="txtPorcentaje" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 mb-3">
                <label for="txtImagenUrl" class="form-label">URL de la imagen (opcional)</label>
                <asp:TextBox ID="txtImagenUrl" ClientIDMode="Static" CssClass="form-control" runat="server" />
            </div>
        </div>

        <div class="d-flex gap-2">
            <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" runat="server" />
            <a href="Productos.aspx" class="btn btn-secondary">Volver</a>
        </div>
    </main>
</asp:Content>
