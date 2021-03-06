USE [master]
GO
/****** Object:  Database [YemekTarifleri_Db]    Script Date: 30.05.2020 13:59:34 ******/
CREATE DATABASE [YemekTarifleri_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YemekTarifleri_Db', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\YemekTarifleri_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YemekTarifleri_Db_log', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\YemekTarifleri_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YemekTarifleri_Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YemekTarifleri_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YemekTarifleri_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YemekTarifleri_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YemekTarifleri_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YemekTarifleri_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YemekTarifleri_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [YemekTarifleri_Db] SET  MULTI_USER 
GO
ALTER DATABASE [YemekTarifleri_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YemekTarifleri_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YemekTarifleri_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YemekTarifleri_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YemekTarifleri_Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YemekTarifleri_Db', N'ON'
GO
ALTER DATABASE [YemekTarifleri_Db] SET QUERY_STORE = OFF
GO
USE [YemekTarifleri_Db]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Soyad] [varchar](50) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[Sifre] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciOnerileri]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciOnerileri](
	[OneriId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciId] [int] NOT NULL,
	[TarifAdi] [varchar](50) NOT NULL,
	[TarifMalzemeleri] [varchar](400) NOT NULL,
	[TarifAciklama] [varchar](max) NOT NULL,
	[Tarih] [smalldatetime] NULL,
	[TarifResim] [varchar](250) NOT NULL,
 CONSTRAINT [PK_KullaniciOnerileri] PRIMARY KEY CLUSTERED 
(
	[OneriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YemekTarifleri]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YemekTarifleri](
	[YemekId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriId] [tinyint] NOT NULL,
	[YemekAdi] [varchar](80) NOT NULL,
	[Malzemeler] [varchar](400) NOT NULL,
	[YemekTarif] [varchar](max) NOT NULL,
	[Resim] [varchar](250) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_YemekTarifleri] PRIMARY KEY CLUSTERED 
(
	[YemekId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumId] [int] IDENTITY(1,1) NOT NULL,
	[YemekId] [int] NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[YorumOnay] [bit] NOT NULL,
	[Aciklama] [varchar](300) NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KullaniciOnerileri] ADD  CONSTRAINT [DF_KullaniciOnerileri_Tarih]  DEFAULT (CONVERT([datetime],(0))) FOR [Tarih]
GO
ALTER TABLE [dbo].[YemekTarifleri] ADD  CONSTRAINT [DF_YemekTarifleri_Tarih]  DEFAULT (CONVERT([datetime],(0))) FOR [Tarih]
GO
ALTER TABLE [dbo].[Yorumlar] ADD  CONSTRAINT [DF_Yorumlar_Ad]  DEFAULT ('Google Kullanıcısı') FOR [Ad]
GO
ALTER TABLE [dbo].[Yorumlar] ADD  CONSTRAINT [DF_Yorumlar_Tarih]  DEFAULT (CONVERT([datetime],(0))) FOR [Tarih]
GO
ALTER TABLE [dbo].[Yorumlar] ADD  CONSTRAINT [DF_Yorumlar_YorumOnay]  DEFAULT ((0)) FOR [YorumOnay]
GO
ALTER TABLE [dbo].[KullaniciOnerileri]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciOnerileri_Kullanicilar] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
GO
ALTER TABLE [dbo].[KullaniciOnerileri] CHECK CONSTRAINT [FK_KullaniciOnerileri_Kullanicilar]
GO
ALTER TABLE [dbo].[YemekTarifleri]  WITH CHECK ADD  CONSTRAINT [FK_YemekTarifleri_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[YemekTarifleri] CHECK CONSTRAINT [FK_YemekTarifleri_Kategoriler]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_YemekTarifleri] FOREIGN KEY([YemekId])
REFERENCES [dbo].[YemekTarifleri] ([YemekId])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_YemekTarifleri]
GO
/****** Object:  StoredProcedure [dbo].[Sb_DeleteKullanicilar]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sb_DeleteKullanicilar]
(
  @KullaniciId int
)
As
Begin 
  delete from Kullanicilar where KullaniciId=@KullaniciId
End 
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteKullaniciOnerileri]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_DeleteKullaniciOnerileri]
(
   @OneriId int 
)
as
begin
 delete from KullaniciOnerileri where OneriId=@OneriId
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertKullanicilar]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_InsertKullanicilar]
(
   @Ad varchar(50),
   @Soyad varchar(50),
   @Email varchar(80),
   @Sifre varchar(10)

)
As
Begin
 Insert Into Kullanicilar(Ad,Soyad,Email,
 Sifre) values (@Ad,@Soyad,@Email,@Sifre)

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertKullaniciOnerileri]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_InsertKullaniciOnerileri] 
(
  @KullaniciId int ,
  @TarifAdi varchar(50),
  @TarifMalzemeleri varchar(400),
  @TarifAciklama varchar(max),
  @Tarih  smalldatetime,
  @TarifResim varchar(250)

)
As
Begin
       Insert Into KullaniciOnerileri (KullaniciId,TarifAdi,TarifMalzemeleri,TarifAciklama,Tarih
	   ,TarifResim) values (@KullaniciId,@TarifAdi,@TarifMalzemeleri,@TarifAciklama,@Tarih,@TarifResim)

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_KullaniciIdListele]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_KullaniciIdListele]
	
AS
BEGIN
	select KullaniciId from Kullanicilar
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_KullanicilarListe]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_KullanicilarListe]
	
AS
BEGIN
	select*from Kullanicilar
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_KullaniciOnerileriListele]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_KullaniciOnerileriListele]
	
AS
BEGIN
	
	select *from KullaniciOnerileri
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateKullanicilar]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_UpdateKullanicilar]
(
   @KullaniciId int,
   @Ad varchar(50),
   @Soyad varchar(50),
   @Email varchar(80),
   @Sifre varchar(10)
)
As 
Begin
Update Kullanicilar set Ad=@Ad,
Soyad=@Soyad,Email=@Email,Sifre=
@Sifre where KullaniciId=@KullaniciId

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateKullaniciOnerileri]    Script Date: 30.05.2020 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_UpdateKullaniciOnerileri]
(
   @OneriId int,
   @KullaniciAdi int,
   @TarifAdi varchar(50),
   @TarifMalzemeleri varchar(400),
   @TarifAciklama varchar(max),
   @Tarih smalldatetime, 
   @TarifResim varchar(250)
)
as
begin
      update KullaniciOnerileri set KullaniciId=@KullaniciAdi,TarifAdi=@TarifAdi,
	  TarifMalzemeleri=@TarifMalzemeleri,TarifAciklama=@TarifAciklama,Tarih=@Tarih,TarifResim=@TarifResim
	  where OneriId=@OneriId
end
GO
USE [master]
GO
ALTER DATABASE [YemekTarifleri_Db] SET  READ_WRITE 
GO
