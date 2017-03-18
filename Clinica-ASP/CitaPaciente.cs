using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinica_ASP
{
    public class CitaPaciente
    {
        public int Cedula { get; set; }
        public int IdCita { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime Fecha { get; set; }
        public string Hora { get; set; }
        public int Telefono { get; set; }
    }
}