<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Paginainicio.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Acerca de su aplicación.</h3>
        <p>Esta pagina fue creada para proporcionar información sobre la aplicación.</p>
        <p>Fue diseñada para facilitar el acceso a los datos y funcionalidades principales de la misma.</p>
    </main>
</asp:Content>
