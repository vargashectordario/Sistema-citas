<%@ Page Title="" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="PaginadeInicio.aspx.cs" Inherits="Clinica_ASP.PaginadeInicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form id="Form1" class="form-horizontal" role="form" runat="server">
<div class="container" runat="server">

    <div class="row">
        <div class="col-md-4">
            <h2>Bienvenidos A la Pagina Web</h2>
        </div>
    </div>

    <div class="row" id="loginUsuarios" runat="server">
        <div class="col-md-5 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="txtEmail" class="col-sm-3 control-label">
                            Email:</label>
                        <div class="col-sm-9">
                            <input type="text" runat="server" class="form-control" id="txtEmail" placeholder="Email" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPass" class="col-sm-3 control-label">
                            Contraseña:</label>
                        <div class="col-sm-9">
                            <input type="password" runat="server" class="form-control" id="txtPass" placeholder="Contraseña" required/>
                        </div>
                    </div>

                    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>

                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <asp:Button ID="btnIngresar" class="btn btn-primary" runat="server" 
                                Text="Ingresar" onclick="btnIngresar_Click" />
                        </div>
                    </div>
                   
                </div>
                <div class="panel-footer">
                     <a href="Registro.aspx">Registrese en este sitio</a>
                </div>
            </div>
        </div>
    </div>
</div>
 </form>
</asp:Content>
