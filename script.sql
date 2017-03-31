USE [master]
GO
/****** Object:  Database [Tivi]    Script Date: 3/13/2017 7:31:46 AM ******/
CREATE DATABASE [Tivi]
 
GO
ALTER DATABASE [Tivi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tivi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tivi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tivi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tivi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tivi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tivi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tivi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tivi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Tivi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tivi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tivi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tivi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tivi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tivi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tivi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tivi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tivi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tivi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tivi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tivi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tivi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tivi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tivi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tivi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tivi] SET RECOVERY FULL 
GO
ALTER DATABASE [Tivi] SET  MULTI_USER 
GO
ALTER DATABASE [Tivi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tivi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tivi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tivi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tivi', N'ON'
GO
USE [Tivi]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ProductID] [nvarchar](8) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[text] [text] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](8) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[DoB] [date] NULL,
	[Gender] [nvarchar](5) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nchar](11) NULL,
	[AccumulatedScore] [int] NULL CONSTRAINT [DF_Customers_AccumulatedScore]  DEFAULT ((0)),
	[Username] [nvarchar](30) NULL,
	[Password] [nvarchar](32) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_KhachHang] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [nvarchar](8) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](32) NULL,
	[Role] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OderDetails]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OderDetails](
	[OderID] [nvarchar](8) NOT NULL,
	[ProductID] [nvarchar](8) NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OderDetails] PRIMARY KEY CLUSTERED 
(
	[OderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oders]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oders](
	[OderID] [nvarchar](8) NOT NULL,
	[CustomerID] [nvarchar](8) NULL,
	[OderDate] [date] NULL,
	[ShipDate] [date] NULL,
	[OderPrice] [money] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[DeliveryAddress] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
	[EmployeeID] [nvarchar](8) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[OderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produce]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produce](
	[ProduceID] [nvarchar](8) NOT NULL,
	[ProduceName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ProduceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](8) NULL,
	[FilePath] [nvarchar](100) NULL,
 CONSTRAINT [PK_HinhAnh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[ProductID] [nvarchar](8) NOT NULL,
	[ProductType] [nvarchar](50) NULL,
	[Resolution] [nvarchar](10) NULL,
	[HDMI] [nvarchar](10) NULL,
	[USB] [nvarchar](10) NULL,
	[Audio] [nvarchar](50) NULL,
	[VideoFormat] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThongSoKyThuat] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/13/2017 7:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nvarchar](8) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProduceID] [nvarchar](8) NULL,
	[Price] [money] NULL,
	[Description] [text] NULL,
	[Quantity] [int] NULL,
	[ProductImg] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Employees]    Script Date: 3/13/2017 7:31:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees] ON [dbo].[Employees]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_KhachHang] FOREIGN KEY([Username])
REFERENCES [dbo].[Customers] ([Username])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_BinhLuan_KhachHang]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[OderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([OderID])
REFERENCES [dbo].[Oders] ([OderID])
GO
ALTER TABLE [dbo].[OderDetails] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[OderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OderDetails] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_Oders_Employees]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_SanPham] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_HinhAnh_SanPham]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKyThuat_SanPham] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ThongSoKyThuat_SanPham]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_SanPham] FOREIGN KEY([ProduceID])
REFERENCES [dbo].[Produce] ([ProduceID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_SanPham_SanPham]
GO
USE [master]
GO
ALTER DATABASE [Tivi] SET  READ_WRITE 
GO
