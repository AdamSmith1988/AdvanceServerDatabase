USE [master]
GO
/****** Object:  Database [Guappo Hair Design]    Script Date: 12/05/2017 21:58:05 ******/
CREATE DATABASE [Guappo Hair Design]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Guappo Hair Design', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NEWSQL\MSSQL\DATA\Guappo Hair Design.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Guappo Hair Design_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NEWSQL\MSSQL\DATA\Guappo Hair Design_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Guappo Hair Design] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Guappo Hair Design].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Guappo Hair Design] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET ARITHABORT OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Guappo Hair Design] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Guappo Hair Design] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Guappo Hair Design] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Guappo Hair Design] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Guappo Hair Design] SET  MULTI_USER 
GO
ALTER DATABASE [Guappo Hair Design] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Guappo Hair Design] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Guappo Hair Design] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Guappo Hair Design] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Guappo Hair Design] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Guappo Hair Design]
GO
/****** Object:  User [AdamOSmith]    Script Date: 12/05/2017 21:58:06 ******/
CREATE USER [AdamOSmith] FOR LOGIN [BUILTIN\Users] WITH DEFAULT_SCHEMA=[Products]
GO
/****** Object:  Schema [Booking]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Booking]
GO
/****** Object:  Schema [Customer]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Customer]
GO
/****** Object:  Schema [Employee]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Employee]
GO
/****** Object:  Schema [Equipment]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Equipment]
GO
/****** Object:  Schema [Forum]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Forum]
GO
/****** Object:  Schema [Maintenance]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Maintenance]
GO
/****** Object:  Schema [Products]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Products]
GO
/****** Object:  Schema [Salon]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Salon]
GO
/****** Object:  Schema [Training]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Training]
GO
/****** Object:  Schema [Treatment]    Script Date: 12/05/2017 21:58:06 ******/
CREATE SCHEMA [Treatment]
GO
/****** Object:  Table [Booking].[Booking]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[Booking](
	[BookingID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TreatmentID] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Confirmed] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Booking].[BookingTime]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[BookingTime](
	[BookingTimeID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TimeStart] [time](7) NOT NULL,
	[TimeFinish] [time](7) NOT NULL,
 CONSTRAINT [PK_BookingTime] PRIMARY KEY CLUSTERED 
(
	[BookingTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Booking].[Invoice]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[Invoice](
	[InvoiceID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[PriceID] [int] NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Paid] [bit] NOT NULL,
	[ThankYouNote] [nvarchar](20) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Booking].[PaymentMethod]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[PaymentMethod](
	[PaymentMethodID] [int] NOT NULL,
	[PaymentMethodName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Booking].[Pricing]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[Pricing](
	[PriceID] [int] NOT NULL,
	[TreatmentID] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pricing] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Customer].[Customer]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Customer](
	[CustomerID] [int] NOT NULL,
	[ForeName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Postcode] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Customer].[Reviews]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Reviews](
	[ReviewsID] [int] NOT NULL,
	[SalonsID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comments] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewTable]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewTable](
	[Title] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewTable2]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewTable2](
	[Title] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalonAssets]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonAssets](
	[SalonAssetID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[AssetID] [int] NOT NULL,
 CONSTRAINT [PK_SalonAssets] PRIMARY KEY CLUSTERED 
(
	[SalonAssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Employee].[Employee]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Employee](
	[EmployeeID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[EmployeeRoleID] [int] NOT NULL,
	[First_Name] [nvarchar](max) NOT NULL,
	[Last_Name] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Employee].[EmployeeAccess]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[EmployeeAccess](
	[EmployeeAccessID] [int] NOT NULL,
	[EmployeeRoleID] [int] NOT NULL,
	[SystemAuthorizationID] [int] NOT NULL,
	[AccessGranted] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeAccess] PRIMARY KEY CLUSTERED 
(
	[EmployeeAccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Employee].[EmployeeRole]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[EmployeeRole](
	[EmployeeRoleID] [int] NOT NULL,
	[RoleName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_EmployeeRole] PRIMARY KEY CLUSTERED 
(
	[EmployeeRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Employee].[SystemAuthorization]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[SystemAuthorization](
	[SystemAuthorizationID] [int] NOT NULL,
	[Add_Edit_Del] [nvarchar](50) NOT NULL,
	[AuthorzationName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SystemAuthorization] PRIMARY KEY CLUSTERED 
(
	[SystemAuthorizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Equipment].[Equiptment]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Equiptment](
	[EquiptmentID] [int] NOT NULL,
	[EquiptmentTypeID] [int] NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[EquiptmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Equiptment] PRIMARY KEY CLUSTERED 
(
	[EquiptmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Equipment].[EquiptmentType]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[EquiptmentType](
	[EquiptmentTypeID] [int] NOT NULL,
	[EquiptmentTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquiptmentType] PRIMARY KEY CLUSTERED 
(
	[EquiptmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Equipment].[Maintenance]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Maintenance](
	[MaintenanceID] [int] NOT NULL,
	[EquiptmentID] [int] NOT NULL,
	[MaintenanceTypeID] [int] NOT NULL,
	[MaintenanceDate] [datetime] NOT NULL,
	[MaintenanceDescription] [nvarchar](max) NOT NULL,
	[MaintenancePerformedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[MaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Equipment].[MaintenanceType]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[MaintenanceType](
	[MaintenanceTypeID] [int] NOT NULL,
	[MaintenanceName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MaintenanceType] PRIMARY KEY CLUSTERED 
(
	[MaintenanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Forum].[CategoryForum]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Forum].[CategoryForum](
	[CategoryTypeID] [int] NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CategoryType] PRIMARY KEY CLUSTERED 
(
	[CategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Forum].[CustomerProfile]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Forum].[CustomerProfile](
	[CustomerProfileID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TopicID] [int] NULL,
	[PostID] [int] NULL,
	[Avatar] [image] NULL,
	[OnlineStatus] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerProfile] PRIMARY KEY CLUSTERED 
(
	[CustomerProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Forum].[ForumTopic]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Forum].[ForumTopic](
	[TopicID] [int] NOT NULL,
	[CategoryForumID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[Createdat] [datetime] NOT NULL,
	[updatedat] [datetime] NULL,
	[PostViews] [int] NULL,
 CONSTRAINT [PK_ForumTopic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Forum].[Topic_Post]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Forum].[Topic_Post](
	[PostID] [int] NOT NULL,
	[TopicID] [int] NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAT] [datetime] NOT NULL,
 CONSTRAINT [PK_Topic_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Products].[ProductImage]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products].[ProductImage](
	[ProductImageID] [int] NOT NULL,
	[ProductImageURL] [nvarchar](max) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Products].[ProductStock]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products].[ProductStock](
	[ProductStockID] [int] NOT NULL,
	[ProductImageID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ProductStockTypeID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[ProductStockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Products].[ProductStockLevel]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products].[ProductStockLevel](
	[ProductStockLevelID] [int] NOT NULL,
	[ProductStockID] [int] NOT NULL,
	[ProductStockLevel] [int] NOT NULL,
 CONSTRAINT [PK_ProductStockLevel] PRIMARY KEY CLUSTERED 
(
	[ProductStockLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Products].[ProductStockType]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products].[ProductStockType](
	[PrductStockTypeID] [int] NOT NULL,
	[ProductStockTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StockType] PRIMARY KEY CLUSTERED 
(
	[PrductStockTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Products].[ProductSuppliers]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products].[ProductSuppliers](
	[SupplierID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostCode] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[CurrentOrder] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductSuppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Salon].[AssetCategories]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Salon].[AssetCategories](
	[AssetCategoryID] [int] NOT NULL,
	[AssetCategory] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AssetCategories] PRIMARY KEY CLUSTERED 
(
	[AssetCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Salon].[Assets]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Salon].[Assets](
	[AssetID] [int] NOT NULL,
	[AssetCategoryID] [int] NOT NULL,
	[ModelNo] [nvarchar](20) NOT NULL,
	[SerialNo] [nvarchar](20) NOT NULL,
	[DateAcquired] [datetime] NOT NULL,
	[PurchasePrice] [nvarchar](50) NOT NULL,
	[Comments] [nvarchar](50) NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Salon].[HairAndBeautySalon]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Salon].[HairAndBeautySalon](
	[SalonID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Postcode] [nvarchar](max) NOT NULL,
	[Telephone Number] [nvarchar](max) NOT NULL,
	[Website] [nvarchar](max) NULL,
	[LogoURL] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Linkedin] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Googleplus] [nvarchar](max) NULL,
	[Location] [geography] NULL,
	[RegistrationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Salon].[SalonAssets]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Salon].[SalonAssets](
	[SalonAssetID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[AssetID] [int] NOT NULL,
 CONSTRAINT [PK_SalonAssets_1] PRIMARY KEY CLUSTERED 
(
	[SalonAssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Salon].[SalonOpeningTime]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Salon].[SalonOpeningTime](
	[OpeningTimeID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[DayOfWeek] [nvarchar](50) NOT NULL,
	[OpeningTime] [time](7) NOT NULL,
	[ClosingTime] [time](7) NOT NULL,
	[NotesIfClosed] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[EmployeeTraining]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[EmployeeTraining](
	[TrainingTrackerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TrainingActivityID] [int] NOT NULL,
	[TrainingActivityName] [nvarchar](max) NOT NULL,
	[DateCoached] [datetime] NOT NULL,
	[DateVerified] [datetime] NULL,
	[EmployeeVerificationName] [nvarchar](50) NOT NULL,
	[TrainingPassed] [bit] NULL,
 CONSTRAINT [PK_TrainingTracker] PRIMARY KEY CLUSTERED 
(
	[TrainingTrackerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Training].[TrainingActivity]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[TrainingActivity](
	[TrainingActivityID] [int] NOT NULL,
	[TrainingCategoryID] [int] NOT NULL,
	[ActivityName] [nvarchar](max) NOT NULL,
	[ActivityDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TrainingActivity] PRIMARY KEY CLUSTERED 
(
	[TrainingActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Training].[TrainingCategory]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[TrainingCategory](
	[TrainingCategoryID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TrainingCategory] PRIMARY KEY CLUSTERED 
(
	[TrainingCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[TrainingVideo]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[TrainingVideo](
	[TrainingVideoID] [int] NOT NULL,
	[TrainingTrackerID] [int] NOT NULL,
	[DateRecorded] [datetime] NOT NULL,
 CONSTRAINT [PK_TrainingRecorded] PRIMARY KEY CLUSTERED 
(
	[TrainingVideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Treatment].[Treatment]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Treatment].[Treatment](
	[TreatmentID] [int] NOT NULL,
	[TreatmentTypeID] [int] NOT NULL,
	[TreamtentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Haircut] PRIMARY KEY CLUSTERED 
(
	[TreatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Treatment].[TreatmentEquiptment]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Treatment].[TreatmentEquiptment](
	[TreatmentEquiptmentID] [int] NOT NULL,
	[TreatmentID] [int] NOT NULL,
	[EquiptmentID] [int] NOT NULL,
	[AmountNeeded] [int] NOT NULL,
 CONSTRAINT [PK_HaircutEquiptment] PRIMARY KEY CLUSTERED 
(
	[TreatmentEquiptmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Treatment].[TreatmentProductStock]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Treatment].[TreatmentProductStock](
	[TreatmentProductStockID] [int] NOT NULL,
	[TreatmentID] [int] NOT NULL,
	[ProductStockID] [int] NOT NULL,
 CONSTRAINT [PK_HaircutProductStock] PRIMARY KEY CLUSTERED 
(
	[TreatmentProductStockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Treatment].[TreatmentType]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Treatment].[TreatmentType](
	[TreatmentTypeID] [int] NOT NULL,
	[TreatmentType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TreatmentType] PRIMARY KEY CLUSTERED 
(
	[TreatmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[All_Bookings]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[All_Bookings]
AS
SELECT        Customer.Customer.ForeName, Treatment.Treatment.TreamtentName, Treatment.TreatmentType.TreatmentType, Booking.BookingTime.Date, Booking.BookingTime.TimeStart
FROM            Treatment.TreatmentType INNER JOIN
                         Treatment.Treatment ON Treatment.TreatmentType.TreatmentTypeID = Treatment.Treatment.TreatmentTypeID AND Treatment.TreatmentType.TreatmentTypeID = Treatment.Treatment.TreatmentTypeID INNER JOIN
                         Booking.Booking ON Treatment.Treatment.TreatmentID = Booking.Booking.TreatmentID AND Treatment.Treatment.TreatmentID = Booking.Booking.TreatmentID INNER JOIN
                         Customer.Customer ON Booking.Booking.CustomerID = Customer.Customer.CustomerID AND Booking.Booking.CustomerID = Customer.Customer.CustomerID INNER JOIN
                         Booking.BookingTime ON Booking.Booking.BookingID = Booking.BookingTime.BookingID



GO
/****** Object:  View [dbo].[All_Future_Bookings]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[All_Future_Bookings]
AS
SELECT        Customer.Customer.ForeName, Treatment.Treatment.TreamtentName, Treatment.TreatmentType.TreatmentType, Booking.BookingTime.Date, Booking.BookingTime.TimeStart
FROM            Treatment.TreatmentType INNER JOIN
                         Treatment.Treatment ON Treatment.TreatmentType.TreatmentTypeID = Treatment.Treatment.TreatmentTypeID AND Treatment.TreatmentType.TreatmentTypeID = Treatment.Treatment.TreatmentTypeID INNER JOIN
                         Booking.Booking ON Treatment.Treatment.TreatmentID = Booking.Booking.TreatmentID AND Treatment.Treatment.TreatmentID = Booking.Booking.TreatmentID INNER JOIN
                         Customer.Customer ON Booking.Booking.CustomerID = Customer.Customer.CustomerID AND Booking.Booking.CustomerID = Customer.Customer.CustomerID INNER JOIN
                         Booking.BookingTime ON Booking.Booking.BookingID = Booking.BookingTime.BookingID
WHERE        (Booking.BookingTime.Date > GETDATE())



GO
/****** Object:  View [dbo].[All_Reviews]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[All_Reviews]
AS
SELECT        Customer.Customer.ForeName, Customer.Customer.Surname, Customer.Reviews.Rating, Salon.HairAndBeautySalon.Name, Customer.Reviews.Comments
FROM            Customer.Customer INNER JOIN
                         Customer.Reviews ON Customer.Customer.CustomerID = Customer.Reviews.CustomerID INNER JOIN
                         Salon.HairAndBeautySalon ON Customer.Reviews.SalonsID = Salon.HairAndBeautySalon.SalonID



GO
/****** Object:  View [dbo].[forum]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[forum]
AS
SELECT        Customer.Customer.ForeName, Forum.Topic_Post.Title, Forum.Topic_Post.Body
FROM            Forum.CustomerProfile INNER JOIN
                         Customer.Customer ON Forum.CustomerProfile.CustomerID = Customer.Customer.CustomerID INNER JOIN
                         Forum.ForumTopic ON Forum.CustomerProfile.TopicID = Forum.ForumTopic.TopicID INNER JOIN
                         Forum.CategoryForum ON Forum.ForumTopic.CategoryForumID = Forum.CategoryForum.CategoryTypeID AND Forum.ForumTopic.CategoryForumID = Forum.CategoryForum.CategoryTypeID INNER JOIN
                         Forum.Topic_Post ON Forum.CustomerProfile.PostID = Forum.Topic_Post.PostID AND Forum.ForumTopic.TopicID = Forum.Topic_Post.TopicID AND Forum.ForumTopic.TopicID = Forum.Topic_Post.TopicID



GO
/****** Object:  View [dbo].[Invoice]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Invoice]
AS
SELECT        Salon.HairAndBeautySalon.SalonID, Salon.HairAndBeautySalon.Name, Employee.Employee.First_Name, Treatment.Treatment.TreamtentName, Booking.Pricing.Price, Customer.Customer.ForeName, 
                         Customer.Customer.Surname
FROM            Booking.Booking INNER JOIN
                         Customer.Customer ON Booking.Booking.CustomerID = Customer.Customer.CustomerID INNER JOIN
                         Salon.HairAndBeautySalon ON Booking.Booking.SalonID = Salon.HairAndBeautySalon.SalonID INNER JOIN
                         Treatment.Treatment ON Booking.Booking.TreatmentID = Treatment.Treatment.TreatmentID INNER JOIN
                         Booking.Pricing ON Booking.Pricing.TreatmentID = Treatment.Treatment.TreatmentID AND Booking.Pricing.TreatmentID = Treatment.Treatment.TreatmentID AND 
                         Booking.Pricing.TreatmentID = Treatment.Treatment.TreatmentID AND Booking.Pricing.TreatmentID = Treatment.Treatment.TreatmentID INNER JOIN
                         Employee.Employee ON Booking.Booking.EmployeeID = Employee.Employee.EmployeeID AND Booking.Booking.EmployeeID = Employee.Employee.EmployeeID AND 
                         Salon.HairAndBeautySalon.SalonID = Employee.Employee.SalonID AND Salon.HairAndBeautySalon.SalonID = Employee.Employee.SalonID AND 
                         Salon.HairAndBeautySalon.SalonID = Employee.Employee.SalonID
WHERE        (Salon.HairAndBeautySalon.SalonID = 1)


GO
/****** Object:  View [dbo].[Maintenance_Date]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Maintenance_Date]
AS
SELECT        Equipment.EquiptmentType.EquiptmentTypeName, Equipment.Equiptment.EquiptmentName, Equipment.Equiptment.Make, Equipment.Maintenance.MaintenanceDate
FROM            Equipment.Equiptment INNER JOIN
                         Equipment.EquiptmentType ON Equipment.Equiptment.EquiptmentTypeID = Equipment.EquiptmentType.EquiptmentTypeID INNER JOIN
                         Equipment.Maintenance ON Equipment.Equiptment.EquiptmentID = Equipment.Maintenance.EquiptmentID



GO
/****** Object:  View [dbo].[Negative_Reviews]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Negative_Reviews]
AS
SELECT        Customer.Customer.ForeName, Customer.Customer.Surname, Customer.Reviews.Rating, Salon.HairAndBeautySalon.Name, Customer.Reviews.Comments
FROM            Customer.Customer INNER JOIN
                         Customer.Reviews ON Customer.Customer.CustomerID = Customer.Reviews.CustomerID INNER JOIN
                         Salon.HairAndBeautySalon ON Customer.Reviews.SalonsID = Salon.HairAndBeautySalon.SalonID
WHERE        (Customer.Reviews.Rating <= 5)



GO
/****** Object:  View [dbo].[Next_Month_Bookings]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Next_Month_Bookings]
AS
SELECT        Customer.Customer.ForeName, Treatment.Treatment.TreamtentName, Treatment.TreatmentType.TreatmentType, Booking.BookingTime.Date, Booking.BookingTime.TimeStart
FROM            Treatment.TreatmentType INNER JOIN
                         Treatment.Treatment ON Treatment.TreatmentType.TreatmentTypeID = Treatment.Treatment.TreatmentTypeID AND Treatment.TreatmentType.TreatmentTypeID = Treatment.Treatment.TreatmentTypeID INNER JOIN
                         Booking.Booking ON Treatment.Treatment.TreatmentID = Booking.Booking.TreatmentID AND Treatment.Treatment.TreatmentID = Booking.Booking.TreatmentID INNER JOIN
                         Customer.Customer ON Booking.Booking.CustomerID = Customer.Customer.CustomerID AND Booking.Booking.CustomerID = Customer.Customer.CustomerID INNER JOIN
                         Booking.BookingTime ON Booking.Booking.BookingID = Booking.BookingTime.BookingID
WHERE        (Booking.BookingTime.Date BETWEEN '2017/03/20' AND '2017/04/20')



GO
/****** Object:  View [dbo].[Positive_Reviews]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Positive_Reviews]
AS
SELECT        Customer.Customer.ForeName, Customer.Customer.Surname, Customer.Reviews.Rating, Salon.HairAndBeautySalon.Name, Customer.Reviews.Comments
FROM            Customer.Customer INNER JOIN
                         Customer.Reviews ON Customer.Customer.CustomerID = Customer.Reviews.CustomerID INNER JOIN
                         Salon.HairAndBeautySalon ON Customer.Reviews.SalonsID = Salon.HairAndBeautySalon.SalonID
WHERE        (Customer.Reviews.Rating > 5)



GO
/****** Object:  View [dbo].[Price_List_View]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Price_List_View]
AS
SELECT        Treatment.TreatmentType.TreatmentType, Treatment.Treatment.TreamtentName, Booking.Pricing.Price
FROM            Booking.Pricing INNER JOIN
                         Treatment.Treatment ON Booking.Pricing.TreatmentID = Treatment.Treatment.TreatmentID INNER JOIN
                         Treatment.TreatmentType ON Treatment.Treatment.TreatmentTypeID = Treatment.TreatmentType.TreatmentTypeID



GO
/****** Object:  View [dbo].[Price_Specific_View]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Price_Specific_View]
AS
SELECT        Treatment.TreatmentType.TreatmentType, Treatment.Treatment.TreamtentName, Booking.Pricing.Price
FROM            Booking.Pricing INNER JOIN
                         Treatment.Treatment ON Booking.Pricing.TreatmentID = Treatment.Treatment.TreatmentID INNER JOIN
                         Treatment.TreatmentType ON Treatment.Treatment.TreatmentTypeID = Treatment.TreatmentType.TreatmentTypeID
WHERE        (Treatment.TreatmentType.TreatmentTypeID = 9)



GO
/****** Object:  View [dbo].[Training_Failed]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Training_Failed]
AS
SELECT        Salon.HairAndBeautySalon.Name, Employee.Employee.First_Name, Training.TrainingActivity.ActivityName, Training.EmployeeTraining.DateCoached, Training.EmployeeTraining.TrainingPassed
FROM            Training.TrainingActivity INNER JOIN
                         Training.EmployeeTraining ON Training.TrainingActivity.TrainingActivityID = Training.EmployeeTraining.TrainingActivityID INNER JOIN
                         Employee.Employee ON Training.EmployeeTraining.EmployeeID = Employee.Employee.EmployeeID INNER JOIN
                         Salon.HairAndBeautySalon ON Employee.Employee.SalonID = Salon.HairAndBeautySalon.SalonID
WHERE        (Training.EmployeeTraining.TrainingPassed = 0)


GO
/****** Object:  View [dbo].[Training_Passed]    Script Date: 12/05/2017 21:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Training_Passed]
AS
SELECT        Salon.HairAndBeautySalon.Name, Employee.Employee.First_Name, Training.TrainingActivity.ActivityName, Training.EmployeeTraining.DateCoached, Training.EmployeeTraining.TrainingPassed
FROM            Training.TrainingActivity INNER JOIN
                         Training.EmployeeTraining ON Training.TrainingActivity.TrainingActivityID = Training.EmployeeTraining.TrainingActivityID INNER JOIN
                         Employee.Employee ON Training.EmployeeTraining.EmployeeID = Employee.Employee.EmployeeID INNER JOIN
                         Salon.HairAndBeautySalon ON Employee.Employee.SalonID = Salon.HairAndBeautySalon.SalonID AND Employee.Employee.SalonID = Salon.HairAndBeautySalon.SalonID
WHERE        (Training.EmployeeTraining.TrainingPassed = 1)


GO
INSERT [Booking].[Booking] ([BookingID], [EmployeeID], [SalonID], [CustomerID], [TreatmentID], [Notes], [Confirmed], [Cancelled]) VALUES (1, 5, 1, 6, 1, N'Fussy Customer, be mindful.', 1, 0)
INSERT [Booking].[Booking] ([BookingID], [EmployeeID], [SalonID], [CustomerID], [TreatmentID], [Notes], [Confirmed], [Cancelled]) VALUES (2, 1, 1, 1, 11, N'Hopefully wont take too long!', 0, 0)
INSERT [Booking].[Booking] ([BookingID], [EmployeeID], [SalonID], [CustomerID], [TreatmentID], [Notes], [Confirmed], [Cancelled]) VALUES (3, 4, 1, 5, 12, NULL, 1, 1)
INSERT [Booking].[Booking] ([BookingID], [EmployeeID], [SalonID], [CustomerID], [TreatmentID], [Notes], [Confirmed], [Cancelled]) VALUES (4, 2, 1, 2, 6, N'First trial of the new nail art', 1, 0)
INSERT [Booking].[Booking] ([BookingID], [EmployeeID], [SalonID], [CustomerID], [TreatmentID], [Notes], [Confirmed], [Cancelled]) VALUES (5, 3, 1, 3, 5, N'Complete re-colour.', 1, 0)
INSERT [Booking].[Booking] ([BookingID], [EmployeeID], [SalonID], [CustomerID], [TreatmentID], [Notes], [Confirmed], [Cancelled]) VALUES (6, 6, 2, 4, 7, NULL, 1, 0)
INSERT [Booking].[BookingTime] ([BookingTimeID], [BookingID], [Date], [TimeStart], [TimeFinish]) VALUES (1, 1, CAST(N'2017-06-12' AS Date), CAST(N'11:15:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [Booking].[BookingTime] ([BookingTimeID], [BookingID], [Date], [TimeStart], [TimeFinish]) VALUES (2, 2, CAST(N'2017-05-12' AS Date), CAST(N'12:15:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [Booking].[BookingTime] ([BookingTimeID], [BookingID], [Date], [TimeStart], [TimeFinish]) VALUES (3, 3, CAST(N'2015-03-12' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [Booking].[BookingTime] ([BookingTimeID], [BookingID], [Date], [TimeStart], [TimeFinish]) VALUES (4, 4, CAST(N'2015-02-27' AS Date), CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [Booking].[BookingTime] ([BookingTimeID], [BookingID], [Date], [TimeStart], [TimeFinish]) VALUES (5, 5, CAST(N'2017-04-17' AS Date), CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [Booking].[BookingTime] ([BookingTimeID], [BookingID], [Date], [TimeStart], [TimeFinish]) VALUES (6, 6, CAST(N'2018-03-18' AS Date), CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [Booking].[Invoice] ([InvoiceID], [BookingID], [PriceID], [PaymentMethodID], [Date], [Paid], [ThankYouNote]) VALUES (1, 1, 1, 5, CAST(N'2017-02-12 00:00:00.000' AS DateTime), 1, N'Paid With Thanks!')
INSERT [Booking].[Invoice] ([InvoiceID], [BookingID], [PriceID], [PaymentMethodID], [Date], [Paid], [ThankYouNote]) VALUES (2, 2, 11, 2, CAST(N'2017-02-12 00:00:00.000' AS DateTime), 1, N'Paid With Thanks!')
INSERT [Booking].[Invoice] ([InvoiceID], [BookingID], [PriceID], [PaymentMethodID], [Date], [Paid], [ThankYouNote]) VALUES (3, 3, 12, 1, CAST(N'2017-03-12 00:00:00.000' AS DateTime), 1, N'Paid With Thanks!')
INSERT [Booking].[Invoice] ([InvoiceID], [BookingID], [PriceID], [PaymentMethodID], [Date], [Paid], [ThankYouNote]) VALUES (4, 4, 6, 5, CAST(N'2017-02-27 00:00:00.000' AS DateTime), 0, NULL)
INSERT [Booking].[Invoice] ([InvoiceID], [BookingID], [PriceID], [PaymentMethodID], [Date], [Paid], [ThankYouNote]) VALUES (5, 5, 5, 4, CAST(N'2017-03-17 00:00:00.000' AS DateTime), 1, N'Paid With Thanks!')
INSERT [Booking].[Invoice] ([InvoiceID], [BookingID], [PriceID], [PaymentMethodID], [Date], [Paid], [ThankYouNote]) VALUES (6, 6, 7, 3, CAST(N'2017-03-18 00:00:00.000' AS DateTime), 1, N'Paid With Thanks!')
INSERT [Booking].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName]) VALUES (1, N'Cash')
INSERT [Booking].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName]) VALUES (2, N'Debit Card')
INSERT [Booking].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName]) VALUES (3, N'Credit Card')
INSERT [Booking].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName]) VALUES (4, N'Gift Card')
INSERT [Booking].[PaymentMethod] ([PaymentMethodID], [PaymentMethodName]) VALUES (5, N'PayPal')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (1, 1, N'10.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (2, 2, N'10.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (3, 3, N'15.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (4, 4, N'9.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (5, 5, N'39.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (6, 6, N'15.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (7, 7, N'9.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (8, 8, N'29.99')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (9, 9, N'75.00')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (10, 10, N'100 p/h')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (11, 11, N'100 p/h')
INSERT [Booking].[Pricing] ([PriceID], [TreatmentID], [Price]) VALUES (12, 12, N'40.00')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (0, N'Mansha', N'Nawaz', N'Prof', CAST(N'1988-07-07 00:00:00.000' AS DateTime), N'26 Laburnum Terrace', N'DH6 2HQ', N'Mansha@testemail.com', N'01915264989', N'MNawaz!!!', N'MNawaz1234!!!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (1, N'Adam', N'Smith', N'Dr', CAST(N'1988-07-07 00:00:00.000' AS DateTime), N'18 Rosebay Close, Shotton', N'DH6 2LH', N'Smith06@hotmail.co.uk', N'07824698886', N'Smith06@hotmail.co.u', N'ApplyMacontosh24!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (2, N'James', N'Coils', NULL, CAST(N'1976-09-30 00:00:00.000' AS DateTime), N'29 Hawthorne rescent, Trimdon', N'SR8 2LA', N'James.Coils@yahoo.com', N'07824978655', N'J.Coils', N'CaseyNeistat!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (3, N'Helen', N'Ferguson', N'Miss', CAST(N'1992-03-16 00:00:00.000' AS DateTime), N'47 Lilac Terrace,Horden', N'E6 4GO', N'FergieFergie@gmail.com', N'0786492349', N'FergieFergie@gmail.c', N'BlackEyedPeas<>')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (4, N'Ruth', N'Flemming', N'Mrs', CAST(N'1964-03-28 00:00:00.000' AS DateTime), N'45 Grey Street, Ingleby Barwick', N'TS1 4PU', N'Fleming_Ruth@Gmail.com', N'01915264009', N'Fleming.Ruth', N'QueenElizabeth1!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (5, N'Latisha', N'Brown', N'Mrs', CAST(N'1973-05-20 00:00:00.000' AS DateTime), N'269 North Hyde La, Hounslow, Southal', N'UB2 5TE', N'Latisha73@hotmail.co.uk', N'07896548955', N'L.Brown73', N'Gretzky99')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (6, N'Elaine', N'Simpson', N'Mrs', CAST(N'1982-06-02 00:00:00.000' AS DateTime), N'48 Dawson Road, Wingate', N'DH5 P89', N'Simpson1982@gmail.com', N'07896547866', N'Simpson_Elaine', N'Arg3nt1Na')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (7, N'Ted', N'Grant', N'Mr', CAST(N'1983-02-02 00:00:00.000' AS DateTime), N'91 Castle View, Sherwood', N'SR4 9PL', N'Granty_1212@hotmail.co.uk', N'07824665565', N'Granty_1212', N'Passw0rd!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (8, N'Steven ', N'Blakey', N'Mr', CAST(N'1985-08-08 00:00:00.000' AS DateTime), N'21 Shotton View, Mount Pleasant', N'M3 8PL', N'Blakey1985@yahoo.co.uk', N'07862486682', N'Blakey_Senior', N'834_242!!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (9, N'Kirsty', N'Fishwick', N'Miss', CAST(N'1992-02-02 00:00:00.000' AS DateTime), N'Wessington Way, Peterlee', N'SR3 9PH', N'Kirsty.Fishwick1992@yahoo.com', N'05267256276', N'Fishers_Kirsty', N'JohnWick!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (10, N'Megan', N'Slater', N'Miss', CAST(N'1992-12-25 00:00:00.000' AS DateTime), N'25 Langley Park, Durham', N'DH1 3NU', N'Megan.Slater@hotmail.com', N'07896242233', N'Megan.Slater', N'Slater_Megan1992')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (11, N'Jacky', N'Stansfield', N'Miss', CAST(N'1964-05-05 00:00:00.000' AS DateTime), N'67 Front Street, Coxhoe, Durham', N'DH2 3PU', N'Jacky.Stansfield@bt.com', N'07899594668', N'Jacky.Stansfield', N'Dominican_Repub99!')
INSERT [Customer].[Customer] ([CustomerID], [ForeName], [Surname], [Title], [DateOfBirth], [Address], [Postcode], [Email], [PhoneNo], [Username], [Password]) VALUES (12, N'Carly', N'Mitchell', N'Mrs', CAST(N'1988-08-06 00:00:00.000' AS DateTime), N'32 Victoria Street, South Hetton', N'DH4 7PH', N'Carly.cm88@hotmail.co.uk', N'07845545872', N'Carly88.Mitchell', N'Dublin_Guiness34!')
INSERT [Customer].[Reviews] ([ReviewsID], [SalonsID], [CustomerID], [Rating], [Comments]) VALUES (1, 6, 1, 9, N'Really good, pleased with my hair and will certaily be booking again!')
INSERT [Customer].[Reviews] ([ReviewsID], [SalonsID], [CustomerID], [Rating], [Comments]) VALUES (2, 4, 2, 5, N'Please with my treatment but the staff were not very friendly. ')
INSERT [Customer].[Reviews] ([ReviewsID], [SalonsID], [CustomerID], [Rating], [Comments]) VALUES (3, 3, 3, 3, N'Certainly will not both with Miss Nails Again that is for certain.')
INSERT [Customer].[Reviews] ([ReviewsID], [SalonsID], [CustomerID], [Rating], [Comments]) VALUES (4, 5, 4, 7, N'Awesome love my new tattoo')
INSERT [Customer].[Reviews] ([ReviewsID], [SalonsID], [CustomerID], [Rating], [Comments]) VALUES (5, 2, 5, 8, N'MAGNIFIQUE!!!')
INSERT [Customer].[Reviews] ([ReviewsID], [SalonsID], [CustomerID], [Rating], [Comments]) VALUES (6, 1, 6, 10, N'Thoroughly enjoyed it, the staff treated me like royalty.  ')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Dr')
INSERT [dbo].[NewTable] ([Title]) VALUES (NULL)
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Mr')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Mr')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Dr')
INSERT [dbo].[NewTable2] ([Title]) VALUES (NULL)
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Mrs')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Mr')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Mr')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Miss')
INSERT [dbo].[NewTable2] ([Title]) VALUES (N'Mrs')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (1, 1, 1, N'Phil', N'Unsworth', N'P.Unsworth', N'Ph1lUnsy1!')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (2, 1, 2, N'Sam ', N'Unsworth', N'S.Unsworth', N'Chicken123!')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (3, 1, 3, N'Helen', N'Wilkinson', N'H.Wilkinson', N'Sm1thy1234!')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (4, 1, 4, N'Brogham', N'Garfield', N'B.Garfield', N'Passw0rd!')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (5, 1, 5, N'Karl', N'Knox', N'K.Knox', N'MaX26LaB')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (6, 2, 1, N'Barry', N'Smith', N'B.Smith', N'Casp2906189')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (7, 3, 2, N'Kayleigh', N'Tiplady', N'K.Tiplady', N'SamiPod')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (8, 4, 3, N'Ian', N'Wilkinson', N'I.Wilkinson', N'ShadFortH783')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (9, 5, 4, N'Elaine', N'Pairs', N'E.Pears', N'Amaz0n!')
INSERT [Employee].[Employee] ([EmployeeID], [SalonID], [EmployeeRoleID], [First_Name], [Last_Name], [Username], [Password]) VALUES (10, 6, 5, N'Sophie ', N'Griffiths', N'S.Giffiths', N'P0L0MP56')
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (1, 1, 1, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (2, 2, 1, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (3, 3, 1, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (4, 4, 1, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (5, 5, 1, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (6, 1, 2, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (7, 2, 2, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (8, 3, 2, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (9, 4, 2, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (10, 5, 2, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (11, 1, 3, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (12, 2, 3, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (13, 3, 3, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (14, 4, 3, 0)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (15, 5, 3, 0)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (16, 1, 4, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (17, 2, 4, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (18, 3, 4, 1)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (19, 4, 4, 0)
INSERT [Employee].[EmployeeAccess] ([EmployeeAccessID], [EmployeeRoleID], [SystemAuthorizationID], [AccessGranted]) VALUES (20, 5, 4, 0)
INSERT [Employee].[EmployeeRole] ([EmployeeRoleID], [RoleName]) VALUES (1, N'Owner')
INSERT [Employee].[EmployeeRole] ([EmployeeRoleID], [RoleName]) VALUES (2, N'Manager')
INSERT [Employee].[EmployeeRole] ([EmployeeRoleID], [RoleName]) VALUES (3, N'Senior')
INSERT [Employee].[EmployeeRole] ([EmployeeRoleID], [RoleName]) VALUES (4, N'Mid Level')
INSERT [Employee].[EmployeeRole] ([EmployeeRoleID], [RoleName]) VALUES (5, N'Junior')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (1, N'CreateCustomer', N'Customer')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (2, N'UpdateCustomer', N'Customer')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (3, N'DeleteCustomer', N'Customer')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (4, N'CreateSupplier', N'Supplier')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (5, N'UpdateSupplier', N'Supplier')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (6, N'DeleteSupplier', N'Supplier')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (7, N'CreateSalon', N'Salon')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (8, N'UpdateSalon', N'Salon')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (9, N'DeleteSalon', N'Salon')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (10, N'CreateEmployee', N'Employee')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (11, N'UpdateEmployee', N'Employee')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (12, N'DeleteEmployee', N'Employee')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (13, N'CreateStock', N'Stock')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (14, N'UpdateStock', N'Stock')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (15, N'DeleteStock', N'Stock')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (16, N'CreateTreatments', N'Treatments')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (17, N'UpdateTreatments', N'Treatments')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (18, N'DeteleTreatments', N'Treatments')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (19, N'CreateInvoice', N'Invoice')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (20, N'UpdateInvoice', N'Invoice')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (21, N'DeleteInvoice', N'Invoice')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (22, N'CreatePrice', N'Price')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (23, N'UpdatePrice', N'Price')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (24, N'DeletePrice', N'Price')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (25, N'CreateReviews', N'Reviews')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (26, N'CreateEquipment', N'Equipment')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (27, N'UpdateEquipment', N'Equipment')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (28, N'DeleteEquipent', N'Equipment')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (29, N'CreateMaintenance', N'Maintenance')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (30, N'UpdateMeaintenance', N'Maintenance')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (31, N'DeleteMaintenance', N'Maintenance')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (32, N'CreateAssets', N'Assets')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (33, N'UpdateAssets', N'Assets')
INSERT [Employee].[SystemAuthorization] ([SystemAuthorizationID], [Add_Edit_Del], [AuthorzationName]) VALUES (34, N'DeleteAssets', N'Assets')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (1, 1, N'Wahl', N'Clippers')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (2, 1, N'Diva', N'Hairdryers')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (3, 1, N'Cloud9', N'Tongs')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (4, 1, N'Cloud9', N'Straightners')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (5, 1, N'Jaguar', N'Scissors')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (6, 2, N'Rio', N'UV Polish Lamp')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (7, 2, N'CND', N'Nail File')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (8, 2, N'CND', N'Nail Brush')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (9, 3, N'Hive', N'Wax Pot')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (10, 3, N'Option', N'Wax Stips')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (11, 4, N'St. Tropez', N'Spray Gun')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (12, 4, N'St. Tropez', N'Tanning Tent')
INSERT [Equipment].[Equiptment] ([EquiptmentID], [EquiptmentTypeID], [Make], [EquiptmentName]) VALUES (13, 5, N'Erikson', N'Tattoo Pen')
INSERT [Equipment].[EquiptmentType] ([EquiptmentTypeID], [EquiptmentTypeName]) VALUES (1, N'HairEquiptment')
INSERT [Equipment].[EquiptmentType] ([EquiptmentTypeID], [EquiptmentTypeName]) VALUES (2, N'NailEquiptment')
INSERT [Equipment].[EquiptmentType] ([EquiptmentTypeID], [EquiptmentTypeName]) VALUES (3, N'EyebrowEquiptment')
INSERT [Equipment].[EquiptmentType] ([EquiptmentTypeID], [EquiptmentTypeName]) VALUES (4, N'TanningEquiptment')
INSERT [Equipment].[EquiptmentType] ([EquiptmentTypeID], [EquiptmentTypeName]) VALUES (5, N'Tattoo')
INSERT [Equipment].[Maintenance] ([MaintenanceID], [EquiptmentID], [MaintenanceTypeID], [MaintenanceDate], [MaintenanceDescription], [MaintenancePerformedBy]) VALUES (1, 1, 3, CAST(N'2017-12-14 00:00:00.000' AS DateTime), N'Faulty, new equiptment needed', N'Ken Chegworth')
INSERT [Equipment].[Maintenance] ([MaintenanceID], [EquiptmentID], [MaintenanceTypeID], [MaintenanceDate], [MaintenanceDescription], [MaintenancePerformedBy]) VALUES (2, 2, 1, CAST(N'2016-12-14 00:00:00.000' AS DateTime), N'No problems.', N'Ken Chegworth')
INSERT [Equipment].[Maintenance] ([MaintenanceID], [EquiptmentID], [MaintenanceTypeID], [MaintenanceDate], [MaintenanceDescription], [MaintenancePerformedBy]) VALUES (3, 3, 2, CAST(N'2016-12-14 00:00:00.000' AS DateTime), N'Power shortage, fuse repaired.', N'Ken Chegworth')
INSERT [Equipment].[Maintenance] ([MaintenanceID], [EquiptmentID], [MaintenanceTypeID], [MaintenanceDate], [MaintenanceDescription], [MaintenancePerformedBy]) VALUES (4, 4, 1, CAST(N'2017-12-14 00:00:00.000' AS DateTime), N'No problems at all.', N'Ken Chegworth')
INSERT [Equipment].[Maintenance] ([MaintenanceID], [EquiptmentID], [MaintenanceTypeID], [MaintenanceDate], [MaintenanceDescription], [MaintenancePerformedBy]) VALUES (5, 5, 2, CAST(N'2017-12-14 00:00:00.000' AS DateTime), N'Sharpened and returned. ', N'Ken Chegworth')
INSERT [Equipment].[Maintenance] ([MaintenanceID], [EquiptmentID], [MaintenanceTypeID], [MaintenanceDate], [MaintenanceDescription], [MaintenancePerformedBy]) VALUES (6, 6, 3, CAST(N'2017-12-14 00:00:00.000' AS DateTime), N'Faulty, new Polish Lamp Needed', N'Ken Chegworth')
INSERT [Equipment].[MaintenanceType] ([MaintenanceTypeID], [MaintenanceName]) VALUES (1, N'Full Maintenance')
INSERT [Equipment].[MaintenanceType] ([MaintenanceTypeID], [MaintenanceName]) VALUES (2, N'Repair')
INSERT [Equipment].[MaintenanceType] ([MaintenanceTypeID], [MaintenanceName]) VALUES (3, N'Faulty')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (1, N'Mens Hair')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (2, N'Ladies Hair')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (3, N'General Styling')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (4, N'Nail Polish')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (5, N'Nail Art')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (6, N'Tanning Products')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (7, N'Tanning Enquiries')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (8, N'Tattoo Healing')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (9, N'General Beauty')
INSERT [Forum].[CategoryForum] ([CategoryTypeID], [CategoryName]) VALUES (10, N'General')
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (1, 1, 1, NULL, NULL, 1)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (2, 2, 3, NULL, NULL, 0)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (3, 3, 3, NULL, NULL, 1)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (4, 4, 4, NULL, NULL, 1)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (5, 5, 5, NULL, NULL, 0)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (6, 6, 6, NULL, NULL, 0)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (7, 7, NULL, 2, NULL, 0)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (8, 8, NULL, 4, NULL, 1)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (9, 9, NULL, 1, NULL, 1)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (10, 10, NULL, 3, NULL, 1)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (11, 11, NULL, 5, NULL, 0)
INSERT [Forum].[CustomerProfile] ([CustomerProfileID], [CustomerID], [TopicID], [PostID], [Avatar], [OnlineStatus]) VALUES (12, 12, NULL, 3, NULL, 1)
INSERT [Forum].[ForumTopic] ([TopicID], [CategoryForumID], [Title], [Body], [Createdat], [updatedat], [PostViews]) VALUES (1, 10, N'Guappo Hair Design...', N'Can anyone tell me if guappo are good? ', CAST(N'2016-07-29 00:00:00.000' AS DateTime), NULL, 3)
INSERT [Forum].[ForumTopic] ([TopicID], [CategoryForumID], [Title], [Body], [Createdat], [updatedat], [PostViews]) VALUES (2, 3, N'New Hair Cut NEEDED', N'Whats fashionable for us gents these days?', CAST(N'2016-12-25 00:00:00.000' AS DateTime), CAST(N'2016-12-26 00:00:00.000' AS DateTime), 5)
INSERT [Forum].[ForumTopic] ([TopicID], [CategoryForumID], [Title], [Body], [Createdat], [updatedat], [PostViews]) VALUES (3, 5, N'Nail Art (Miss Nails)', N'Love my new nails will certainly be going back!!!!!', CAST(N'2017-03-02 11:00:00.000' AS DateTime), NULL, 4)
INSERT [Forum].[ForumTopic] ([TopicID], [CategoryForumID], [Title], [Body], [Createdat], [updatedat], [PostViews]) VALUES (4, 10, N'Tattoo Cover-up', N'Looking for a tattoo idea to cover a very poor tattoo I have', CAST(N'2017-03-02 11:00:00.000' AS DateTime), CAST(N'2017-03-03 00:00:00.000' AS DateTime), 5)
INSERT [Forum].[ForumTopic] ([TopicID], [CategoryForumID], [Title], [Body], [Createdat], [updatedat], [PostViews]) VALUES (5, 9, N'Jesmond Beauty Clinic', N'how can I create a good smokey eye?', CAST(N'2017-01-11 00:00:00.000' AS DateTime), NULL, 4)
INSERT [Forum].[ForumTopic] ([TopicID], [CategoryForumID], [Title], [Body], [Createdat], [updatedat], [PostViews]) VALUES (6, 2, N'Beach Wave', N'How do I create a beach wave using straightners', CAST(N'2017-01-15 00:00:00.000' AS DateTime), NULL, 11)
INSERT [Forum].[Topic_Post] ([PostID], [TopicID], [Title], [Body], [CreatedAt], [UpdatedAT]) VALUES (1, 6, N'Beach Wave', N'Wrap the hair around the straightners, turn the straighters once and pull through the ends.', CAST(N'1900-01-01 11:00:00.000' AS DateTime), CAST(N'1900-01-01 11:00:00.000' AS DateTime))
INSERT [Forum].[Topic_Post] ([PostID], [TopicID], [Title], [Body], [CreatedAt], [UpdatedAT]) VALUES (2, 1, N'GUAPPO', N'I think that Guappo''s Hair Design, is excellent. The staff are also so friendly and love catching up with their customers.', CAST(N'1900-01-01 11:00:00.000' AS DateTime), CAST(N'1900-01-01 11:00:00.000' AS DateTime))
INSERT [Forum].[Topic_Post] ([PostID], [TopicID], [Title], [Body], [CreatedAt], [UpdatedAT]) VALUES (3, 5, N'Smokey Eye', N'Sweep Dark eyeshadow to a point at end of eyebrow, then sweep a little onto your lower lid.', CAST(N'1900-01-01 11:00:00.000' AS DateTime), CAST(N'1900-01-01 11:00:00.000' AS DateTime))
INSERT [Forum].[Topic_Post] ([PostID], [TopicID], [Title], [Body], [CreatedAt], [UpdatedAT]) VALUES (4, 4, N'Tattoo cover-up', N'Hi, it depents on the size of your current tattoo, please elaborate. ', CAST(N'1900-01-01 11:00:00.000' AS DateTime), CAST(N'1900-01-01 11:00:00.000' AS DateTime))
INSERT [Forum].[Topic_Post] ([PostID], [TopicID], [Title], [Body], [CreatedAt], [UpdatedAT]) VALUES (5, 2, N'Fashionable Hair', N'skin fades are in at the moment.', CAST(N'1900-01-01 11:00:00.000' AS DateTime), CAST(N'1900-01-01 11:00:00.000' AS DateTime))
INSERT [Forum].[Topic_Post] ([PostID], [TopicID], [Title], [Body], [CreatedAt], [UpdatedAT]) VALUES (6, 3, N'Nail Art', N'Hi, Ive been looking to change for a while now, what art would you recommend?', CAST(N'1900-01-01 11:00:00.000' AS DateTime), CAST(N'1900-01-01 11:00:00.000' AS DateTime))
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (1, N'http://3.bp.blogspot.com/_O4YbuUH2Kms/TJWbd0D0SoI/AAAAAAAAA-s/e3VgaXhYbDY/s1600/Tigi+Bed+Head+Urban+Anti-dotes.jpg', N'Bead Head Gel and Wax')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (2, N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRiIkhItrNW410hXCA0cm4Ro7qXeAHSGy4Mt100jw-25L3fEj7c', N'got2B Hair gel')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (3, N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTI61QOlGgdSV7SyLZLjVWINEntBFhVux1WB7NeQUTSHdakS5FziQ', N'Garnier Hair Wax')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (4, N'data:image/jpeg;base64,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', N'Beard Comb [Gentleman]')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (5, N'http://images.askmen.com/grooming/appearance/best-beard-oils-reviewed_1431113145.jpg', N'BeardZilla Oils')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (6, N'data:image/jpeg;base64,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', N'Loreal Hair colour Blond')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (7, N'data:image/jpeg;base64,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', N'Tattoo Bandage')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (8, N'http://thumbs1.ebaystatic.com/d/l225/m/m0Wli09MYW0WUbyaq63HApQ.jpg', N'Antiseptic Tattoo wipes')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (9, N'http://www.famousdave.co.uk/files/6113/4019/2359/colourchart.jpg', N'Tanning Oils')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (10, N'http://www.imagehere.com', N'Tanning Mit')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (11, N'http://www.imagehere.com', N'Beard oils')
INSERT [Products].[ProductImage] ([ProductImageID], [ProductImageURL], [Notes]) VALUES (12, N'http://www.imagehere.com', N'Beard Comb')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (1, 4, 1, 6, N'Unigloves Alcohol Wipes')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (2, 8, 1, 6, N'Braun Tattoo bandages')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (3, 1, 2, 1, N'Bed Head Gel and Wax')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (4, 3, 2, 1, N'Garnier Hair Wax')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (5, 9, 4, 4, N'Tanning Oils')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (6, 10, 4, 4, N'Tanning Mit')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (7, 11, 3, 7, N'Beard oils')
INSERT [Products].[ProductStock] ([ProductStockID], [ProductImageID], [SupplierID], [ProductStockTypeID], [ProductName]) VALUES (8, 12, 3, 7, N'Beard Comb')
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (1, 1, 20)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (2, 2, 150)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (3, 3, 100)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (4, 4, 100)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (5, 5, 50)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (6, 6, 30)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (7, 7, 10)
INSERT [Products].[ProductStockLevel] ([ProductStockLevelID], [ProductStockID], [ProductStockLevel]) VALUES (8, 8, 150)
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (1, N'HairProduct')
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (2, N'NailProduct')
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (3, N'EyebrowProduct')
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (4, N'TanningProduct')
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (5, N'BeautyProduct')
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (6, N'Tattoo')
INSERT [Products].[ProductStockType] ([PrductStockTypeID], [ProductStockTypeName]) VALUES (7, N'Beard Products')
INSERT [Products].[ProductSuppliers] ([SupplierID], [Name], [ContactName], [Address], [PostCode], [Country], [PhoneNo], [Email], [URL], [Logo], [Notes], [CurrentOrder]) VALUES (1, N'Sallys', N'Gill Burgess', N'33 Shadforth Close', N'SR8 2LA', N'England', N'0800 980 9961', N'G.Burgess@sallys.com', N'http://www.sallyexpress.com', N'http://www.sallyexpress.com/images/core/logo.gif', N'---', N'15 Hair Products')
INSERT [Products].[ProductSuppliers] ([SupplierID], [Name], [ContactName], [Address], [PostCode], [Country], [PhoneNo], [Email], [URL], [Logo], [Notes], [CurrentOrder]) VALUES (2, N'Salon Services', N'Barbara Yews', N'Bothar Na Mine, Ballybane', N'H91 RFC1', N'Ireland', N'00353 917 51377', N'B.Yews@SalServ.co.uk', N'http://www.salon-services.com', N'http://www.salon-services.com/images/core/ss_logo.gif', N'Every 2 Month', N'15 Hair Products')
INSERT [Products].[ProductSuppliers] ([SupplierID], [Name], [ContactName], [Address], [PostCode], [Country], [PhoneNo], [Email], [URL], [Logo], [Notes], [CurrentOrder]) VALUES (3, N'Beauty Express', N'Bill Myers', N'Unit 3 The Arc,
25 Colquhoun Ave,', N'G52 4BN ', N'Scotland', N'0330 123 1908', N'B.Myers@BExpress.co.uk', N'http://www.beautyexpress.co.uk/nails/', N'http://www.beautyexpress.co.uk/images/core/belogo.gif', N'Every Quarter', N'35 Nail Products')
INSERT [Products].[ProductSuppliers] ([SupplierID], [Name], [ContactName], [Address], [PostCode], [Country], [PhoneNo], [Email], [URL], [Logo], [Notes], [CurrentOrder]) VALUES (4, N'LA Tanning', N'Kimberley Jayne', N'62 Buxton Rd, Stockport,', N'SK2 6NB', N'England', N'0161 483 7156', N'K.Jayne@latenning.com', N'http://www.latanning.co.uk', N'http://www.latanning.co.uk/media/images/default/la_tan_new_logo_2-min.jpg', N'Monthly', N'5 Tanning Products')
INSERT [Products].[ProductSuppliers] ([SupplierID], [Name], [ContactName], [Address], [PostCode], [Country], [PhoneNo], [Email], [URL], [Logo], [Notes], [CurrentOrder]) VALUES (5, N'Feel Unique', N'Marg Kay', N'4th floor, Berkshire House, ', N'WC1V 7AA', N'England', N' +447937 946929', N'M.K@Feelunique.com', N'http://www.feelunique.com/', N'http://cdn1.feelunique.com/assets/img/feelunique-logo.png?Lo0P=890a39ddec5f939885dafc6d03eaae57Dc', N'Monthly', N'Beauty and Eyebrow producs x25')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (1, N'Monitors')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (2, N'Keyboards')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (3, N'Laptops')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (4, N'Safe')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (5, N'CashRegister')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (6, N'Server')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (7, N'MobilePhones')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (8, N'Scissors')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (9, N'product')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (10, N'Combs')
INSERT [Salon].[AssetCategories] ([AssetCategoryID], [AssetCategory]) VALUES (11, N'Nail Equipment')
INSERT [Salon].[Assets] ([AssetID], [AssetCategoryID], [ModelNo], [SerialNo], [DateAcquired], [PurchasePrice], [Comments]) VALUES (1, 6, N'Dell', N'8345pX4i', CAST(N'2017-02-02 00:00:00.000' AS DateTime), N'400.00', N'Server, great condition')
INSERT [Salon].[Assets] ([AssetID], [AssetCategoryID], [ModelNo], [SerialNo], [DateAcquired], [PurchasePrice], [Comments]) VALUES (2, 8, N'Wella', N'823454LL', CAST(N'2016-12-12 00:00:00.000' AS DateTime), N'12.65', N'Scissors, still sharp.')
INSERT [Salon].[Assets] ([AssetID], [AssetCategoryID], [ModelNo], [SerialNo], [DateAcquired], [PurchasePrice], [Comments]) VALUES (3, 3, N'Apple Macbook Pro', N'i349345BG', CAST(N'2015-07-08 00:00:00.000' AS DateTime), N'1250.00', N'Macbook, getting slower')
INSERT [Salon].[Assets] ([AssetID], [AssetCategoryID], [ModelNo], [SerialNo], [DateAcquired], [PurchasePrice], [Comments]) VALUES (4, 10, N'---', N'197GTY', CAST(N'2017-01-28 00:00:00.000' AS DateTime), N'20.00', N'Comb has teeth missing')
INSERT [Salon].[Assets] ([AssetID], [AssetCategoryID], [ModelNo], [SerialNo], [DateAcquired], [PurchasePrice], [Comments]) VALUES (5, 11, N'NSI', N'NSI012547BG', CAST(N'2016-12-25 00:00:00.000' AS DateTime), N'500.00', N' Twin Fan Nail Dryer, possible repair needed')
INSERT [Salon].[Assets] ([AssetID], [AssetCategoryID], [ModelNo], [SerialNo], [DateAcquired], [PurchasePrice], [Comments]) VALUES (6, 1, N'Dell', N'896GB', CAST(N'2016-12-25 00:00:00.000' AS DateTime), N'125.00', N'Dell Monitor')
INSERT [Salon].[HairAndBeautySalon] ([SalonID], [Name], [Address], [Postcode], [Telephone Number], [Website], [LogoURL], [Facebook], [Linkedin], [Twitter], [Googleplus], [Location], [RegistrationDate]) VALUES (1, N'Guappo Hair Design', N'20 Front Street,
Shotton, 
County Durham', N'DH6 2LT', N'0191 520 8244', N'http://www.guappo.co.uk', N'https://static.wixstatic.com/media/f84d5c_43d927d4a56f45218a720196ed58d601~mv2.jpeg/v1/fill/w_867,h_155,al_c,q_80,usm_0.66_1.00_0.01/f84d5c_43d927d4a56f45218a720196ed58d601~mv2.webp', N'https://www.facebook.com/guappohd//', NULL, NULL, NULL, 0xE6100000010C17D9CEF753D347407593180456965EC0, CAST(N'2016-05-20 00:00:00.000' AS DateTime))
INSERT [Salon].[HairAndBeautySalon] ([SalonID], [Name], [Address], [Postcode], [Telephone Number], [Website], [LogoURL], [Facebook], [Linkedin], [Twitter], [Googleplus], [Location], [RegistrationDate]) VALUES (2, N'The Hair Studio', N'9 Upper Yoden Way, 
Castle Dene Shopping Centre, 
Peterlee', N'SR8 1AX', N'0191 518 1515', N'http://castledeneshoppingcentre.co.uk/shops/the-hair-studio/', N'http://castledeneshoppingcentre.co.uk/wp-content/themes/centretheme/images/siteimages/logo.png', N'https://www.facebook.com/pages/The-Hair-Studio-peterlee/189083514459730', NULL, NULL, NULL, 0xE6100000010C17D9CEF753D347407593180456965EC0, CAST(N'2015-06-21 00:00:00.000' AS DateTime))
INSERT [Salon].[HairAndBeautySalon] ([SalonID], [Name], [Address], [Postcode], [Telephone Number], [Website], [LogoURL], [Facebook], [Linkedin], [Twitter], [Googleplus], [Location], [RegistrationDate]) VALUES (3, N'Miss Nails', N'75 North Road, Durham', N'DH14SQ', N'01274309114', N'http://www.miss-nails.co.uk/miss%20nails-price%20list.htm', N'http://www.miss-nails.co.uk/index_htm_files/0.png', N'https://www.facebook.com/missnailsforyou/', NULL, NULL, NULL, 0xE6100000010C17D9CEF753D347407593180456965EC0, CAST(N'2014-04-29 00:00:00.000' AS DateTime))
INSERT [Salon].[HairAndBeautySalon] ([SalonID], [Name], [Address], [Postcode], [Telephone Number], [Website], [LogoURL], [Facebook], [Linkedin], [Twitter], [Googleplus], [Location], [RegistrationDate]) VALUES (4, N'BONAPPEFEET ', N'34b river walk, Durham', N'DH1 4SJ', N'07903564310', N'http://www.bonappefeet.co.uk/', N'http://www.bonappefeet.co.uk/includes/templates/trai_uk/images/logo-bona.png', N'https://www.facebook.com/Bonappefeet-129508600461267/', NULL, NULL, NULL, 0xE6100000010C17D9CEF753D347407593180456965EC0, CAST(N'2017-01-01 00:00:00.000' AS DateTime))
INSERT [Salon].[HairAndBeautySalon] ([SalonID], [Name], [Address], [Postcode], [Telephone Number], [Website], [LogoURL], [Facebook], [Linkedin], [Twitter], [Googleplus], [Location], [RegistrationDate]) VALUES (5, N'Angels Tattoo''s And Piercing', N'11 Newport Cres, Middlesbrough', N'TS1 5EP', N'01642 228749', N'http://www.angeltattooandpiercing.com/', N'http://www.angeltattooandpiercing.com/logo.php/1', NULL, NULL, NULL, NULL, 0xE6100000010C17D9CEF753D347407593180456965EC0, CAST(N'2016-07-29 00:00:00.000' AS DateTime))
INSERT [Salon].[HairAndBeautySalon] ([SalonID], [Name], [Address], [Postcode], [Telephone Number], [Website], [LogoURL], [Facebook], [Linkedin], [Twitter], [Googleplus], [Location], [RegistrationDate]) VALUES (6, N'Jesmond Beauty Clinic', N'11-12 Clayton Road, Jesmond, Newcastle upon Tyne', N'NE2 4RP', N'0191 2818775', N'http://www.jesmondbeauty.co.uk', N'http://www.jesmondbeauty.co.uk/images/jesmond-beauty-logo.png', N'https://www.facebook.com/jesmondbeautyclinic/', NULL, N'https://twitter.com/beautyjesmond', NULL, 0xE6100000010C17D9CEF753D347407593180456965EC0, CAST(N'2014-04-30 00:00:00.000' AS DateTime))
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (1, 1, 1)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (2, 2, 1)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (3, 3, 1)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (4, 5, 1)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (5, 6, 1)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (7, 1, 2)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (8, 2, 2)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (9, 3, 2)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (10, 4, 2)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (11, 5, 2)
INSERT [Salon].[SalonAssets] ([SalonAssetID], [SalonID], [AssetID]) VALUES (12, 6, 2)
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (1, 1, N'Monday', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL)
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (2, 1, N'Tuesday', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL)
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (3, 1, N'Wednesday', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), N'CLOSED')
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (4, 1, N'Thursday', CAST(N'10:30:00' AS Time), CAST(N'19:30:00' AS Time), NULL)
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (5, 1, N'Friday', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), NULL)
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (6, 1, N'Saturday', CAST(N'07:00:00' AS Time), CAST(N'14:00:00' AS Time), NULL)
INSERT [Salon].[SalonOpeningTime] ([OpeningTimeID], [SalonID], [DayOfWeek], [OpeningTime], [ClosingTime], [NotesIfClosed]) VALUES (7, 1, N'Sunday', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), N'CLOSED')
INSERT [Training].[EmployeeTraining] ([TrainingTrackerID], [EmployeeID], [TrainingActivityID], [TrainingActivityName], [DateCoached], [DateVerified], [EmployeeVerificationName], [TrainingPassed]) VALUES (1, 5, 2, N'MensColour', CAST(N'2017-03-05 00:00:00.000' AS DateTime), CAST(N'2017-03-05 00:00:00.000' AS DateTime), N'Phil Unsworth', 1)
INSERT [Training].[EmployeeTraining] ([TrainingTrackerID], [EmployeeID], [TrainingActivityID], [TrainingActivityName], [DateCoached], [DateVerified], [EmployeeVerificationName], [TrainingPassed]) VALUES (2, 4, 4, N'WomansColour', CAST(N'2016-12-12 00:00:00.000' AS DateTime), CAST(N'2016-12-12 00:00:00.000' AS DateTime), N'Phil Unsworth', 1)
INSERT [Training].[EmployeeTraining] ([TrainingTrackerID], [EmployeeID], [TrainingActivityID], [TrainingActivityName], [DateCoached], [DateVerified], [EmployeeVerificationName], [TrainingPassed]) VALUES (3, 3, 5, N'CutThroatShave', CAST(N'2017-11-12 00:00:00.000' AS DateTime), CAST(N'2017-11-12 00:00:00.000' AS DateTime), N'Phil Unsworth', 1)
INSERT [Training].[EmployeeTraining] ([TrainingTrackerID], [EmployeeID], [TrainingActivityID], [TrainingActivityName], [DateCoached], [DateVerified], [EmployeeVerificationName], [TrainingPassed]) VALUES (4, 10, 1, N'MensCut', CAST(N'2017-03-05 00:00:00.000' AS DateTime), CAST(N'2017-03-05 00:00:00.000' AS DateTime), N'Jeffrey Turner', 0)
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (1, 8, N'Waxing', N'Ful Eyebrow Wax')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (2, 1, N'MensCut', N'Heavy Blend')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (3, 2, N'MensColour', N'Mens Full Colour Change')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (4, 7, N'BeardPrecision', N'Trimming and neatening of the beard')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (5, 6, N'Tanning', N'Full body fake tan application')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (6, 5, N'CutThroadShave', N'Wet towell followed by cut throad shave')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (7, 3, N'WomansCut', N'Cut in a full fringe')
INSERT [Training].[TrainingActivity] ([TrainingActivityID], [TrainingCategoryID], [ActivityName], [ActivityDescription]) VALUES (8, 4, N'WomansColour', N'Extreme Colour change')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (1, 1, N'MensCut')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (2, 1, N'MensColour')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (3, 1, N'WomansCut')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (4, 1, N'WomansColour')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (5, 1, N'CutThroatShave')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (6, 1, N'Tanning')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (7, 1, N'BeardPrecision')
INSERT [Training].[TrainingCategory] ([TrainingCategoryID], [SalonID], [CategoryName]) VALUES (8, 1, N'Waxing')
INSERT [Training].[TrainingVideo] ([TrainingVideoID], [TrainingTrackerID], [DateRecorded]) VALUES (1, 4, CAST(N'2017-03-05 00:00:00.000' AS DateTime))
INSERT [Training].[TrainingVideo] ([TrainingVideoID], [TrainingTrackerID], [DateRecorded]) VALUES (2, 3, CAST(N'2017-11-12 00:00:00.000' AS DateTime))
INSERT [Training].[TrainingVideo] ([TrainingVideoID], [TrainingTrackerID], [DateRecorded]) VALUES (3, 2, CAST(N'2016-12-12 00:00:00.000' AS DateTime))
INSERT [Training].[TrainingVideo] ([TrainingVideoID], [TrainingTrackerID], [DateRecorded]) VALUES (4, 1, CAST(N'2017-03-05 00:00:00.000' AS DateTime))
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (1, 4, N'Eyebrow Re-shape')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (2, 1, N'Short back and sides')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (3, 2, N'Top Knot')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (4, 5, N'Beard Trim')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (5, 3, N'Re-colour')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (6, 13, N'Custom Nail Art')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (7, 8, N'Fringe trim')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (8, 9, N'Slight Colour change')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (9, 9, N'Complete Colour change')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (10, 14, N'New Tattoo')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (11, 14, N'Tattoo Cover-up')
INSERT [Treatment].[Treatment] ([TreatmentID], [TreatmentTypeID], [TreamtentName]) VALUES (12, 7, N'Full Body Tan')
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (1, 2, 1, 1)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (2, 2, 1, 2)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (3, 1, 9, 1)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (4, 1, 9, 25)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (5, 12, 12, 1)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (6, 12, 11, 1)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (7, 4, 1, 1)
INSERT [Treatment].[TreatmentEquiptment] ([TreatmentEquiptmentID], [TreatmentID], [EquiptmentID], [AmountNeeded]) VALUES (8, 10, 13, 1)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (1, 2, 3)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (2, 2, 4)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (3, 4, 7)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (4, 4, 8)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (5, 10, 1)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (6, 10, 2)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (7, 12, 5)
INSERT [Treatment].[TreatmentProductStock] ([TreatmentProductStockID], [TreatmentID], [ProductStockID]) VALUES (8, 12, 6)
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (1, N'Mens Traditional cut')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (2, N'Mens Trend Cut')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (3, N'Mens Colouring')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (4, N'Eyebrows')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (5, N'Beard work')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (6, N'Shaving')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (7, N'Tanning')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (8, N'Womans trim')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (9, N'Womans full head colour')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (10, N'Womans re-style')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (11, N'Gel Nails')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (12, N'Acrylic Nails')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (13, N'Nail Art')
INSERT [Treatment].[TreatmentType] ([TreatmentTypeID], [TreatmentType]) VALUES (14, N'Tattoo')
ALTER TABLE [Booking].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerID])
GO
ALTER TABLE [Booking].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [Booking].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [Employee].[Employee] ([EmployeeID])
GO
ALTER TABLE [Booking].[Booking] CHECK CONSTRAINT [FK_Booking_Employee]
GO
ALTER TABLE [Booking].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Salon] FOREIGN KEY([SalonID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [Booking].[Booking] CHECK CONSTRAINT [FK_Booking_Salon]
GO
ALTER TABLE [Booking].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Treatment] FOREIGN KEY([TreatmentID])
REFERENCES [Treatment].[Treatment] ([TreatmentID])
GO
ALTER TABLE [Booking].[Booking] CHECK CONSTRAINT [FK_Booking_Treatment]
GO
ALTER TABLE [Booking].[BookingTime]  WITH CHECK ADD  CONSTRAINT [FK_BookingTime_Booking] FOREIGN KEY([BookingID])
REFERENCES [Booking].[Booking] ([BookingID])
GO
ALTER TABLE [Booking].[BookingTime] CHECK CONSTRAINT [FK_BookingTime_Booking]
GO
ALTER TABLE [Booking].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Booking] FOREIGN KEY([BookingID])
REFERENCES [Booking].[Booking] ([BookingID])
GO
ALTER TABLE [Booking].[Invoice] CHECK CONSTRAINT [FK_Invoice_Booking]
GO
ALTER TABLE [Booking].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_PaymentMethod] FOREIGN KEY([PaymentMethodID])
REFERENCES [Booking].[PaymentMethod] ([PaymentMethodID])
GO
ALTER TABLE [Booking].[Invoice] CHECK CONSTRAINT [FK_Invoice_PaymentMethod]
GO
ALTER TABLE [Booking].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Pricing1] FOREIGN KEY([PriceID])
REFERENCES [Booking].[Pricing] ([PriceID])
GO
ALTER TABLE [Booking].[Invoice] CHECK CONSTRAINT [FK_Invoice_Pricing1]
GO
ALTER TABLE [Booking].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Haircut] FOREIGN KEY([TreatmentID])
REFERENCES [Treatment].[Treatment] ([TreatmentID])
GO
ALTER TABLE [Booking].[Pricing] CHECK CONSTRAINT [FK_Pricing_Haircut]
GO
ALTER TABLE [Customer].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Customer] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerID])
GO
ALTER TABLE [Customer].[Reviews] CHECK CONSTRAINT [FK_Reviews_Customer]
GO
ALTER TABLE [Customer].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Salon] FOREIGN KEY([SalonsID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [Customer].[Reviews] CHECK CONSTRAINT [FK_Reviews_Salon]
GO
ALTER TABLE [dbo].[SalonAssets]  WITH CHECK ADD  CONSTRAINT [FK_SalonAssets_Assets] FOREIGN KEY([AssetID])
REFERENCES [Salon].[Assets] ([AssetID])
GO
ALTER TABLE [dbo].[SalonAssets] CHECK CONSTRAINT [FK_SalonAssets_Assets]
GO
ALTER TABLE [dbo].[SalonAssets]  WITH CHECK ADD  CONSTRAINT [FK_SalonAssets_HairAndBeautySalon] FOREIGN KEY([SalonID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [dbo].[SalonAssets] CHECK CONSTRAINT [FK_SalonAssets_HairAndBeautySalon]
GO
ALTER TABLE [Employee].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeRole] FOREIGN KEY([EmployeeRoleID])
REFERENCES [Employee].[EmployeeRole] ([EmployeeRoleID])
GO
ALTER TABLE [Employee].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeRole]
GO
ALTER TABLE [Employee].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_HairAndBeautySalon] FOREIGN KEY([SalonID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [Employee].[Employee] CHECK CONSTRAINT [FK_Employee_HairAndBeautySalon]
GO
ALTER TABLE [Employee].[EmployeeAccess]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAccess_EmployeeRole] FOREIGN KEY([EmployeeRoleID])
REFERENCES [Employee].[EmployeeRole] ([EmployeeRoleID])
GO
ALTER TABLE [Employee].[EmployeeAccess] CHECK CONSTRAINT [FK_EmployeeAccess_EmployeeRole]
GO
ALTER TABLE [Employee].[EmployeeAccess]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAccess_SystemAuthorization] FOREIGN KEY([SystemAuthorizationID])
REFERENCES [Employee].[SystemAuthorization] ([SystemAuthorizationID])
GO
ALTER TABLE [Employee].[EmployeeAccess] CHECK CONSTRAINT [FK_EmployeeAccess_SystemAuthorization]
GO
ALTER TABLE [Equipment].[Equiptment]  WITH CHECK ADD  CONSTRAINT [FK_Equiptment_EquiptmentType] FOREIGN KEY([EquiptmentTypeID])
REFERENCES [Equipment].[EquiptmentType] ([EquiptmentTypeID])
GO
ALTER TABLE [Equipment].[Equiptment] CHECK CONSTRAINT [FK_Equiptment_EquiptmentType]
GO
ALTER TABLE [Equipment].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Equiptment] FOREIGN KEY([EquiptmentID])
REFERENCES [Equipment].[Equiptment] ([EquiptmentID])
GO
ALTER TABLE [Equipment].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Equiptment]
GO
ALTER TABLE [Equipment].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_MaintenanceType] FOREIGN KEY([MaintenanceTypeID])
REFERENCES [Equipment].[MaintenanceType] ([MaintenanceTypeID])
GO
ALTER TABLE [Equipment].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_MaintenanceType]
GO
ALTER TABLE [Forum].[CustomerProfile]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProfile_Customer] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerID])
GO
ALTER TABLE [Forum].[CustomerProfile] CHECK CONSTRAINT [FK_CustomerProfile_Customer]
GO
ALTER TABLE [Forum].[CustomerProfile]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProfile_ForumTopic] FOREIGN KEY([TopicID])
REFERENCES [Forum].[ForumTopic] ([TopicID])
GO
ALTER TABLE [Forum].[CustomerProfile] CHECK CONSTRAINT [FK_CustomerProfile_ForumTopic]
GO
ALTER TABLE [Forum].[CustomerProfile]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProfile_Topic_Post] FOREIGN KEY([PostID])
REFERENCES [Forum].[Topic_Post] ([PostID])
GO
ALTER TABLE [Forum].[CustomerProfile] CHECK CONSTRAINT [FK_CustomerProfile_Topic_Post]
GO
ALTER TABLE [Forum].[ForumTopic]  WITH CHECK ADD  CONSTRAINT [FK_ForumTopic_CategoryForum] FOREIGN KEY([CategoryForumID])
REFERENCES [Forum].[CategoryForum] ([CategoryTypeID])
GO
ALTER TABLE [Forum].[ForumTopic] CHECK CONSTRAINT [FK_ForumTopic_CategoryForum]
GO
ALTER TABLE [Forum].[Topic_Post]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Post_ForumTopic] FOREIGN KEY([TopicID])
REFERENCES [Forum].[ForumTopic] ([TopicID])
GO
ALTER TABLE [Forum].[Topic_Post] CHECK CONSTRAINT [FK_Topic_Post_ForumTopic]
GO
ALTER TABLE [Products].[ProductStock]  WITH CHECK ADD  CONSTRAINT [FK_ProductStock_ProductImage] FOREIGN KEY([ProductImageID])
REFERENCES [Products].[ProductImage] ([ProductImageID])
GO
ALTER TABLE [Products].[ProductStock] CHECK CONSTRAINT [FK_ProductStock_ProductImage]
GO
ALTER TABLE [Products].[ProductStock]  WITH CHECK ADD  CONSTRAINT [FK_ProductStock_ProductStockType] FOREIGN KEY([ProductStockTypeID])
REFERENCES [Products].[ProductStockType] ([PrductStockTypeID])
GO
ALTER TABLE [Products].[ProductStock] CHECK CONSTRAINT [FK_ProductStock_ProductStockType]
GO
ALTER TABLE [Products].[ProductStock]  WITH CHECK ADD  CONSTRAINT [FK_ProductStock_ProductSuppliers] FOREIGN KEY([SupplierID])
REFERENCES [Products].[ProductSuppliers] ([SupplierID])
GO
ALTER TABLE [Products].[ProductStock] CHECK CONSTRAINT [FK_ProductStock_ProductSuppliers]
GO
ALTER TABLE [Products].[ProductStockLevel]  WITH CHECK ADD  CONSTRAINT [FK_ProductStockLevel_ProductStock] FOREIGN KEY([ProductStockID])
REFERENCES [Products].[ProductStock] ([ProductStockID])
GO
ALTER TABLE [Products].[ProductStockLevel] CHECK CONSTRAINT [FK_ProductStockLevel_ProductStock]
GO
ALTER TABLE [Salon].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_AssetCategories] FOREIGN KEY([AssetCategoryID])
REFERENCES [Salon].[AssetCategories] ([AssetCategoryID])
GO
ALTER TABLE [Salon].[Assets] CHECK CONSTRAINT [FK_Assets_AssetCategories]
GO
ALTER TABLE [Salon].[SalonAssets]  WITH CHECK ADD  CONSTRAINT [FK_SalonAssets_Assets] FOREIGN KEY([AssetID])
REFERENCES [Salon].[Assets] ([AssetID])
GO
ALTER TABLE [Salon].[SalonAssets] CHECK CONSTRAINT [FK_SalonAssets_Assets]
GO
ALTER TABLE [Salon].[SalonAssets]  WITH CHECK ADD  CONSTRAINT [FK_SalonAssets_HairAndBeautySalon] FOREIGN KEY([SalonID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [Salon].[SalonAssets] CHECK CONSTRAINT [FK_SalonAssets_HairAndBeautySalon]
GO
ALTER TABLE [Salon].[SalonOpeningTime]  WITH CHECK ADD  CONSTRAINT [FK_SalonOpeningTime_HairAndBeautySalon] FOREIGN KEY([SalonID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [Salon].[SalonOpeningTime] CHECK CONSTRAINT [FK_SalonOpeningTime_HairAndBeautySalon]
GO
ALTER TABLE [Training].[EmployeeTraining]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTraining_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [Employee].[Employee] ([EmployeeID])
GO
ALTER TABLE [Training].[EmployeeTraining] CHECK CONSTRAINT [FK_EmployeeTraining_Employee]
GO
ALTER TABLE [Training].[EmployeeTraining]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTraining_TrainingActivity] FOREIGN KEY([TrainingActivityID])
REFERENCES [Training].[TrainingActivity] ([TrainingActivityID])
GO
ALTER TABLE [Training].[EmployeeTraining] CHECK CONSTRAINT [FK_EmployeeTraining_TrainingActivity]
GO
ALTER TABLE [Training].[TrainingActivity]  WITH CHECK ADD  CONSTRAINT [FK_TrainingActivity_TrainingCategory] FOREIGN KEY([TrainingCategoryID])
REFERENCES [Training].[TrainingCategory] ([TrainingCategoryID])
GO
ALTER TABLE [Training].[TrainingActivity] CHECK CONSTRAINT [FK_TrainingActivity_TrainingCategory]
GO
ALTER TABLE [Training].[TrainingCategory]  WITH CHECK ADD  CONSTRAINT [FK_TrainingCategory_Salon] FOREIGN KEY([SalonID])
REFERENCES [Salon].[HairAndBeautySalon] ([SalonID])
GO
ALTER TABLE [Training].[TrainingCategory] CHECK CONSTRAINT [FK_TrainingCategory_Salon]
GO
ALTER TABLE [Training].[TrainingVideo]  WITH CHECK ADD  CONSTRAINT [FK_TrainingRecorded_EmployeeTraining] FOREIGN KEY([TrainingTrackerID])
REFERENCES [Training].[EmployeeTraining] ([TrainingTrackerID])
GO
ALTER TABLE [Training].[TrainingVideo] CHECK CONSTRAINT [FK_TrainingRecorded_EmployeeTraining]
GO
ALTER TABLE [Treatment].[Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_TreatmentType] FOREIGN KEY([TreatmentTypeID])
REFERENCES [Treatment].[TreatmentType] ([TreatmentTypeID])
GO
ALTER TABLE [Treatment].[Treatment] CHECK CONSTRAINT [FK_Treatment_TreatmentType]
GO
ALTER TABLE [Treatment].[TreatmentEquiptment]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentEquiptment_Equiptment1] FOREIGN KEY([EquiptmentID])
REFERENCES [Equipment].[Equiptment] ([EquiptmentID])
GO
ALTER TABLE [Treatment].[TreatmentEquiptment] CHECK CONSTRAINT [FK_TreatmentEquiptment_Equiptment1]
GO
ALTER TABLE [Treatment].[TreatmentEquiptment]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentEquiptment_Treatment] FOREIGN KEY([TreatmentID])
REFERENCES [Treatment].[Treatment] ([TreatmentID])
GO
ALTER TABLE [Treatment].[TreatmentEquiptment] CHECK CONSTRAINT [FK_TreatmentEquiptment_Treatment]
GO
ALTER TABLE [Treatment].[TreatmentProductStock]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentProductStock_ProductStock] FOREIGN KEY([ProductStockID])
REFERENCES [Products].[ProductStock] ([ProductStockID])
GO
ALTER TABLE [Treatment].[TreatmentProductStock] CHECK CONSTRAINT [FK_TreatmentProductStock_ProductStock]
GO
ALTER TABLE [Treatment].[TreatmentProductStock]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentProductStock_Treatment] FOREIGN KEY([TreatmentID])
REFERENCES [Treatment].[Treatment] ([TreatmentID])
GO
ALTER TABLE [Treatment].[TreatmentProductStock] CHECK CONSTRAINT [FK_TreatmentProductStock_Treatment]
GO
/****** Object:  StoredProcedure [dbo].[GetGuappoBookings]    Script Date: 12/05/2017 21:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGuappoBookings]
AS
	SELECT S.Name, S.Address, B.Confirmed, B.[Notes]
	FROM Booking.Booking AS B
	INNER JOIN Salon.HairAndBeautySalon AS S
	ON B.SalonID = S.SalonID
	Where S.[Name] = 'Guappo Hair Design'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[33] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TreatmentType (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 673
               Bottom = 102
               Right = 854
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Treatment (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 11
               Left = 193
               Bottom = 196
               Right = 363
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BookingTime (Booking)"
            Begin Extent = 
               Top = 105
               Left = 463
               Bottom = 272
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking (Booking)"
            Begin Extent = 
               Top = 19
               Left = 1
               Bottom = 149
               Right = 171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TreatmentType (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Treatment (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 119
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking (Booking)"
            Begin Extent = 
               Top = 6
               Left = 476
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 6
               Left = 684
               Bottom = 136
               Right = 854
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BookingTime (Booking)"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Future_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Future_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Future_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[7] 2[33] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HairAndBeautySalon (Salon)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Reviews (Customer)"
            Begin Extent = 
               Top = 6
               Left = 476
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'All_Reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[60] 4[3] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -32
      End
      Begin Tables = 
         Begin Table = "CategoryForum (Forum)"
            Begin Extent = 
               Top = 6
               Left = 70
               Bottom = 102
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 6
               Left = 282
               Bottom = 136
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerProfile (Forum)"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 136
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ForumTopic (Forum)"
            Begin Extent = 
               Top = 102
               Left = 70
               Bottom = 232
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Topic_Post (Forum)"
            Begin Extent = 
               Top = 138
               Left = 291
               Bottom = 268
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'forum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'forum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'forum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[5] 2[37] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 172
               Left = 20
               Bottom = 428
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HairAndBeautySalon (Salon)"
            Begin Extent = 
               Top = 61
               Left = 934
               Bottom = 347
               Right = 1126
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pricing (Booking)"
            Begin Extent = 
               Top = 303
               Left = 713
               Bottom = 416
               Right = 883
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Treatment (Treatment)"
            Begin Extent = 
               Top = 305
               Left = 484
               Bottom = 425
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking (Booking)"
            Begin Extent = 
               Top = 205
               Left = 228
               Bottom = 404
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee (Employee)"
            Begin Extent = 
               Top = 9
               Left = 484
               Bottom = 192
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin Criteri' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'aPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Equiptment (Equipment)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 149
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EquiptmentType (Equipment)"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 127
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maintenance (Equipment)"
            Begin Extent = 
               Top = 6
               Left = 511
               Bottom = 176
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Maintenance_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Maintenance_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Reviews (Customer)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HairAndBeautySalon (Salon)"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Negative_Reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Negative_Reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TreatmentType (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Treatment (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 119
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking (Booking)"
            Begin Extent = 
               Top = 6
               Left = 476
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 6
               Left = 684
               Bottom = 136
               Right = 854
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BookingTime (Booking)"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Next_Month_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Next_Month_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Next_Month_Bookings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer (Customer)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Reviews (Customer)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HairAndBeautySalon (Salon)"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Positive_Reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Positive_Reviews'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pricing (Booking)"
            Begin Extent = 
               Top = 16
               Left = 38
               Bottom = 129
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Treatment (Treatment)"
            Begin Extent = 
               Top = 15
               Left = 294
               Bottom = 128
               Right = 475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TreatmentType (Treatment)"
            Begin Extent = 
               Top = 7
               Left = 547
               Bottom = 103
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Price_List_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Price_List_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pricing (Booking)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Treatment (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TreatmentType (Treatment)"
            Begin Extent = 
               Top = 6
               Left = 465
               Bottom = 102
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Price_Specific_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Price_Specific_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TrainingActivity (Training)"
            Begin Extent = 
               Top = 100
               Left = 836
               Bottom = 232
               Right = 1028
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmployeeTraining (Training)"
            Begin Extent = 
               Top = 59
               Left = 568
               Bottom = 259
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee (Employee)"
            Begin Extent = 
               Top = 94
               Left = 352
               Bottom = 275
               Right = 527
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HairAndBeautySalon (Salon)"
            Begin Extent = 
               Top = 10
               Left = 114
               Bottom = 297
               Right = 306
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Training_Failed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Training_Failed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[3] 2[33] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TrainingActivity (Training)"
            Begin Extent = 
               Top = 126
               Left = 23
               Bottom = 258
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmployeeTraining (Training)"
            Begin Extent = 
               Top = 74
               Left = 302
               Bottom = 271
               Right = 535
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Employee (Employee)"
            Begin Extent = 
               Top = 63
               Left = 632
               Bottom = 244
               Right = 807
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HairAndBeautySalon (Salon)"
            Begin Extent = 
               Top = 52
               Left = 940
               Bottom = 333
               Right = 1132
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Training_Passed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Training_Passed'
GO
USE [master]
GO
ALTER DATABASE [Guappo Hair Design] SET  READ_WRITE 
GO
