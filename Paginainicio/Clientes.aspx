<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Paginainicio.Clientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div style="text-align: center;">
            <h2 id="title"><%: Title %>.</h2>
            <h3>Menu de clientes.</h3>

        </div>
        <p>Esta pagina fue creada para acceder a las opciones de Alta, Baja y/o Modificar Clientes.</p>
        <div class="row">
        <div class="col-2"></div>
            <div class="col">
                <div class="form-field">
                    <label for="ApellidoCliente" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" id="ApellidoCliente" placeholder="Ingrese apellido/s">
                </div>
            <div class="col">
                <div class="form-field">
                    <label for="NombresCliente" class="form-label">Nombres</label>
                    <input type="text" class="form-control" id="NombresCliente" placeholder="Ingrese nombre/s">
                </div>
            </div>
            <div class="col">
                <div class="form-field">
                    <label for="DomicilioCliente" class="form-label">Domicilio</label>
                    <input type="text" class="form-control" id="DomicilioCliente" placeholder="Ingrese el domicilio">
            </div>
           <div class="col">
                <div class="form-field">
                    <label for="LocalidadCliente" class="form-label">Localidad</label>
                    <input type="text" class="form-control" id="LocalidadCliente" placeholder="Ingrese la localidad">
                </div>  
            </div>
            <div class="col">
                <div class="form-field">
                    <label for="ProvinciaCliente" class="form-label">Provincia</label>
                    <input type="text" class="form-control" id="ProvinciaCliente" placeholder="Ingrese la provincia">
                </div>
            </div>
            </div class="col">
                <div class="form-field">
                    <label for="exampleFormControlSelect2" class="form-label">Example select</label>
                    <select class="form-control" id="exampleFormControlSelect2">
                        <option>Condicion de IVA</option>
                        <option value="1">Responsable Inscripto</option>
                        <option value="2">Responsable Monotributista</option>
                        <option value="3">Consumidor Final</option>
                    </select>
                </div>
            </div>
            <br /> 
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">Guardar</button>    
                <%-- <asp:Button Text="Guardar" ID="btnGuardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" runat="server" >   --%>
            
                <a href="ClientesMenu.aspx" class="btn btn-primary">Volver</a>
            </div>
    </main>
</asp:Content>
