--Primer Reporte--
Create Procedure HistoriaPaciente
@cedula int
AS  
 select C.Cedula, U.NombreUsuario, U.ApellidoUsuario, U.anionacimiento ,C.Descripcion, F.RecetaMedica
  from Usuario as U
  left join Cita as C
  on U.Cedula=@cedula
  join FormulaMedica as F
  on C.IdCita = F.IdCita;
RETURN
-----------------------------------------------------------------------------------
--Segundo Reporte Paciente--

create Procedure InformeCitaPaciente
@cedula int
AS  
SELECT     dbo.Cita.Cedula, dbo.Usuario.NombreUsuario, dbo.Usuario.ApellidoUsuario, dbo.Cita.IdCita, dbo.Cita.FechaCita, dbo.TipoUsuario.NombreTipoUsuario
FROM         dbo.Cita INNER JOIN
                      dbo.Usuario ON dbo.Cita.Cedula = dbo.Usuario.Cedula INNER JOIN
                      dbo.TipoUsuario ON dbo.Usuario.Cedula = dbo.TipoUsuario.Cedula
    where dbo.Cita.Cedula = @cedula

----------------------------------------------------------------------------------------------------------------------------------
--Segundo Reporte Medico--

create procedure InformeCitaMedico
@cedula int
As
SELECT     dbo.Cita.IdCita, dbo.FormulaMedica.IdFormulaMedica, dbo.FormulaMedica.RecetaMedica, dbo.Cita.Descripcion, dbo.FormulaMedica.Cedula
FROM         dbo.FormulaMedica INNER JOIN
                      dbo.Cita ON dbo.FormulaMedica.IdCita = dbo.Cita.IdCita
                      
where dbo.FormulaMedica.Cedula = @cedula 



-----------------------------------------------------------------------------------
--Tercer Reporte--

create Procedure InformeCita
@cedula int
AS  
 select C.Cedula,C.IdCita, C.FechaCita, C.HoraCita, C.Descripcion, F.RecetaMedica
  from Cita as C
  join FormulaMedica as F
  on C.IdCita= F.IdCita 
  where C.Cedula = @cedula
RETURN