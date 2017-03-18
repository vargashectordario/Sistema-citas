using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting;
namespace Clinica_ASP
{
    public partial class ReporteHistoriaClinica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            try { ReportViewer1.LocalReport.Refresh(); }
            catch
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert(' Verifique Los Datos Ingresados')</script>");
            }
            
        }
    }
}