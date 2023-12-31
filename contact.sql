USE [master]
GO
/****** Object:  Database [contact]    Script Date: 15/7/2023 1:06:01 p. m. ******/
CREATE DATABASE [contact]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'contact', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.LOCAL\MSSQL\DATA\contact.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'contact_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.LOCAL\MSSQL\DATA\contact_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [contact] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [contact].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [contact] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [contact] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [contact] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [contact] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [contact] SET ARITHABORT OFF 
GO
ALTER DATABASE [contact] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [contact] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [contact] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [contact] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [contact] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [contact] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [contact] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [contact] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [contact] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [contact] SET  ENABLE_BROKER 
GO
ALTER DATABASE [contact] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [contact] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [contact] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [contact] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [contact] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [contact] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [contact] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [contact] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [contact] SET  MULTI_USER 
GO
ALTER DATABASE [contact] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [contact] SET DB_CHAINING OFF 
GO
ALTER DATABASE [contact] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [contact] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [contact] SET DELAYED_DURABILITY = DISABLED 
GO
USE [contact]
GO
/****** Object:  Table [dbo].[contact_list]    Script Date: 15/7/2023 1:06:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contact_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nomApe] [varchar](80) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK__contact___3213E83FA62E1F30] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[contact_list] ON 

INSERT [dbo].[contact_list] ([id], [nomApe], [correo], [telefono]) VALUES (1, N'Juan Diego Rincon Urdaneta', N'jd.rincon021@gmail.com', N'0414-6801859')
INSERT [dbo].[contact_list] ([id], [nomApe], [correo], [telefono]) VALUES (2, N'Luis Rincon', N'luis.arturo.1997@gmail.com', N'0414-996669')
INSERT [dbo].[contact_list] ([id], [nomApe], [correo], [telefono]) VALUES (3, N'Jose Ferrer', N'jose@gmail.com', N'0412-52525255')
INSERT [dbo].[contact_list] ([id], [nomApe], [correo], [telefono]) VALUES (7, N'Maria del Barrio Gonzalez Urdaneta', N'mdelbarrio@gmail.com', N'0414-696885')
SET IDENTITY_INSERT [dbo].[contact_list] OFF
/****** Object:  StoredProcedure [dbo].[contact_editar]    Script Date: 15/7/2023 1:06:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[contact_editar](
	@nomApe varchar(80),
	@correo varchar(80),
	@telefono varchar(80),
	@id int 
)as
  update contact_list set nomApe=@nomApe, correo=@correo, telefono=@telefono where id=@id;
GO
/****** Object:  StoredProcedure [dbo].[contact_eliminar]    Script Date: 15/7/2023 1:06:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[contact_eliminar](
	@id int 
)as
	delete from contact_list where id=@id;
GO
/****** Object:  StoredProcedure [dbo].[contact_guardar]    Script Date: 15/7/2023 1:06:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[contact_guardar] (@nomape varchar(100), @correo varchar(100), @telefono varchar(20)) as insert into contact_list (nomApe, correo, telefono) values (@nomape, @correo, @telefono);
GO
/****** Object:  StoredProcedure [dbo].[contact_listar]    Script Date: 15/7/2023 1:06:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[contact_listar] 
as 
select * from contact_list;
GO
/****** Object:  StoredProcedure [dbo].[contact_obtener]    Script Date: 15/7/2023 1:06:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[contact_obtener](@id int) as select * from contact_list where id=@id;
GO
USE [master]
GO
ALTER DATABASE [contact] SET  READ_WRITE 
GO
