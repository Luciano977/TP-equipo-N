<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Paginainicio.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Pagina de clientes.</h3>
        <p>Esta pagina fue creada para proporcionar dar de Alta/ Baja/Modificar Clientes.</p>
        <div class="row">
        <div class="col-2"></div>
            <div class="col">
                <div class="form-field">
                <label for="exampleFormControlInput1" class="form-label">Apellidos</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese el apellidos">
            </div>
        <div class="col-2"></div>
        <div class="col-2"></div>
            <div class="col">
                <div class="form-field">
                <label for="exampleFormControlInput1" class="form-label">Nombres</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese el nombres">
            </div>
        <div class="col-2"></div>
        <div class="col-2"></div>            
            <div class="col">
                <div class="form-field">
                <label for="exampleFormControlInput1" class="form-label">Domicilio</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese el domicilio">
            </div>
        <div class="col-2"></div>
            <div class="col">
                <div class="form-field">
                    <label for="exampleFormControlInput1" class="form-label">Localidad</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese la localidad">
                <div class="col-2"></div>
            </div>
         <div class="col-2"></div>
            <div class="col">
                <div class="form-field">
                    <label for="exampleFormControlInput1" class="form-label">Provincia</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese la localidad">
                <div class="col-2"></div>
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
            <button type="submit" class="btn btn-primary">Guardar</button>    
            <%-- <asp:Button Text="Guardar" ID="btnGuardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" runat="server" >   --%>
        
    </main>
</asp:Content>
