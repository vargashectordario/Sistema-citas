using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_ASP
{
    public partial class InformeCitasPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReporte3_Click(object sender, EventArgs e)
        {
            try { ReportViewer1.LocalReport.Refresh(); }
            catch
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert(' Verifique Los Datos Ingresados')</script>");
            }
        }
    }
}