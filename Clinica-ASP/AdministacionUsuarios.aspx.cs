﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_ASP
{
    public partial class AdministacionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cedula"] == null)
            {
                Response.Redirect("Principal.aspx");
            }
        }

        protected void btnRol_Click(object sender, EventArgs e)
        {
            try
            {
                using (ClinicaAspEntities oConexion = new ClinicaAspEntities())
                {
                    int cedulaIngresada = Convert.ToInt32(txtCedula.Text);
                    var cedula = (from u in oConexion.TipoUsuario
                                  where u.Cedula == cedulaIngresada
                                  select u).FirstOrDefault();

                    if (cedula != null)
                    {
                        cedula.IdTipoUsuario = Convert.ToInt32(ddlTipo.SelectedValue);
                        cedula.NombreTipoUsuario = ddlTipo.SelectedItem.Text;
                        txtCedula.Text = "";
                        oConexion.SaveChanges();
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Se cambio el Rol Correctamente')</script>");
                    }
                    else
                    {
                        TipoUsuario NuevoRol = new TipoUsuario();

                        NuevoRol.Cedula = cedulaIngresada;
                        NuevoRol.IdTipoUsuario = Convert.ToInt32(ddlTipo.SelectedValue);
                        NuevoRol.NombreTipoUsuario = ddlTipo.SelectedItem.Text;

                        oConexion.TipoUsuario.AddObject(NuevoRol);
                        oConexion.SaveChanges();
                        bool n = true;

                        if (n == true)
                        {
                            txtCedula.Text = "";
                            Response.Write("<script LANGUAGE='JavaScript' >alert('Se Asigno el Rol Correctamente')</script>");
                        }
                    }
                }
            }
            catch {

                Response.Write("<script LANGUAGE='JavaScript' >alert('Ingrese Nuevamente la Cedula Deseada')</script>");
            }
        }

        protected void btnRolC_Click(object sender, EventArgs e)
        {
            try
            {
                using (ClinicaAspEntities oConexion = new ClinicaAspEntities())
                {
                    int Cedula = Convert.ToInt32(txtCedula.Text);
                    TipoUsuario CancelarRol = oConexion.TipoUsuario.Where(w => w.Cedula == Cedula).Single();

                    oConexion.DeleteObject(CancelarRol);
                    oConexion.SaveChanges();
                    bool ee = true;
                    if (ee == true)
                    {

                        Response.Write("<script LANGUAGE='JavaScript' >alert('Se Quito el Rol Correctamente')</script>");

                    }

                }

            }
            catch
            {

                Response.Write("<script LANGUAGE='JavaScript' >alert('No Se Actualizo Correctamente')</script>");
            }
        }
    }
}