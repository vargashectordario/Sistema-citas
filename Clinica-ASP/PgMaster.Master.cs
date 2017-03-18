using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_ASP
{
    public partial class PgMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cedula"] != null)
            {
                RegistroL.Visible = false;
                UsuarioL.Visible = true;
                ReportesL.Visible = true;

                if (Session["tipoUsuario"].ToString()=="1") //Administador
                {
                    AdminUser.Visible = true;
                    AdminFormula.Visible = false;
                    MenuCitas.Visible = false;
                    ReportesL.Visible = true;
                    ReportCitasP.Visible = true;
                    ReportHistoriaC.Visible = false;
                    ReportFormulaM.Visible = false;
                    ReportCitasM.Visible = false;
                }
                else if (Session["tipoUsuario"].ToString()=="2") //Medico
                {
                    AdminUser.Visible = false;
                    AdminFormula.Visible = true;
                    MenuCitas.Visible = false;
                    ReportCitasP.Visible = false;
                    ReportHistoriaC.Visible = true;
                    ReportFormulaM.Visible = true;
                    ReportCitasM.Visible = true;
                }
                else //Paciente o usuario sin rol
                {
                    AdminUser.Visible = false;
                    AdminFormula.Visible = false;
                    MenuCitas.Visible = true;
                    ReportCitasP.Visible = false;
                    ReportHistoriaC.Visible = true;
                    ReportFormulaM.Visible = false;
                    ReportCitasM.Visible = false;
                }
            }
            else // Sin iniciar sesion
            {
                UsuarioL.Visible = false;
                RegistroL.Visible = true;
                MenuCitas.Visible = false;
                AdminUser.Visible = false;
                AdminFormula.Visible = false;
                ReportesL.Visible = false;
            }
            
        }

        protected void CerrarSesionAction_Click(object sender, EventArgs e)
        {
            Session["cedula"] = null;
            Session["user"] = null;
            Session["tipousuario"] = null;
            Session["correo"] = null;
            UsuarioL.Visible = false;
            RegistroL.Visible = true;
            AdminUser.Visible = false;
            AdminFormula.Visible = false;
            MenuCitas.Visible = false;
            ReportesL.Visible = false;
            ReportCitasM.Visible = false;
            Session.Clear();
            Response.Redirect("PaginadeInicio.aspx");
        }

    }
}