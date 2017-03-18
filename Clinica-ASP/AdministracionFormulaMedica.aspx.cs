using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_ASP
{
    public partial class AdministracionFormulaMedica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarC_Click(object sender, EventArgs e)
        {
            try
            {

                int ced = Convert.ToInt32(txtConsultaC.Text);
                using (ClinicaAspEntities oConexion = new ClinicaAspEntities())
                {
                    List<CitaHistoria> resultado = (from c in oConexion.Usuario
                                                    join f in oConexion.Cita
                                                    on c.Cedula equals f.Cedula
                                                    where c.Cedula == ced
                                                    select new CitaHistoria()
                                                    {
                                                        IdCita = f.IdCita,
                                                        Cedula = c.Cedula,
                                                        Nombre = c.NombreUsuario,
                                                        Apellido = c.ApellidoUsuario,
                                                        Fecha = f.FechaCita,
                                                        Descripcion =  f.Descripcion

                                                    }
                                                    ).ToList();

                    GridViewF.DataSource = resultado;
                    GridViewF.DataBind();
                }

            }
            catch {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Verifique Los Datos Ingresados')</script>");
            
            }
        }

        protected void bntFormula_Click(object sender, EventArgs e)
        {
            try {
                using (ClinicaAspEntities oConexion = new ClinicaAspEntities())
                {
                    int ced = Convert.ToInt32(Session["cedula"]);
                    int IdCita = Convert.ToInt32(txtIdCita.Text);

                    FormulaMedica NuevaFormula = new FormulaMedica();

                    NuevaFormula.IdCita = IdCita;
                    NuevaFormula.Cedula = ced; 
                    NuevaFormula.RecetaMedica = txtFormula.Text;

                    oConexion.FormulaMedica.AddObject(NuevaFormula);
                    oConexion.SaveChanges();
                    bool n = true;

                    if (n == true)
                    {
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Se Registro Correctamente la Formula Medica')</script>");
                    }

                }
            
            }

            catch
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Verifique Los Datos Ingresados')</script>");

            }
        }


    }
}