<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/PgMaster.Master" AutoEventWireup="true" CodeBehind="InformeCitaMedico.aspx.cs" Inherits="Clinica_ASP.InformeCitaMedico" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>
        Informe Citas Medico</h1>
    <p>
        &nbsp;</p>
    <asp:Label ID="Label3" runat="server" Text="Cedula Usuario:"></asp:Label>
    <asp:TextBox ID="txtCedulaReporte4" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionReporte4" runat="server" 
             ErrorMessage="Debe Ingresar  su Cedula" ForeColor="Red" 
             ValidationExpression="^[0-9]*$" 
    ControlToValidate="txtCedulaReporte4"></asp:RegularExpressionValidator>
    <asp:Button ID="btnReporte4" runat="server" CssClass="btn btn-primary" 
            Text="Buscar" onclick="btnReporte4_Click" />
    <br />
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="700px" InteractiveDeviceInfos="(Colección)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="672px">
        <localreport reportpath="InformeCitaMedico.rdlc">
            <datasources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </datasources>
        </localreport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData2" 
        TypeName="Clinica_ASP.PortalWebDataSetTableAdapters.InformeCitaMedicoTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCedulaReporte4" Name="cedula" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </form>
</asp:Content>
