<%@ Page Title="" EnableEventValidation="false" Language="C#"  MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="InformeCitasPaciente.aspx.cs" Inherits="Clinica_ASP.InformeCitasPaciente" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
<h1>
        Informe Citas Paciente</h1>
<p>
    &nbsp;</p>
<asp:Label ID="Label3" runat="server" Text="Cedula Usuario:"></asp:Label>
<asp:TextBox ID="txtCedulaReporte3" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionReporte3" runat="server" 
             ErrorMessage="Debe Ingresar  su Cedula" ForeColor="Red" 
             ValidationExpression="^[0-9]*$" 
    ControlToValidate="txtCedulaReporte3"></asp:RegularExpressionValidator>
<asp:Button ID="btnReporte3" runat="server" CssClass="btn btn-primary" 
            Text="Buscar" onclick="btnReporte3_Click" />
    <br />
<br />
<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
    Font-Size="8pt" Height="602px" InteractiveDeviceInfos="(Colección)" 
    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="670px">
    <LocalReport ReportPath="InformeCitaPaciente.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    SelectMethod="GetData3" 
    
        TypeName="Clinica_ASP.PortalWebDataSetTableAdapters.InformeCitaPacienteTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtCedulaReporte3" Name="cedula" 
            PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
</form>
</asp:Content>
