using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinica_ASP
{
    public class CitaHistoria
    {
        public int IdCita { get; set; }
        public int Cedula { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime Fecha { get; set; }
        public string Descripcion { get; set; }
    }
}