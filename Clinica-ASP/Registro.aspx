<%@ Page Title="" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Clinica_ASP.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
    <div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			    <h2>Registro <small>Ingrese los siguientes datos</small></h2>
			    <div class="row">
				    <div class="col-xs-12 col-sm-6 col-md-6">
					    <div class="form-group">
                            <input type="text" runat="server" id="txtNombres" class="form-control input-lg" placeholder="Nombre" tabindex="1" required/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorNombre" runat="server" ErrorMessage="Ingrese tu nombre" ForeColor="Red" ControlToValidate="txtNombres" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
					    </div>
				    </div>
				    <div class="col-xs-12 col-sm-6 col-md-6">
					    <div class="form-group">
						    <input type="text" runat="server" id="txtApellidos" class="form-control input-lg" placeholder="Apellidos" tabindex="2" required/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorApellidos" 
                                runat="server" ErrorMessage="Ingrese tus Apellidos" ForeColor="Red" 
                                ControlToValidate="txtApellidos" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
					    </div>
				    </div>
			    </div>
			    <div class="form-group">
				    <input type="text" runat="server" id="txtIdentificacion" class="form-control input-lg" placeholder="Documento de identificación" tabindex="3" required/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorIdentificacion" runat="server" ErrorMessage="Ingrese tu documento de identificación" ForeColor="Red" ControlToValidate="txtIdentificacion" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    <asp:Label ID="LblValidarId" runat="server" ForeColor="Red"></asp:Label>
			    </div>
			    <div class="form-group">
				    <input type="text" runat="server" id="txtEmail" class="form-control input-lg" placeholder="Correo electrónico" tabindex="4" required/>
                    <asp:Label ID="LblValidarEmail" runat="server" ForeColor="Red"></asp:Label>
			    </div>
			    <div class="form-group">
				    <input type="text" runat="server" id="txtTelefono" class="form-control input-lg" placeholder="Número de contacto" tabindex="5" required/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese tu número teléfonico" ForeColor="Red" ControlToValidate="txtTelefono" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
			    </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-5 col-md-5">
                        <div class="form-group">
                        <h4 id="LabelFechadenacimiento">Fecha de nacimiento:</h4>
                        </div>
			        </div>
                    <div class="col-xs-12 col-sm-7 col-md-7">
                        <div class="form-group">
				            <input type="text" id="DateFecha" runat="server" class="form-control input-lg" step="1" min="1890-01-01" max="2015-11-12" tabindex="6" required/>
                        </div>
			        </div>
                </div>
			    <div class="row">
				    <div class="col-xs-12 col-sm-6 col-md-6">
					    <div class="form-group">
						    <input type="password" runat="server" id="txtPass" class="form-control input-lg" placeholder="Contraseña" tabindex="7" required/>
					    </div>
				    </div>
				    <div class="col-xs-12 col-sm-6 col-md-6">
					    <div class="form-group">
						    <input type="password" runat="server" id="txtPassValidar" class="form-control input-lg" placeholder="Confirmar Contraseña" tabindex="8" required/>
					    </div>
				    </div>
			    </div>
			
			    <div class="row" class="col-md-4 text-center">
				    <div class="col-xs-12 col-md-6">
                     <asp:Button class="btn btn-primary" tabindex="9" ID="btnRegistrar" runat="server" Text="Registrarse" onclick="btnRegistrar_Click" CausesValidation="true"/>
                     <asp:Button class="btn btn-warning" tabindex="10" ID="BtnCancelar" runat="server" 
                            Text="Cancelar" CausesValidation="False" onclick="BtnCancelar_Click" formnovalidate/>
                    </div>
			    </div>
	    </div>
    </div>
    </div>
</form>
</asp:Content>
