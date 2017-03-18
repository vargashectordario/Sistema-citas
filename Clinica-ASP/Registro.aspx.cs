using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;

namespace Clinica_ASP
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Attributes["type"] = "email";
            DateFecha.Attributes["type"] = "date";
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            //Verifica si el email ingresado ya se encuentra en la base de datos

            ClinicaAspEntities db = new ClinicaAspEntities();

            string verificarEmail = (from p in db.Usuario
                                  where p.Email == txtEmail.Value
                                  select p.Email).FirstOrDefault();

            int Identificacion = Convert.ToInt32(txtIdentificacion.Value);

            int verificarCedula = (from p in db.Usuario
                                  where p.Cedula == Identificacion
                                  select p.Cedula).FirstOrDefault();

            if (verificarEmail!=null)
            {
                LblValidarEmail.Text = "El correo " +verificarEmail +" ya se encuentra registrado";
            }
            else if (verificarCedula == Identificacion)
	        {
                LblValidarEmail.Text = "";
                LblValidarId.Text = "Este documento " + verificarCedula + " ya se encuentra registrado";     
	        }
            else
            {
                LblValidarId.Text = "";
                using (ClinicaAspEntities oConexion = new ClinicaAspEntities())
                {

                    Usuario nuevaPersona = new Usuario();
                    nuevaPersona.Cedula = Identificacion;
                    nuevaPersona.NombreUsuario = txtNombres.Value;
                    nuevaPersona.ApellidoUsuario = txtApellidos.Value;
                    nuevaPersona.telefono = Convert.ToInt32(txtTelefono.Value);
                    nuevaPersona.anionacimiento = Convert.ToDateTime(DateFecha.Value);
                    nuevaPersona.Email = txtEmail.Value;

                    if (EncriptacionMD5(txtPass.Value).Equals(EncriptacionMD5(txtPassValidar.Value)))
                    {
                        nuevaPersona.Contrasena = EncriptacionMD5(txtPass.Value);
                        try
                        {
                            oConexion.SaveChanges();
                            Mensajedebienvenida(txtEmail.Value, txtNombres.Value);
                            Response.Write("<script LANGUAGE='JavaScript' >alert('Te has registrado correctamente')</script>");
                        }
                        catch (Exception ex)
                        {
                            LblValidarEmail.Text = ex.Message;
                            Response.Write("<script LANGUAGE='JavaScript' >alert('Error!')</script>");
                        }
                    }
                    else
                    {
                        //Mensaje encima o debajo del campo Verificar Contraseña
                        LblValidarEmail.Text = "Las contraseñas ingresadas deben coincidir";
                    }

                    oConexion.AddToUsuario(nuevaPersona);
                    oConexion.SaveChanges();
                }
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }

        public static string EncriptacionMD5(string Pass)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(Pass));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }

        public void Mensajedebienvenida(string CorreoUsuario, string NombreUsuario)
        {
            string mensaje = NombreUsuario + "\n"+"\n" + "Gracias por registrarse en Portal Salud Web" + "\n" + "De click al siguiente enlace para ingresar a la pagina " + "http://localhost:48314/PaginadeInicio.aspx"; 
  
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.live.com"); //Para gmail usar: smtp.gmail.com
            mail.From = new MailAddress("PortalWebAd@hotmail.com", "Portal Salud Web", Encoding.UTF8); //Correo de gmail: contactosclinicaweb@gmail.com
            mail.Subject = "Gracias por registrarse en Portal Salud Web";
            mail.Body = mensaje;
            mail.To.Add(CorreoUsuario);

            SmtpServer.Port = 587; //Puerto para Gmail, Yahoo, Hotmail...

            SmtpServer.Credentials = new System.Net.NetworkCredential("PortalWebAd@hotmail.com", "Webclinica123+"); //Pass gmail: contactos2030
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
        }
    }
}