<%@ Page Title="" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="AdministacionUsuarios.aspx.cs" Inherits="Clinica_ASP.AdministacionUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>Administración de Usuarios</h1>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" 
            Text="Buscar" />
&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtNombre" ErrorMessage="Solo Ingresar Texto" 
            ForeColor="Red" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
    </p>
    <p>
     <div class="Griew">
        <asp:GridView ID="GridView1" runat="server" 
            CssClass="table table-hover table-striped" AutoGenerateColumns="False" 
             DataKeyNames="Cedula" DataSourceID="EntityDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="Cedula" HeaderText="Cedula" ReadOnly="True" 
                    SortExpression="Cedula" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" 
                    SortExpression="NombreUsuario" />
                <asp:BoundField DataField="ApellidoUsuario" HeaderText="ApellidoUsuario" 
                    SortExpression="ApellidoUsuario" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="anionacimiento" HeaderText="Año de Nacimiento" 
                    SortExpression="anionacimiento" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" 
                    SortExpression="telefono" />
            </Columns>
        </asp:GridView>
         </div>
         <h4>Asignacion de Permisos</h4>
        <p>&nbsp;</p>

    <asp:Label ID="Label3" runat="server" Text="Cedula Usuario:"></asp:Label>
&nbsp;<asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionV" runat="server" 
             ErrorMessage="Debe Ingresar  su Cedula" ForeColor="Red" 
             ValidationExpression="^[0-9]*$" ControlToValidate="txtCedula"></asp:RegularExpressionValidator>
    <asp:Label ID="Label2" runat="server" Text="Tipo de Usuario"></asp:Label>
&nbsp;
    <asp:DropDownList ID="ddlTipo" runat="server">
        <asp:ListItem Value="01">Administrador</asp:ListItem>
        <asp:ListItem Value="02">Medico</asp:ListItem>
        <asp:ListItem Value="03">Paciente</asp:ListItem>
    </asp:DropDownList>
&nbsp;
    <asp:Button ID="btnRol" runat="server" CssClass="btn btn-primary" 
        onclick="btnRol_Click" Text="Asignar Rol" />
      <asp:Button ID="btnRolC" runat="server" CssClass="btn btn-primary" 
            Text="Quitar Rol" onclick="btnRolC_Click" />

   
    <p>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
            ConnectionString="name=ClinicaAspEntities" 
            DefaultContainerName="ClinicaAspEntities" EnableDelete="True" 
            EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
            EntitySetName="Usuario"
            Where="it.NombreUsuario LIKE '%' +@NombreUsuario+ '%'">
            <WhereParameters>
            <asp:ControlParameter ControlID="txtNombre" DefaultValue="%" 
                Name="NombreUsuario" PropertyName="Text" Type="String" />
        </WhereParameters>
        </asp:EntityDataSource>
    </p>
    </form>
</asp:Content>
