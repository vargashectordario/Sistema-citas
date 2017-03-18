<%@ Page Title="" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="ReportesHistoriaClinica.aspx.cs" Inherits="Clinica_ASP.ReportesHistoriaClinica" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>
        Reporte Historia Clinica</h1>
<p>
        &nbsp;</p>
<p>

    <asp:Label ID="Label3" runat="server" Text="Cedula Usuario:"></asp:Label>
        <asp:TextBox ID="txtCedulaR" runat="server"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionR" runat="server" 
             ErrorMessage="Debe Ingresar  su Cedula" ForeColor="Red" 
             ValidationExpression="^[0-9]*$" ControlToValidate="txtCedulaR"></asp:RegularExpressionValidator>
    <asp:Button ID="btnBuscarR" runat="server" CssClass="btn btn-primary" 
            Text="Buscar" onclick="btnBuscarR_Click" />
    </p>
<p>
        </p>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Colección)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="601px">
        <LocalReport ReportPath="Report1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="Clinica_ASP.PortalWebDataSetTableAdapters.HistoriaClinicaTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCedulaR" Name="cedula" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</form>
</asp:Content>
