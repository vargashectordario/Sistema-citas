
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/11/2015 18:07:50
-- Generated from EDMX file: C:\Users\JulianJa\Documents\SemilleroClinicaAsp\Clinica-ASP\Clinica-ASP\ClinicaBD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PortalWeb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Cita__Cedula__09DE7BCC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cita] DROP CONSTRAINT [FK__Cita__Cedula__09DE7BCC];
GO
IF OBJECT_ID(N'[dbo].[FK__FormulaMe__IdCit__0EA330E9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FormulaMedica] DROP CONSTRAINT [FK__FormulaMe__IdCit__0EA330E9];
GO
IF OBJECT_ID(N'[dbo].[FK__TipoUsuar__Cedul__0519C6AF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TipoUsuario] DROP CONSTRAINT [FK__TipoUsuar__Cedul__0519C6AF];
GO
IF OBJECT_ID(N'[dbo].[FK_FormulaMedica_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FormulaMedica] DROP CONSTRAINT [FK_FormulaMedica_Usuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cita]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cita];
GO
IF OBJECT_ID(N'[dbo].[FormulaMedica]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FormulaMedica];
GO
IF OBJECT_ID(N'[dbo].[TipoUsuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoUsuario];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cita'
CREATE TABLE [dbo].[Cita] (
    [IdCita] int IDENTITY(1,1) NOT NULL,
    [Cedula] int  NOT NULL,
    [FechaCita] datetime  NOT NULL,
    [HoraCita] varchar(50)  NOT NULL,
    [Descripcion] varchar(150)  NOT NULL
);
GO

-- Creating table 'FormulaMedica'
CREATE TABLE [dbo].[FormulaMedica] (
    [IdCita] int  NOT NULL,
    [IdFormulaMedica] int IDENTITY(1,1) NOT NULL,
    [RecetaMedica] varchar(150)  NOT NULL,
    [Cedula] int  NOT NULL
);
GO

-- Creating table 'TipoUsuario'
CREATE TABLE [dbo].[TipoUsuario] (
    [IdTipoUsuario] int  NOT NULL,
    [NombreTipoUsuario] varchar(50)  NOT NULL,
    [Cedula] int  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [Cedula] int  NOT NULL,
    [NombreUsuario] varchar(50)  NOT NULL,
    [ApellidoUsuario] varchar(50)  NOT NULL,
    [Email] varchar(150)  NOT NULL,
    [Contrasena] varchar(100)  NOT NULL,
    [anionacimiento] datetime  NOT NULL,
    [telefono] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdCita] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [PK_Cita]
    PRIMARY KEY CLUSTERED ([IdCita] ASC);
GO

-- Creating primary key on [IdFormulaMedica] in table 'FormulaMedica'
ALTER TABLE [dbo].[FormulaMedica]
ADD CONSTRAINT [PK_FormulaMedica]
    PRIMARY KEY CLUSTERED ([IdFormulaMedica] ASC);
GO

-- Creating primary key on [Cedula] in table 'TipoUsuario'
ALTER TABLE [dbo].[TipoUsuario]
ADD CONSTRAINT [PK_TipoUsuario]
    PRIMARY KEY CLUSTERED ([Cedula] ASC);
GO

-- Creating primary key on [Cedula] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Cedula] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Cedula] in table 'Cita'
ALTER TABLE [dbo].[Cita]
ADD CONSTRAINT [FK__Cita__Cedula__09DE7BCC]
    FOREIGN KEY ([Cedula])
    REFERENCES [dbo].[Usuario]
        ([Cedula])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Cita__Cedula__09DE7BCC'
CREATE INDEX [IX_FK__Cita__Cedula__09DE7BCC]
ON [dbo].[Cita]
    ([Cedula]);
GO

-- Creating foreign key on [IdCita] in table 'FormulaMedica'
ALTER TABLE [dbo].[FormulaMedica]
ADD CONSTRAINT [FK__FormulaMe__IdCit__0EA330E9]
    FOREIGN KEY ([IdCita])
    REFERENCES [dbo].[Cita]
        ([IdCita])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__FormulaMe__IdCit__0EA330E9'
CREATE INDEX [IX_FK__FormulaMe__IdCit__0EA330E9]
ON [dbo].[FormulaMedica]
    ([IdCita]);
GO

-- Creating foreign key on [Cedula] in table 'FormulaMedica'
ALTER TABLE [dbo].[FormulaMedica]
ADD CONSTRAINT [FK_FormulaMedica_Usuario]
    FOREIGN KEY ([Cedula])
    REFERENCES [dbo].[Usuario]
        ([Cedula])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FormulaMedica_Usuario'
CREATE INDEX [IX_FK_FormulaMedica_Usuario]
ON [dbo].[FormulaMedica]
    ([Cedula]);
GO

-- Creating foreign key on [Cedula] in table 'TipoUsuario'
ALTER TABLE [dbo].[TipoUsuario]
ADD CONSTRAINT [FK__TipoUsuar__Cedul__0519C6AF]
    FOREIGN KEY ([Cedula])
    REFERENCES [dbo].[Usuario]
        ([Cedula])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------