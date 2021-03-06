USE [master]
GO
/****** Object:  Database [Invoice]    Script Date: 9/8/2018 7:38:00 PM ******/
CREATE DATABASE [Invoice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Invoice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Invoice.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Invoice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Invoice_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Invoice] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Invoice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Invoice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Invoice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Invoice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Invoice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Invoice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Invoice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Invoice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Invoice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Invoice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Invoice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Invoice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Invoice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Invoice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Invoice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Invoice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Invoice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Invoice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Invoice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Invoice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Invoice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Invoice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Invoice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Invoice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Invoice] SET  MULTI_USER 
GO
ALTER DATABASE [Invoice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Invoice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Invoice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Invoice] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Invoice] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Invoice]
GO
/****** Object:  Table [dbo].[customerproduct]    Script Date: 9/8/2018 7:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerproduct](
	[idcustomerproduct] [int] NOT NULL,
	[customer] [int] NOT NULL,
	[product] [int] NOT NULL,
	[quantity] [int] NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_customerproduct] PRIMARY KEY CLUSTERED 
(
	[idcustomerproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[customerproduct] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[tblcustomer]    Script Date: 9/8/2018 7:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcustomer](
	[idcustomer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[mobileno] [nchar](15) NULL,
	[emailid] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[billno] [int] NULL CONSTRAINT [DF_tblcustomer_billno]  DEFAULT ((0)),
 CONSTRAINT [PK_tblcustomer] PRIMARY KEY CLUSTERED 
(
	[idcustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblproduct]    Script Date: 9/8/2018 7:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblproduct](
	[idproduct] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](20) NULL,
	[price] [numeric](18, 0) NULL,
	[srno] [nchar](10) NULL,
 CONSTRAINT [PK_tblproduct] PRIMARY KEY CLUSTERED 
(
	[idproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (1, 1, 1, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (2, 1, 2, 1, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (3, 1, 3, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (4, 2, 2, 1, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (5, 3, 1, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (6, 4, 4, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (7, 2006, 1005, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (8, 2007, 1006, 1, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (9, 2008, 1007, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (10, 2009, 1008, 3, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (11, 2010, 1009, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (1003, 4, 4, 5, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (2005, 5, 6, 2, CAST(N'2017-11-11' AS Date))
INSERT [dbo].[customerproduct] ([idcustomerproduct], [customer], [product], [quantity], [date]) VALUES (2006, 6, 5, 1, CAST(N'2017-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[tblcustomer] ON 

INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (3, N'Mahesh Sangle', N'9648231478     ', N'mahesh9648', N'Gaonbhag Sangli', 1)
INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (4, N'KrishnRaj Kulkarni', N'8745691258     ', N'kkrishna123@gmail.com', N'vasagade,Kohapur', 2)
INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (5, N'Sooraj ', N'999956555      ', N'abcd@gmail.com', N'Jaysingpur', 3)
INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (2006, N'Abc', N'9658746548     ', N'abcxyz@gmail.com', N'Sangli', 4)
INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (2007, N'Archana J Patil', N'8569478565     ', N'archanapatil@gmail.com', N'Miraj', 5)
INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (2008, N'Mnp ', N'8654789645     ', N'mnp@gmail.com', N'Miraj', 6)
INSERT [dbo].[tblcustomer] ([idcustomer], [name], [mobileno], [emailid], [address], [billno]) VALUES (2009, N'Mnp ', N'8654789645     ', N'mnp@gmail.com', N'Miraj', 7)
SET IDENTITY_INSERT [dbo].[tblcustomer] OFF
SET IDENTITY_INSERT [dbo].[tblproduct] ON 

INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (1, N'Laptop hp           ', CAST(25000 AS Numeric(18, 0)), N'125431    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (2, N'Telivision          ', CAST(15000 AS Numeric(18, 0)), N'142536    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (3, N'Refrigerator        ', CAST(35000 AS Numeric(18, 0)), N'124578    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (4, N'Mobile Phone        ', CAST(12000 AS Numeric(18, 0)), N'456987    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (5, N'Washing Machine     ', CAST(45000 AS Numeric(18, 0)), N'126598    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (1005, N'Sony Camera         ', CAST(25000 AS Numeric(18, 0)), N'457896    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (1006, N'Sony Camera         ', CAST(25000 AS Numeric(18, 0)), N'457896    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (1007, N'Sony Camera         ', CAST(25000 AS Numeric(18, 0)), N'457896    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (1008, N'Speakers            ', CAST(2000 AS Numeric(18, 0)), N'695835    ')
INSERT [dbo].[tblproduct] ([idproduct], [name], [price], [srno]) VALUES (1009, N'Vaccum Cleaner      ', CAST(15500 AS Numeric(18, 0)), N'896523    ')
SET IDENTITY_INSERT [dbo].[tblproduct] OFF
ALTER TABLE [dbo].[customerproduct]  WITH CHECK ADD  CONSTRAINT [FK_customerproduct_customerproduct1] FOREIGN KEY([idcustomerproduct])
REFERENCES [dbo].[customerproduct] ([idcustomerproduct])
GO
ALTER TABLE [dbo].[customerproduct] CHECK CONSTRAINT [FK_customerproduct_customerproduct1]
GO
USE [master]
GO
ALTER DATABASE [Invoice] SET  READ_WRITE 
GO
