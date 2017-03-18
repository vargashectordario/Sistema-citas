<%@ Page Title="" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="True" CodeBehind="AdministracionCitas.aspx.cs" Inherits="Clinica_ASP.AdministracionCitas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>
        &nbsp;&nbsp;
        Administración de Citas</h1>
        <div id="formCitas" class="form-group">

          <div id="FormCitas"class="form-group">
                <div class="row">
                 <h4 id="H4">Codigo Cita:</h4>
        <asp:TextBox ID="txtIdCita" runat="server" CssClass="form-control"></asp:TextBox>
                        <h4 id="H3">Fecha Cita:</h4>
				            <input type="text" id="DateFecha" runat="server" class="form-control input-lg" step="1" min="2015-11-12" max="2015-12-31" tabindex="6" required/>
                        </div>
			 
                <div class="row">
                 <h4 id="H1">Hora de Cita:</h4>
                 <input type="text" runat="server" name="hora" id="txtHoraC" value="06:45:00" max="19:45:00" min="06:45:00" 
                    step="10" class="form-control" />
				</div>	   
	   

       <div class="row">
                 <h4 id="H2">Descripcion:</h4>
				    <input type="text" runat="server" id="txtDescripcion" 
                        class="form-control input-lg" placeholder="Descripcion" tabindex="5" 
required/><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="txtDescripcion" ErrorMessage="Ingrese una Descripcion" 
                     ForeColor="Red"></asp:RequiredFieldValidator>
			    </div>

            </div>	       
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-hover table-striped">
                <Columns>
                    <asp:BoundField DataField="IdCita" HeaderText="Codigo Cita" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre Paciente" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha de la Cita" />
                    <asp:BoundField DataField="Hora" HeaderText="Hora Cita" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                </Columns>
            </asp:GridView>
        </div>

             <div class="row" class="col-md-4 text-center">
				    <div class="col-xs-12 col-md-6">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button class="btn btn-primary" tabindex="9" ID="btnAgendar" runat="server" 
                            Text="Agendar Cita" CausesValidation="true" onclick="btnAgendar_Click"/>
                     <asp:Button class="btn btn-success" tabindex="10" ID="btnConsultar" runat="server" 
                            Text="Consultar Cita" CausesValidation="False" formnovalidate 
                            onclick="btnConsultar_Click"/>

                    &nbsp;&nbsp;&nbsp;&nbsp;

                    &nbsp;
                     <asp:Button class="btn btn-danger" tabindex="11" ID="btnCancelar" runat="server" 
                            Text="Cancelar Cita" CausesValidation="False" formnovalidate 
                            onclick="btnCancelar_Click"/>

                  </div>
             </div>
   
    </form>
</asp:Content>
