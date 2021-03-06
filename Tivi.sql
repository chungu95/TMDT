USE [master]
GO
/****** Object:  Database [Tivi]    Script Date: 5/13/2017 8:00:14 PM ******/
CREATE DATABASE [Tivi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tivi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tivi.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tivi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tivi_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Cart]    Script Date: 5/13/2017 8:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ProductID] [nvarchar](8) NULL,
	[ProductName] [nchar](10) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[CustomerID] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/13/2017 8:00:14 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 5/13/2017 8:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](8) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[DoB] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nchar](11) NULL,
	[Username] [nvarchar](30) NULL,
	[Password] [nvarchar](32) NULL,
	[Status] [nvarchar](20) NULL CONSTRAINT [DF_Customers_Status]  DEFAULT (N'NotActive'),
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/13/2017 8:00:14 PM ******/
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
	[Note] [nvarchar](50) NULL CONSTRAINT [DF_Employees_Note]  DEFAULT (N'đang hoạt động'),
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OderDetails]    Script Date: 5/13/2017 8:00:14 PM ******/
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
/****** Object:  Table [dbo].[Oders]    Script Date: 5/13/2017 8:00:14 PM ******/
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
	[DeliveryPhone] [nchar](11) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[OderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produce]    Script Date: 5/13/2017 8:00:14 PM ******/
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
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 5/13/2017 8:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[ProductID] [nvarchar](8) NOT NULL,
	[ProductType] [nvarchar](50) NULL,
	[Resolution] [nvarchar](50) NULL,
	[HDMI] [nvarchar](10) NULL,
	[USB] [nvarchar](10) NULL,
	[Model] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Warranty] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThongSoKyThuat] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/13/2017 8:00:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nvarchar](8) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProduceID] [nvarchar](8) NULL,
	[Price] [money] NULL,
	[Description] [ntext] NULL,
	[Quantity] [int] NULL,
	[ProductImg] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Cart] ([ProductID], [ProductName], [Price], [Quantity], [CustomerID]) VALUES (N'003', N' LED TIVI ', 4190000.0000, 1, N'JY7K26MX')
INSERT [dbo].[Cart] ([ProductID], [ProductName], [Price], [Quantity], [CustomerID]) VALUES (N'001', N'SMART TIVI', 9390000.0000, 1, N'JY7K26MX')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'32XYF9SH', N'Nguyễn Nam', CAST(N'1995-02-10' AS Date), N'Nam', N'tây ninh', N'nam@gmail.com', N'0384923    ', N'nam', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'3NEEL1WF', N'nghia nghia', CAST(N'0006-06-18' AS Date), N'Nữ', N'doeidknghia', N'nghia@gmail.com', N'23442      ', N'vidu', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'4IQ62DGU', N'Ngô Dung', CAST(N'1995-04-16' AS Date), N'Nữ', N'Bảo Lộc', N'Dung@gmail.com', N'08039263   ', N'dung', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'4X0LJY8G', N'Vũ Chung', CAST(N'1995-02-10' AS Date), N'Nam', N'HCMC', N'123@gmail.com', N'0988457017 ', N'chungcoi', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'7COLT612', N'Vũ Chung', CAST(N'1995-02-21' AS Date), N'Nam', N'hcm', N'chung@gmail.com', N'099738     ', N'chung', N'd1a346df2019a0c0fd79b4808e502cee', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'861GMCO5', N'Nguyễn Huệ', CAST(N'1995-01-17' AS Date), N'Nam', N'Quận 9, TP Hồ Chí Minh', N'lolem.hs@gmail.com', N'09089329   ', N'hue', N'202cb962ac59075b964b07152d234b70', N'Activated')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'AG121FQ8', N'Bùi Huyền', CAST(N'1995-03-03' AS Date), N'Nữ', N'quãng ngãi', N'huyen@gmail.com', N'0774682    ', N'buihuyen', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'DFXQM36X', N'Vũ  Chung', CAST(N'1995-02-09' AS Date), N'Nam', N'HCMC', N'chung@gmail.com', N'1234567890 ', N'chung123456', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'F9L89253', N'Vũ Dung', CAST(N'1995-02-09' AS Date), N'Nam', N'hcmc', N'chungkoi113@gmail.com', N'12324232   ', N'chung1234', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'FZVH0IAB', N'trần phạm Tuyết Trinh', CAST(N'1995-02-02' AS Date), N'Nữ', N'Biên Hòa', N'lolem.hs@gmail.com', N'01248357192', N'tuyettrinh', N'28415172efb5548286345b74313c260f', N'Activated')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'G38UWV8B', N'vo hoang', CAST(N'1995-02-12' AS Date), N'Nam', N'ăed', N'vogoab2g@gmail.com', N'01777      ', N'vohoang', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'IHWMBV0C', N'Vũ  Chung', CAST(N'1995-02-09' AS Date), N'Nam', N'HCMC', N'chung@gmail.com', N'0988462323 ', N'chung12345', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'IW5VCHHL', N'nghia h', CAST(N'1995-02-09' AS Date), N'Nam', N'nguhfsf', N'n@gmail.com', N'888        ', N'sa', N'c20ad4d76fe97759aa27a0c99bff6710', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'J9DDINOI', N'tran Tuyết Trinh', CAST(N'1995-02-09' AS Date), N'Nam', N'dong nai', N'abc@gmail.com', N'0          ', N'admin', N'c4ca4238a0b923820dcc509a6f75849b', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'JY7K26MX', N'   Tran Tam', CAST(N'0021-09-07' AS Date), N'Nữ', N'   TP. HCM', N'tam@gmail.com', N'0903962    ', N'login1', N'28415172efb5548286345b74313c260f', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'LJJW2CA2', N'tran Tuyết Trinh', CAST(N'1995-02-09' AS Date), N'Nữ', N' đong nai 123', N'abc@gmail.com', N'0123445    ', N'12345678234', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'LWUSJG0A', N'Phạm Thị Tuyết Trinh', CAST(N'1901-01-18' AS Date), N'Nữ', N'đ', N'abc@gmail.com', N'000        ', N'login', N'900150983cd24fb0d6963f7d28e17f72', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'PLMC6AZK', N'Phạm Hoa', CAST(N'1995-02-09' AS Date), N'Nữ', N'Hà Nội', N'hoa@gmail.com', N'0128738    ', N'Hoa', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'RT21UYIV', N'le loi', CAST(N'1995-02-28' AS Date), N'Nam', N'ha noi', N't@gmail.com', N'098        ', N'le', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'SIR8LH7X', N'Vũ Dung', CAST(N'1995-02-09' AS Date), N'Nam', N'hcmc', N'chungkoi113@gmail.com', N'12324232   ', N'chung123', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'UAQ1P4RE', N'Vu Cung', CAST(N'1995-02-09' AS Date), N'Khác', N'HCMC', N'Chungkoi113@gmail.com', N'0988457017 ', N'123abc', N'202cb962ac59075b964b07152d234b70', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'UUA790NV', N'Trần Phạm Tuyết Trinh', CAST(N'0015-07-19' AS Date), N'Khác', N'Bình Dương', N'Chungkoi113@gmail.com', N'023213213  ', N'trinh', N'28415172efb5548286345b74313c260f', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'WCOT7E0Q', N'Nguyễn Đức Nghĩa', CAST(N'1995-02-14' AS Date), N'Nam', N'Hồ Chí Minh', N'nghia@gmail.com', N'0900000532 ', N'nghia', N'9e87373408a6cd425ae9b19bf870d893', N'NotActive')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DoB], [Gender], [Address], [Email], [PhoneNumber], [Username], [Password], [Status]) VALUES (N'WCOT7E7Q', N'Nguyễn Đức Nghĩa', CAST(N'1995-02-14' AS Date), N'Nam', N'Hồ Chí Minh', N'nghia@gmail.com', N'0900000532 ', N'nghia123', N'9e87373408a6cd425ae9b19bf870d893', N'NotActive')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'3T1MUGIX', N'admin', N'202cb962ac59075b964b07152d234b70', N'Admin', N'tuyet', N'đã xóa')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'804M6X38', N'huyen', N'202cb962ac59075b964b07152d234b70', N'sale', N'huyen', N'đã xóa')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'9YNTUND0', N'tram', N'202cb962ac59075b964b07152d234b70', N'sale', N'Trâm', N'đang hoạt động')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'9ZHI008U', N'mặc định', N'202cb962ac59075b964b07152d234b70', N'sale', N'MĐ', N'đang hoạt động')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'AFHUNS9P', N'hoang', N'202cb962ac59075b964b07152d234b70', N'sale', N'hoàng', N'đang hoạt động')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'B76PL10N', N'chung', N'd41d8cd98f00b204e9800998ecf8427e', N'Admin', N'Chung', N'đang hoạt động')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'HCSC2ZTU', N'chung123', N'202cb962ac59075b964b07152d234b70', N'sale', N'Vũ Đình Chung', N'đang hoạt động')
INSERT [dbo].[Employees] ([EmployeeID], [Username], [Password], [Role], [Name], [Note]) VALUES (N'JAM0NZN7', N'Trinh', N'28415172efb5548286345b74313c260f', N'Admin', N'tuyết trinh', N'đang hoạt động')
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'05R142N5', N'003', 1, 4190000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'0YC49CAS', N'002', 10, 47900000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'0YC49CAS', N'004', 1, 13500000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'0YC49CAS', N'M4366M3N', 1, 78999.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'44SU5ZDB', N'003', 1, 4190000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'4V19SZ6I', N'001', 1, 9390000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'51LC3THW', N'002', 10, 47900000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'5EDGBE1L', N'002', 2, 9580000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'5EDGBE1L', N'003', 1, 4190000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'5T3R0IIT', N'004', 1, 13500000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'5T3R0IIT', N'006', 1, 15400000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'61OFDJDD', N'002', 1, 4790000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'61OFDJDD', N'007', 1, 57900000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'EYALSGI5', N'002', 1, 4790000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'HDWI61IR', N'002', 1, 4790000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'HDWI61IR', N'003', 2, 8380000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'HVPDDDTX', N'001', 1, 9390000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'HVPDDDTX', N'003', 1, 4190000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'L4RTW5Y9', N'005', 1, 11900000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'R7NBRITH', N'001', 1, 9390000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'R7NBRITH', N'003', 1, 4190000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'TVKQRLA5', N'003', 2, 8380000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'XKK6QVG1', N'001', 1, 9390000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'YN93MKCA', N'003', 2, 8380000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'YQ8M3YF2', N'002', 1, 4790000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'YQ8M3YF2', N'003', 1, 4190000.0000)
INSERT [dbo].[OderDetails] ([OderID], [ProductID], [Quantity], [Price]) VALUES (N'ZTXXNHPM', N'001', 1, 9390000.0000)
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'05R142N5', N'FZVH0IAB', CAST(N'2017-05-12' AS Date), CAST(N'2017-04-15' AS Date), 4190000.0000, N'delivery', N'Biên Hòa', N'Đang giao hàng', N'JAM0NZN7', N'01248357192')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'0YC49CAS', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 61478999.0000, N'cart', N'Bình Dương', N'Đã hủy', N'9ZHI008U', N'023213213  ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'44SU5ZDB', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 4190000.0000, N'delivery', N'Bình Dương', N'Đã hủy', N'9ZHI008U', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'4V19SZ6I', N'UUA790NV', CAST(N'2017-05-07' AS Date), CAST(N'2017-06-10' AS Date), 9390000.0000, N'cart', N'Man thiện Hiệp PHú, TPHCm', N'Chưa thanh toán', N'9YNTUND0', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'51LC3THW', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 47900000.0000, N'delivery', N'Bình Dương', N'Đã hủy', N'9ZHI008U', N'023213213  ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'5EDGBE1L', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 13770000.0000, N'delivery', N'Bình Dương', N'Đang xác nhận', N'9ZHI008U', N'023213213  ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'5T3R0IIT', N'PLMC6AZK', CAST(N'2017-05-12' AS Date), CAST(N'2017-04-15' AS Date), 28900000.0000, N'delivery', N'Hà Nội', N'Hoàn thành', N'HCSC2ZTU', N'0128738    ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'61OFDJDD', N'FZVH0IAB', CAST(N'2017-05-12' AS Date), CAST(N'2017-04-15' AS Date), 62690000.0000, N'cart', N'Biên Hòa', N'Chưa thanh toán', N'AFHUNS9P', N'01248357192')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'EYALSGI5', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 4790000.0000, N'cart', N'Bình Dương', N'Hoàn thành', N'JAM0NZN7', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'HDWI61IR', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 13170000.0000, N'cart', N'Bình Dương', N'Hoàn thành', N'JAM0NZN7', N'023213213  ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'HVPDDDTX', N'UUA790NV', CAST(N'2017-05-06' AS Date), CAST(N'2017-05-09' AS Date), 13580000.0000, N'cart', N'   đông Nai', N'Hoàn thành', N'JAM0NZN7', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'L4RTW5Y9', N'FZVH0IAB', CAST(N'2017-05-12' AS Date), CAST(N'2017-04-15' AS Date), 11900000.0000, N'cart', N'Biên Hòa', N'Đang giao hàng', N'AFHUNS9P', N'01248357192')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'R7NBRITH', N'UUA790NV', CAST(N'2017-05-06' AS Date), CAST(N'2017-06-09' AS Date), 13580000.0000, N'cart', N'   đông Nai', N'Hoàn thành', N'HCSC2ZTU', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'TVKQRLA5', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 8380000.0000, N'cart', N'Bình Dương', N'Đã hủy', N'9ZHI008U', N'023213213  ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'XKK6QVG1', N'UUA790NV', CAST(N'2017-05-07' AS Date), CAST(N'2017-06-10' AS Date), 9390000.0000, N'cart', N'   đông Nai', N'Đang xác nhận', N'9ZHI008U', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'YN93MKCA', N'UUA790NV', CAST(N'2017-05-13' AS Date), CAST(N'2017-04-16' AS Date), 8380000.0000, N'delivery', N'Bình Dương', N'Đang xác nhận', N'9ZHI008U', N'023213213  ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'YQ8M3YF2', N'UUA790NV', CAST(N'2017-05-11' AS Date), CAST(N'2017-04-14' AS Date), 8980000.0000, N'cart', N'   đông Nai', N'Đã hủy', N'9YNTUND0', N'01249009   ')
INSERT [dbo].[Oders] ([OderID], [CustomerID], [OderDate], [ShipDate], [OderPrice], [PaymentMethod], [DeliveryAddress], [Status], [EmployeeID], [DeliveryPhone]) VALUES (N'ZTXXNHPM', N'UUA790NV', CAST(N'2017-03-07' AS Date), CAST(N'2017-04-10' AS Date), 9390000.0000, N'cart', N'Man thiện Hiệp PHú, TPHCm', N'Đã hủy', N'9YNTUND0', N'01249009   ')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'002', N'Samsung')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'003', N'Panasonic')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'004', N'Sony')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'005', N'Toshiba')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'006', N'TCL')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'007', N'Sharp')
INSERT [dbo].[Produce] ([ProduceID], [ProduceName]) VALUES (N'008', N'LG')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'001', N'Smart Tivi', N'FULL HD', N'CÓ', N'3.0 5.0', N'UA40K5500AKXXV', N'40 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'002', N'LED Tivi', N'HD', N'2 cổng', N'1 cổng', N'49LH605T', N'32 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'003', N'Tivi LED', N'HD ready', N'2 cổng', N'1 cổng', N'LC-58UA330X', N'40 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'004', N'Tivi 4k/UHD', N'4K UHD', N'có', N'có', N'LC-58UE630X', N'43inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'005', N'Tivi 4K/UHD', N'4K UHD', N'3 cổng', N'2 cổng', N'KDL-40W650D', N'40 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'006', N'Tivi 4K/UHD/SUHD', N'4K UHD', N'4 cổng', N'3 cổng', N'UA40J5200AKVXX', N'32 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'007', N'Tivi QLED', N'4K UHD', N'3', N'2 cổng', N'QA55Q7FAMKXXV', N'55 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'008', N'Smart Tivi', N'HD', N'3 ', N'3', N'HDEI', N'43 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'009', N'Tivi Led', N'Full HD', N'có ', N'có', N'40L2550VN', N'40 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'010', N'Tivi Led', N'HD ready', N'1 cổng ', N'1 cổng', N'32L3650VN', N'32 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'3QWIZN4Y', N' Smart Tivi ', N'22', N'2 cổng', N'2 cổng', N'DKIE34', N'32 inch', N'12 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'6K1TQJD8', N'LED', N'FULL HD', N'2 cổng', N'có', N'40lL45', N'40 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'BZHV1NLT', N'smart tivi', N'full hd', N'2', N'3', N'KIDMEIO', N'50 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'D23ZKF4R', N'Smart Tivi', N'FULL HD', N'CÓ', N'3.0 5.0', N'UA40K5500AKXXV', N'40 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'DI5S3HL7', N'LED', N'HD', N'1', N'3', N'HEIKI', N'32 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'M4366M3N', N'gh', N'42', N'4', N'4', N'HCMIE', N'32 inch', N'12 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'N7PI89QX', N'LED', N'HD', N'3', N'2', N'MLDIEUI', N'43 inch', N'24 tháng')
INSERT [dbo].[ProductInfo] ([ProductID], [ProductType], [Resolution], [HDMI], [USB], [Model], [Size], [Warranty]) VALUES (N'VHNQ3SBD', N'LED', N'FULL HD', N'có', N'có', N'32LKD', N'32 inch', N'24 tháng')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'001', N'SMART TIVI', N'002', 9390000.0000, N'haha', 0, N'002/tivi-led-samsung-k5500_wpo5-0u.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'002', N'TIVI LED ', N'003', 4790000.0000, N'32 inch', 7, N'003/tivi-led-panasonic-th-40d400v.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'003', N' LED TIVI', N'003', 4190000.0000, N'<p>32 inch</p>
', 6, N'007/tivi-den-nen-led-sharp-lc-50le570x.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'004', N'TIVI 4K', N'007', 13500000.0000, N'50 inch', 10, N'007/tivi-den-nen-led-sharp-lc-55le570x.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'005', N'TIVI UHD', N'002', 11900000.0000, N'43 inch', 10, N'002/tivi-led-samsung-ua32ku6000kxxv.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'006', N'TIVI 4K', N'004', 15400000.0000, N'43 inch', 10, N'004/tivi-sony-kdl-43w750d-vn3-0.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'007', N'TIVI QLED ', N'007', 57900000.0000, N'<p>nh&oacute;m 5</p>
', 16, N'007/tivi-den-nen-led-sharp-lc-50ue630x.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'008', N'SMART TIVI', N'008', 10990000.0000, N'<p>49 inch</p>
', 15, N'008/tivi-lcd-led-lg-43lh590t.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'009', N'TIVI LED ', N'005', 7490000.0000, N'40 inch', 20, N'005/01_rh8p-j8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'010', N'TIVI LED', N'005', 4890000.0000, N'32 inch', 15, N'005/tivi-led-toshiba-43l3650vn.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'3QWIZN4Y', N'SMART TIVI', N'008', 1211212.0000, N'sqq', 12, N'008/tivi-lcd-led-lg-32lh570d-01.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'6K1TQJD8', N'TIVI LED', N'004', 5900000.0000, N'HIEIK', 20, N'004/32W610E-01.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'BZHV1NLT', N'SMART TIVI', N'006', 12000000.0000, N'', 10, N'006/tivi-tcl-led-l40d2700.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'D23ZKF4R', N'SMART TIVI', N'002', 9390000.0000, N'haha', 30, N'002/tivi-led-samsung-ua48j6200akxxv-01.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'DI5S3HL7', N'tivi', N'008', 12000000.0000, N'', 4, N'008/tivi-lcd-led-lg-43lh605t.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'M4366M3N', N'sonyyy', N'004', 78999.0000, N'ygy', 2, N'004/002.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'N7PI89QX', N'LED TIVI', N'003', 23000000.0000, N'<p>HOL</p>
', 23, N'003/tivi-led-panasonic-th-40d400v.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProduceID], [Price], [Description], [Quantity], [ProductImg]) VALUES (N'VHNQ3SBD', N'TIVI LED', N'008', 100000000.0000, N'tr', 11, N'008/tivi-lcd-led-lg-43lh605t.jpg')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_KhachHang]    Script Date: 5/13/2017 8:00:14 PM ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [IX_KhachHang] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Employees]    Script Date: 5/13/2017 8:00:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees] ON [dbo].[Employees]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
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
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKyThuat_SanPham] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
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
