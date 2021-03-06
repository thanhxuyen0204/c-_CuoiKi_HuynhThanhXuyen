USE [master]
GO
/****** Object:  Database [HuynhThanhXuyenDB1]    Script Date: 06/21/21 12:03:49 AM ******/
CREATE DATABASE [HuynhThanhXuyenDB1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HuynhThanhXuyenDB1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HuynhThanhXuyenDB1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HuynhThanhXuyenDB1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HuynhThanhXuyenDB1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HuynhThanhXuyenDB1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET ARITHABORT OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET  MULTI_USER 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [HuynhThanhXuyenDB1]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06/21/21 12:03:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[IDcategory] [char](5) NOT NULL,
	[Namecategory] [nvarchar](100) NULL,
	[Description_ct] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDcategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06/21/21 12:03:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[IDproduct] [char](5) NOT NULL,
	[Nameproduct] [nvarchar](100) NULL,
	[Size] [nvarchar](10) NULL,
	[category] [char](5) NOT NULL,
	[Image] [varchar](max) NULL,
	[Description_pd] [nvarchar](200) NULL,
	[Quantity] [int] NULL,
	[UnitCost] [decimal](15, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 06/21/21 12:03:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[IDuser] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDuser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category] ([IDcategory], [Namecategory], [Description_ct]) VALUES (N'TH001', N'Skinlovers', N'Thương hiệu son trang điểm tự nhiên, mịn môi')
INSERT [dbo].[Category] ([IDcategory], [Namecategory], [Description_ct]) VALUES (N'TH002', N'Eveline', N'Thương hiệu son trang điểm lâu trôi')
INSERT [dbo].[Category] ([IDcategory], [Namecategory], [Description_ct]) VALUES (N'TH003', N'Pierrot', N'Thương hiệu son dưỡng ẩm, căng bóng')
INSERT [dbo].[Category] ([IDcategory], [Namecategory], [Description_ct]) VALUES (N'TH004', N'Dr HER Paris', N'Thương hiệu son dưỡng giúp môi hồng hào')
GO
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP01 ', N'Son trang điểm cao cấp Skinlovers Lovemore #304', N'7g', N'TH001', N'/Data/images/h1.png', N'Son trang điểm', 32, CAST(300000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP02 ', N'Son dưỡng môi tinh dầu dừa Lip Therapy Eveline', N'10g', N'TH002', N'/Data/images/h2.png', N'Son dưỡng môi', 43, CAST(250000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP03 ', N'Son bút chì W.Lab Velvet Color Stick', N'8g', N'TH003', N'/Data/images/h3.png', N'Son bút chì', 8, CAST(270000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP04 ', N'Son trang điểm W.Lab Wannabe 02 Cam ngọt', N'10g', N'TH004', N'/Data/images/h4.png', N'Son trang điểm', 9, CAST(340000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP05 ', N'Son trang điểm cao cấp Skinlovers Sexy Lady #505', N'10g', N'TH001', N'/Data/images/h5.png', N'Son trang điểm', 35, CAST(220000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP06 ', N'Chì kẻ môi Eveline màu đỏ #15_Red', N'7g', N'TH002', N'/Data/images/h6.png', N'Chì kẻ môi', 21, CAST(560000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP07 ', N'Son trang điểm W.Lab Wannabe 05 Đỏ Cherry ', N'5g', N'TH003', N'/Data/images/h7.png', N'Son trang điểm', 43, CAST(150000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP08 ', N'Son kem W.Lab Magnetic Color Lip Tint', N'10g', N'TH004', N'/Data/images/h8.png', N'Son kem', 23, CAST(400000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP09 ', N'Son trang điểm cao cấp Skinlovers Sexy Lady #505', N'5g', N'TH002', N'/Data/images/h9.png', N'Son bút chì', 43, CAST(240000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP10 ', N'Son trang điểm W.Lab Wannabe 02 Cam ngọt', N'4g', N'TH004', N'/Data/images/h10.png', N'Son trang điểm', 27, CAST(300000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP11 ', N'Son bút chì W.Lab Velvet Color Stick', N'5g', N'TH003', N'/Data/images/h11.png', N'Son bút chì', 43, CAST(240000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP12 ', N'Son trang điểm W.Lab Wannabe 02 Cam ngọt', N'7g', N'TH001', N'/Data/images/h12.png', N'Son dưỡng môi', 34, CAST(200000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP13 ', N'Son bút chì W.Lab Velvet Color Stick', N'5g', N'TH002', N'/Data/images/h13.png', N'Son dưỡng môi', 21, CAST(240000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP14 ', N'Son dưỡng môi tinh dầu dừa Lip Therapy Eveline', N'10g', N'TH004', N'/Data/images/h14.png', N'Son bút chì', 27, CAST(560000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP15 ', N'Son trang điểm W.Lab Wannabe 02 Cam ngọt', N'5g', N'TH003', N'/Data/images/h15.png', N'Son trang điểm', 21, CAST(220000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP16 ', N'Son trang điểm cao cấp Skinlovers Sexy Lady #505', N'8g', N'TH001', N'/Data/images/h16.png', N'Son dưỡng môi', 5, CAST(240000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP17 ', N'Son bút chì W.Lab Velvet Color Stick', N'7g', N'TH002', N'/Data/images/h17.png', N'Son bút chì', 27, CAST(560000 AS Decimal(15, 0)))
INSERT [dbo].[Product] ([IDproduct], [Nameproduct], [Size], [category], [Image], [Description_pd], [Quantity], [UnitCost]) VALUES (N'SP18 ', N'Son trang điểm W.Lab Wannabe 02 Cam ngọt', N'5g', N'TH004', N'/Data/images/h18.png', N'Son trang điểm', 8, CAST(240000 AS Decimal(15, 0)))
GO
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (1, N'admin', N'admin', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (2, N'ThanhXuyen', N'ThanhXuyen', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (3, N'VanNhat', N'VanNhat', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (5, N'NhuY', N'NhuY', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (6, N'MinhKhoa', N'MinhKhoa', N'blocked')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (7, N'KimNgan', N'KimNgan', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (8, N'ThanhNga', N'ThanhNga', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (9, N'QuangHuy', N'QuangHuy', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (10, N'LanVy', N'LanVy', N'blocked')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (11, N'NhuNgoc', N'NhuNgoc', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (12, N'MinhMan', N'MinhMan', N'blocked')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (13, N'HanUyen', N'HanUyen', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (14, N'ThanhLuan', N'ThanhLuan', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (15, N'VanPhuc', N'VanPhuc', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (17, N'NganKhanh', N'NganKhanh', N'activity')
INSERT [dbo].[UserAccount] ([IDuser], [UserName], [Password], [Status]) VALUES (18, N'CamLe', N'CamLe', N'blocked')
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category])
REFERENCES [dbo].[Category] ([IDcategory])
GO
USE [master]
GO
ALTER DATABASE [HuynhThanhXuyenDB1] SET  READ_WRITE 
GO
