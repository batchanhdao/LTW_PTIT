USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 12/7/2019 4:48:56 PM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookStore.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](128) NULL,
 CONSTRAINT [PK__Author__70DAFC34104848A9] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[MemberId] [bigint] NULL,
	[AddedDate] [datetime] NOT NULL CONSTRAINT [DF_Cart_AddedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](128) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK__Category__19093A0BF5A845F4] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[Email] [nvarchar](128) NULL,
	[Tel] [nvarchar](16) NULL,
	[Address] [nvarchar](128) NULL,
	[StatusId] [tinyint] NULL,
	[AddedDate] [datetime] NULL CONSTRAINT [DF_Invoice_AddedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK__Invoice__D796AAB5EB40885A] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](128) NULL,
	[Password] [nvarchar](128) NULL,
	[Email] [nvarchar](128) NOT NULL,
	[Gender] [tinyint] NULL,
	[AddedDate] [datetime] NULL CONSTRAINT [DF_Member_AddedDate]  DEFAULT (getdate()),
	[Tel] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK__Member__0CF04B18306433B5] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemberInRole]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInRole](
	[RoleId] [int] NOT NULL,
	[MemberId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[PublisherId] [int] NULL,
	[AuthorId] [int] NULL,
	[Title] [nvarchar](128) NULL,
	[Pages] [smallint] NULL,
	[Weight] [nvarchar](16) NULL,
	[Size] [nvarchar](16) NULL,
	[Descreption] [nvarchar](1024) NULL,
	[Content] [nvarchar](2048) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[ISBN] [nvarchar](16) NULL,
 CONSTRAINT [PK__Product__B40CC6CD9BBAECC0] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherId] [int] NOT NULL,
	[PublisherName] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [tinyint] NOT NULL,
	[StatusName] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (1, N'1,Vaskaran Sarcar')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (2, N'Andrew Troelsen')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (3, N'Rogers Cadenhead')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (4, N'Johan Vos')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (5, N'Michael R. Brzustowicz PhD')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (6, N'Sayan Mukhopadhyay')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (7, N'Barry A. Burd')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (8, N'Clare Churcher')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (9, N'Michael Coles, Rodney Landrum')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (10, N'Adam Jorgensen, Brian Knight, Ross LoForte, Steven Wort')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (11, N'Jay Natarajan, Michael Coles, Rudi Bruchez, Scott Shaw')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (12, N'Aahz Maruch, Stef Maruch')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (13, N'Thiên Long')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (14, N'Phạm Văn Tài')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (15, N'Pham Van Hung')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (16, N'Grokking')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (17, N'7 Up')
INSERT [dbo].[Author] ([AuthorId], [AuthorName]) VALUES (18, N'Bill gate')
SET IDENTITY_INSERT [dbo].[Author] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [ProductId], [Quantity], [MemberId], [AddedDate]) VALUES (11, 1, 1, 1, CAST(N'2019-10-15 15:36:40.643' AS DateTime))
INSERT [dbo].[Cart] ([CartId], [ProductId], [Quantity], [MemberId], [AddedDate]) VALUES (12, 1, 3, 37, CAST(N'2019-10-18 16:49:13.090' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (1, N'Web Development', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (2, N'Programming', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (3, N'Databases', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (4, N'ASP.NET2', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (5, N'PHP', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (6, N'HTML, CSS', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (7, N'Javascript', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (8, N'C#', 2)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (9, N'Java', 2)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (10, N'C & C++', 2)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (11, N'Python', 2)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (12, N'Mysql', 3)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (13, N'SQL Server', 3)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (14, N'MongoDB', 3)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (15, N'Oracle', 3)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (16, N'Postgree SQL', 3)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (17, N'Stationery', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentId]) VALUES (18, N'Student tools', 17)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (7, 1, N'phamthithuyptithcm@gmail.com', N'0123', N'0123', NULL, CAST(N'2019-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (8, 1, N'1111111', N'1111111', N'111111', 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (9, 39, N'phamthithuy4444@gmail.com', N'035467286', N'97, Man Thiện, Hiệp Phú,, quận 9, thành phố Hồ Chí Minh', 4, CAST(N'2019-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (11, 39, N'phamthithuy4444@gmail.com', N'0373865750', N'97, Man Thiện, Hiệp Phú,, quận 9, thành phố Hồ Chí Minh', 4, CAST(N'2019-10-22 23:53:31.920' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (12, 39, N'phamthithuy4444@gmail.com', N'0373865750', N'97, Man Thi?n, Hi?p Phú, qu?n 9, thành ph? H? Chí Minh', 1, CAST(N'2019-10-27 02:33:17.163' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [MemberId], [Email], [Tel], [Address], [StatusId], [AddedDate]) VALUES (13, 39, N'phamthithuy4444@gmail.com', N'0373865750', N'97 Man Thien', 1, CAST(N'2019-11-05 13:06:09.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (7, 1, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (8, 2, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (8, 5, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (9, 1, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (9, 3, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (11, 1, 2, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (11, 6, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (12, 1, 1, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (13, 2, 3, 100000)
INSERT [dbo].[InvoiceDetail] ([InvoiceId], [ProductId], [Quantity], [Price]) VALUES (13, 5, 2, 100000)
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (1, N'Phạm Thị Thủy', N'$2a$12$G0ZZflKozkxkqzxJFUkwIuqfKm47p5Ji2a1h2HF/y.uqD69EhdKW6', N'phamthithuyptithcm@gmail.com', 1, CAST(N'2018-10-19 11:00:41.000' AS DateTime), N'0123456789')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (37, N'Thanh Tuyền', N'$2a$12$noyHv5rjxCJYYcSpdIQa.uPAwRIa8MsCJPnRhJO8Cx7p3F5JUtO8u', N'thanhtuyen@bookstore.com', 1, CAST(N'2019-10-17 22:08:05.033' AS DateTime), N'035647856')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (38, N'Thu Trang', N'$2a$12$CEvapbQTf5ghQ7GPQjAKHeLHw1RV4SA2g0Yov/o3BrG3uqPvirftm', N'thutrang@bookstore.com', 1, CAST(N'2019-10-20 10:04:26.720' AS DateTime), N'037367497')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (39, N'Phạm Thị Thủy', N'$2a$12$9YRK/al/VggPcx88/YNy0OuSJFz6UcaqKCIhVYLJfew2gxibPoyYu', N'phamthithuy4444@gmail.com', 1, CAST(N'2019-10-21 10:44:50.537' AS DateTime), N'037356478')
INSERT [dbo].[Member] ([MemberId], [Username], [Password], [Email], [Gender], [AddedDate], [Tel]) VALUES (40, N'Ngọc Nhi', N'$2a$12$VzKQilVLFmyuF944bN48H.0bdngcVoFBuqL8vYUiOBM5HNwwETWV2', N'ngocnhi@gmail.com', 0, CAST(N'2019-10-22 23:56:06.110' AS DateTime), N'03456787893')
SET IDENTITY_INSERT [dbo].[Member] OFF
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (1, 1)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (2, 39)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (2, 40)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (3, 37)
INSERT [dbo].[MemberInRole] ([RoleId], [MemberId]) VALUES (3, 38)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (1, 8, 1, 1, N'Design Patterns in C#', 455, N'PDF', N'14.5 MB', N'In the first part of Design Patterns in C#, you will cover the 23 Gang of Four (GoF) design patterns, before moving onto some alternative design patterns, including the Simple Factory Pattern, the Null Object Pattern, and the MVC Pattern. The final part winds up with a conclusion and criticisms of design patterns with chapters on anti-patterns and memory leaks. By working through easy-to-follow examples, you will understand the concepts in depth and have a collection of programs to port over to your own projects.', N'', N'1.jpg', 100000, N'1484236394')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (2, 8, 1, 2, N'Pro C# 7-8th Edition', 1372, N'PDF', N'29.5 MB', N'Ky la', N'', N'2.jpg', 100000, N'1484230175')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (3, 9, 1, 3, N'Java in 24 Hours, Sams Teach Yourself (Covering Java 9), 8th Edition', 448, N'PDF', N'5.6 MB', N'Computer programming with Java is easier than it looks. In just 24 lessons of one hour or less, you can learn to write computer programs in Java. Using a straightforward, step-by-step approach, popular author Rogers Cadenhead helps you master the skills and technology you need to create desktop', N'', N'3.jpg', 100000, N'0672337940')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (4, 9, 1, 4, N'Pro JavaFX 9, 4th Edition', 348, N'PDF', N'6.2 MB', N'Use the JavaFX platform to create rich-client Java applications and discover how you can use this powerful Java-based UI platform, which is capable of handling large-scale data-driven business applications for PC as well as mobile and embedded devices. The expert authors cover the new more modular JavaFX 9 APIs', N'', N'4.jpg', 100000, N'1484230418')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (5, 9, 2, 5, N'Data Science with Java', 236, N'PDF', N'7.1 MB', N'Ky la', N'', N'5.jpg', 100000, N'1491934115')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (6, 11, 1, 6, N'Advanced Data Analytics Using Python', 186, N'PDF', N'2.1 MB', N'Ok', N'', N'6.jpg', 100000, N'1484234499')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (7, 9, 1, 7, N'Java For Dummies, 7th Edition', 504, N'PDF', N'12.6 MB', N'A new edition of the bestselling guide to Java\r\nIf you want to learn to speak the world’s most popular programming language like a native, Java For Dummies is your ideal companion. With a focus on reusing existing code, it quickly and easily shows you how to create basic Java objects, work with Java classes and methods, understand the value of variables, learn to control program flow with loops or decision-making statements, and so much more!\r\nJava is everywhere, runs on almost any computer, and is the engine that drives the coolest applications. Written for anyone who’s ever wanted to tackle programming with Java but never knew quite where to begin, this bestselling guide is your ticket to success! Featuring updates on everything you’ll encounter in Java 9—and brimming with tons of step-by-step instruction—it’s the perfect resource to get you up and running with Java in a jiffy!', N'', N'7.jpg', 100000, N'1119235553')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (8, 13, 1, 8, N'Beginning SQL Queries, Second Edition', 250, N'PDF', N'20.9 MB', N'Anyone who does any work at all with databases needs to know something of SQL. This is a friendly and easy-to-read guide to writing queries with the all-important – in the database world – SQL language. The author writes with exceptional clarity', N'', N'8.jpg', 100000, N'1484219546')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (9, 13, 1, 9, N'Expert SQL Server 2008 Encryption', 320, N'PDF', N'3.18 MB', N'Every day, organizations large and small fall victim to attacks on their data. Encryption provides a shield to help defend against intruders. Because of increasing pressure from government regulators, consumers, and the business community at large, the job descriptions of SQL DBAs and developers are expanding to include encryption. Expert SQL Server 2008 Encryption will show you how to efficiently implement SQL Server 2008 encryption functionality and features to secure your organizational data', N'', N'9.jpg', 100000, N'1430224649')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (10, 13, 1, 10, N'Professional Microsoft SQL Server 2012 Administration', 936, N'PDF', N'93.1 MB', N'Microsoft SQL Server 2012 will have major changes throughout the SQL Server and will impact how DBAs administer the database. With this book, a team of well-known SQL Server experts introduces the many new features of the most recent version of SQL Server and deciphers how these changes will affect the methods that administrators have been using for years. Loaded with unique tips, tricks, and workarounds for handling the most difficult SQL Server admin issues, this how-to guide deciphers topics such as performance tuning, backup and recovery, scaling and replication, clustering, and security.', N'', N'10.jpg', 100000, N'9781118106884')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (11, 13, 1, 1, N'Pro T-SQL 2012 Programmer’s Guide, 3rd Edition', 696, N'PDF', N'18.9 MB', N'Pro T-SQL 2012 Programmer’s Guide is every developer’s key to making full use of SQL Server 2012’s powerful, built-in Transact-SQL language. Discussing new and existing features, the book takes you on an expert guided tour of Transact-SQL functionality. Fully functioning examples and downloadable source code bring technically accurate and engaging treatment of Transact-SQL into your own hands. Step-by-step explanations ensure clarity, and an advocacy of best-practices will steer you down the road to success.\r\n\r\nTransact-SQL is the language developers and DBAs use to interact with SQL Server. It’s used for everything from querying data, to writing stored procedures, to managing the database. New features in T-SQL 2012 include full support for window functions, stored sequences, the ability to throw errors, data paging, and more. All these important new features are covered in this book', N'', N'11.jpg', 100000, N'9781430245964')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (12, 11, 2, 12, N'Python For Dummies', 432, N'PDF', N'1.7 MB', N'Python is one of the most powerful, easy-to-read programminglanguages around, but it does have its limitations. This generalpurpose, high-level language that can be extended and embedded is asmart option for many programming problems, but a poor solution toothers.\r\nPython For Dummies is the quick-and-easy guide to gettingthe most out of this robust program. This hands-on book will showyou everything you need to know about building programs, debuggingcode, and simplifying development, as well as defining what actionsit can perform. You’ll wrap yourself around all of itsadvanced features and become an expert Python user in no time. Thisguide gives you the tools you need to', N'', N'12.jpg', 100000, N'0471778648')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (14, 10, 4, 14, N'GIÁO TRÌNH C++ VÀ LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG', 300, N'Book', N'3 x 4', N'L?p trình c?u trúc là phuong pháp t? ch?c, phân chia chuong trình thành các hàm, th? t?c, chúng du?c dùng d? x? lý d? li?u nhung l?i tách r?i các c?u trúc d? li?u. Thông qua các ngôn ng? Foxpro, Pascal, C da s? nh?ng ngu?i làm Tin h?c dã khá quen bi?t v?i phuong pháp l?p trình này.\n\n \n\nL?p trình hu?ng d?i tu?ng d?a trên vi?c t? ch?c chuong trình thành các l?p. Khác v?i hàm và th? t?c, l?p là m?t don v? bao g?m c? d? li?u và các phuong th?c x? lý. Vì v?y l?p có th? mô t? các th?c th? m?t cách chân th?c, d?y d? c? ph?n d? li?u và yêu c?u qu?n lý. Tu tu?ng l?p trình hu?ng d?i tu?ng du?c áp d?ng cho h?u h?t các ngôn ng? m?i ch?y trên môi tru?ng Windows nhu Microsoft Access, Visual Basic, Visual C. Vì v?y vi?c nghiên c?u phuong pháp l?p trình m?i này là r?t c?n thi?t d?i v?i t?t c? nh?ng ngu?i quan tâm, yêu thích Tin h?c', N'', N'13.jpg', 100000, N'8935001810087')
INSERT [dbo].[Product] ([ProductId], [CategoryId], [PublisherId], [AuthorId], [Title], [Pages], [Weight], [Size], [Descreption], [Content], [ImageUrl], [Price], [ISBN]) VALUES (15, 13, 5, 15, N'Big Data và ứng dụng trong kinh doanh', 350, N'Book', N'20 x 30', N'Trong nh?ng nam g?n dây, m?t thu?t ng? trong công ngh? thông tin du?c nhi?u ngu?i quan tâm ph?i k? d?n là Big Data (D? li?u l?n). Big Data là d? li?u vu?t quá kh? nang x? lý c?a các h? th?ng co s? d? li?u thông thu?ng, d? li?u quá l?n, di chuy?n quá nhanh ho?c không phù h?p v?i ki?n trúc co s? d? li?u hi?n t?i. Ð? thu du?c giá tr? t? d? li?u này, ngu?i ta ph?i ch?n m?t cách khác d? x? lý nó.', N'', N'14.jpg', 100000, N'8935095624539')
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (1, N'Appress')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (2, N'Reilly')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (4, N'Ky thuat Ha Noi')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (5, N'DHQG HCM')
INSERT [dbo].[Publisher] ([PublisherId], [PublisherName]) VALUES (6, N'Dong Nai')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Member')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'ROLE_EMPLOYEE')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (1, N'Processing')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (2, N'Confirm')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (3, N'Delivered')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (4, N'Cancel')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_EMAIL]    Script Date: 12/7/2019 4:48:56 PM ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [UK_EMAIL] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_PHONE]    Script Date: 12/7/2019 4:48:56 PM ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [UK_PHONE] UNIQUE NONCLUSTERED 
(
	[Tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Member]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK__Invoice__MemberI__1ED998B2] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK__Invoice__MemberI__1ED998B2]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK__Invoice__StatusI__276EDEB3] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK__Invoice__StatusI__276EDEB3]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceDe__Invoi__286302EC] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK__InvoiceDe__Invoi__286302EC]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceDe__Produ__22AA2996] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK__InvoiceDe__Produ__22AA2996]
GO
ALTER TABLE [dbo].[MemberInRole]  WITH CHECK ADD  CONSTRAINT [FK__MemberInR__Membe__286302EC] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[MemberInRole] CHECK CONSTRAINT [FK__MemberInR__Membe__286302EC]
GO
ALTER TABLE [dbo].[MemberInRole]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__AuthorI__1920BF5C] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__AuthorI__1920BF5C]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__182C9B23] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__182C9B23]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Publish__1A14E395] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Publish__1A14E395]
GO
/****** Object:  StoredProcedure [dbo].[AddCart]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCart](@MemberId BIGINT
                        , @ProductId int
						,@Quantity int)
AS
BEGIN
	DECLARE @count INT = 0
	SELECT @count = dbo.Cart.Quantity FROM dbo.Cart WHERE dbo.Cart.MemberId = @MemberId AND dbo.Cart.ProductId = @ProductId
	IF(@count < 1 )
		INSERT INTO Cart( MemberId, ProductId, Quantity) VALUES (@MemberId, @ProductId, @Quantity)
	ELSE
		UPDATE  Cart SET dbo.Cart.Quantity = (dbo.Cart.Quantity + @Quantity) WHERE dbo.Cart.MemberId = @MemberId AND dbo.Cart.ProductId = @ProductId	
END

GO
/****** Object:  StoredProcedure [dbo].[AddInvoice]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddInvoice](@pMemberId BIGINT
							,@pEmail VARCHAR(64)
							,@pTel VARCHAR(16)
							,@pAddress VARCHAR(128)
							)
as
BEGIN
	DECLARE @id int;

	INSERT INTO Invoice(MemberId, Email, Tel, Address,StatusId) VALUES(@pMemberId, @pEmail, @pTel, @pAddress,1);
	SELECT @id= @@IDENTITY

	INSERT into InvoiceDetail (InvoiceId, ProductId, Quantity, Price) 
	SELECT @id, Cart.ProductId, Cart.Quantity, Price  FROM Cart INNER JOIN Product ON Cart.ProductId = Product.ProductId
		WHERE  MemberId = @pMemberId;

	DELETE FROM Cart WHERE MemberId = @pMemberId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetCarts]    Script Date: 12/7/2019 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCarts](@MemberId BIGINT)
AS
BEGIN
	SELECT CartId, Cart.ProductId, Title, ImageUrl, Quantity, Price, Cart.AddedDate 
	FROM Cart 
	INNER JOIN Product ON Cart.ProductId = Product.ProductId WHERE MemberId = @MemberId
END

GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
