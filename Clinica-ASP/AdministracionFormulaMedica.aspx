<%@ Page Title="" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="AdministracionFormulaMedica.aspx.cs" Inherits="Clinica_ASP.AdministracionFormulaMedica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>Administración de Historias Clinicas</h1>
    <p>&nbsp;</p>
   <h4>Consulta de Citas por Usuario</h4>

    <asp:Label ID="Label1" runat="server" Text="Cedula Usuario:"></asp:Label>
&nbsp;<asp:TextBox ID="txtConsultaC" runat="server"></asp:TextBox>
&nbsp;
         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
             ErrorMessage="Debe Ingresar La Cedula" ForeColor="Red" 
             ValidationExpression="^[0-9]*$" ControlToValidate="txtConsultaC"></asp:RegularExpressionValidator>
    <br />
    <asp:Button ID="btnBuscarC" runat="server" CssClass="btn btn-primary" 
        Text="Buscar" onclick="btnBuscarC_Click" />
    <br />
    <br />
    <asp:GridView ID="GridViewF" runat="server" AutoGenerateColumns="False" 
        CssClass="table table-hover table-striped">
        <Columns>
            <asp:BoundField DataField="IdCita" HeaderText="IdCita" />
            <asp:BoundField DataField="Cedula" HeaderText="Cedula Paciente" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre Paciente" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido Paciente" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
        </Columns>
    </asp:GridView>
    <br />
         <h4>Formula Medica al Usuario</h4>
    <p>&nbsp;</p>

    <asp:Label ID="Label3" runat="server" Text="IdCita Usuario:"></asp:Label>
    <asp:TextBox ID="txtIdCita" runat="server"></asp:TextBox>
         &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
        runat="server" ControlToValidate="txtIdCita" 
        ErrorMessage="Debe Ingresar el Codigo de la Cita" ForeColor="Red" 
        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:TextBox ID="txtFormula" runat="server" CssClass="form-control" 
        Height="76px" TextMode="MultiLine" Width="399px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="bntFormula" runat="server" CssClass="btn btn-primary" 
        Text="Guardar Formula Medica" onclick="bntFormula_Click" />
</form>
</asp:Content>
