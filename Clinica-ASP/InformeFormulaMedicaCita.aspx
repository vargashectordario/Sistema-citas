<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="InformeFormulaMedicaCita.aspx.cs" Inherits="Clinica_ASP.InformeFormulaMedicaCita" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>
        Informe Cita Medica</h1>
    <p>
        &nbsp;</p>
    <asp:Label ID="Label3" runat="server" Text="Cedula Usuario:"></asp:Label>
    <asp:TextBox ID="txtCedulaReporte2" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionReporte2" runat="server" 
             ErrorMessage="Debe Ingresar  su Cedula" ForeColor="Red" 
             ValidationExpression="^[0-9]*$" ControlToValidate="txtCedulaReporte2"></asp:RegularExpressionValidator>
    <asp:Button ID="btnReporte2" runat="server" CssClass="btn btn-primary" 
            Text="Buscar" onclick="btnReporte2_Click" />
    <br />
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="600px" InteractiveDeviceInfos="(Colección)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="670px">
        <LocalReport ReportPath="InformeCita.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData1" 
        TypeName="Clinica_ASP.PortalWebDataSetTableAdapters.InformeCitaTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCedulaReporte2" Name="cedula" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </form>
</asp:Content>
