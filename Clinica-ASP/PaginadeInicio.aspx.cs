using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Security.Cryptography;
using System.Text;

namespace Clinica_ASP
{
    public partial class PaginadeInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Attributes["type"] = "email";

            if (Session["cedula"] != null)
            {
                loginUsuarios.Visible = false;
            }
            else
            {
                Session["user"] = null;
                loginUsuarios.Visible = true;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;
            string pass = EncriptacionMD5(txtPass.Value);

            ClinicaAspEntities db = new ClinicaAspEntities();

            string queryUsuario = (from n in db.Usuario
                                    where n.Email == email && n.Contrasena == pass
                                    select n.NombreUsuario).FirstOrDefault();

            if (queryUsuario != null)
            {

                int cedula = (from c in db.Usuario
                              where c.Email == email && c.Contrasena == pass
                              select c.Cedula).FirstOrDefault();


                int IdTipo = (from t in db.TipoUsuario
                              where t.Cedula == cedula
                              select t.IdTipoUsuario).FirstOrDefault();

                Session["user"] = queryUsuario;
                Session["cedula"] = cedula;
                Session["tipoUsuario"] = IdTipo;
                Session["correo"] = txtEmail.Value;

                Response.Redirect("PaginadeInicio.aspx");

            }
            else
            {
                lblMensaje.Text = "Usuario o Contraseña Incorrecto";
            }
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
    }
}