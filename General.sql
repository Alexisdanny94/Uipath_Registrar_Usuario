-----------------------------------------------------------------------------------------
--Se crea la tabla
if exists(select 1 from sysobjects where type='u' and name ='Tb_Usuario')
drop table Tb_Usuario
go

CREATE TABLE Tb_Usuario(
	[Cedula] [varchar](10) not null,
	[Nombre] [varchar](50) not null,
	[Apellido] [varchar](50) null,
	[Estado_Civil] [varchar](25) null, 
	[DEX_ROW_ID] [int] IDENTITY(1,1) not null,
)
GO

ALTER TABLE Tb_Usuario
   ADD CONSTRAINT PK_Tb_Usuario PRIMARY KEY CLUSTERED (Cedula);
-----------------------------------------------------------------------------------------------
-- Se guardar al usuario
if exists(select 1 from sysobjects where type='P' and name ='Sp_Registrar_Usuario')
drop procedure Sp_Registrar_Usuario
go

create procedure Sp_Registrar_Usuario
@Cedula as varchar(10),
@Nombre as varchar(50),
@Apellido as varchar(50),
@Estado_Civil as varchar(25),
@Mensaje as varchar(10) = '' output
as
begin
	insert into Tb_Usuario values (@Cedula, @Nombre, @Apellido, @Estado_Civil)
	set @Mensaje='Listo'
end
go
-------------------------------------------------------------------------------------------------
--Se visualiza a los usuarios creados
if exists(select 1 from sysobjects where type='V' and name ='Vi_Usuario')
drop view Vi_Usuario
go


create view Vi_Usuario  
as  
	select Cedula, Nombre, Apellido, Estado_Civil Estado_Civil from Tb_Usuario (nolock)
go