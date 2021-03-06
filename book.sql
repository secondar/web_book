USE [master]
GO
/****** Object:  Database [web_book]    Script Date: 2018/6/27 9:58:37 ******/
CREATE DATABASE [web_book]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'web_book', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\web_book.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'web_book_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\web_book_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [web_book] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [web_book].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [web_book] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [web_book] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [web_book] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [web_book] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [web_book] SET ARITHABORT OFF 
GO
ALTER DATABASE [web_book] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [web_book] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [web_book] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [web_book] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [web_book] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [web_book] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [web_book] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [web_book] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [web_book] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [web_book] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [web_book] SET  DISABLE_BROKER 
GO
ALTER DATABASE [web_book] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [web_book] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [web_book] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [web_book] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [web_book] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [web_book] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [web_book] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [web_book] SET RECOVERY FULL 
GO
ALTER DATABASE [web_book] SET  MULTI_USER 
GO
ALTER DATABASE [web_book] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [web_book] SET DB_CHAINING OFF 
GO
ALTER DATABASE [web_book] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [web_book] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'web_book', N'ON'
GO
USE [web_book]
GO
/****** Object:  Table [dbo].[Web_Book]    Script Date: 2018/6/27 9:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_Book](
	[Book_Id] [varchar](50) NOT NULL,
	[Book_Name] [varchar](50) NOT NULL,
	[Book_Class_Id] [varchar](50) NOT NULL,
	[Book_author] [varchar](50) NOT NULL,
	[Book_Press] [varchar](50) NOT NULL,
	[Book_Stock] [int] NOT NULL,
	[Book_Case] [varchar](50) NOT NULL,
	[Book_Borrowing] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Web_Book_class]    Script Date: 2018/6/27 9:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_Book_class](
	[Class_Id] [varchar](50) NOT NULL,
	[Class_Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Web_Borrowing]    Script Date: 2018/6/27 9:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_Borrowing](
	[Borrowing_Id] [int] IDENTITY(1,1) NOT NULL,
	[Borrowing_Book_Id] [varchar](50) NOT NULL,
	[Borrowing_User_Name] [varchar](50) NOT NULL,
	[Return_Time] [smalldatetime] NULL,
	[Borrowing_Time] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Web_User]    Script Date: 2018/6/27 9:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[User_Password] [varchar](50) NOT NULL,
	[User_Row] [int] NOT NULL,
	[User_Nickname] [varchar](50) NOT NULL,
	[User_Tel] [int] NULL,
	[User_Address] [varchar](max) NULL,
	[User_Sex] [int] NOT NULL,
 CONSTRAINT [PK_Web_User] PRIMARY KEY CLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Web_Book] ([Book_Id], [Book_Name], [Book_Class_Id], [Book_author], [Book_Press], [Book_Stock], [Book_Case], [Book_Borrowing]) VALUES (N'JSJ_1', N'计算机基础', N'JSJ_1', N'蓝雨', N'蓝雨', 1, N'蓝雨', 1)
INSERT [dbo].[Web_Book_class] ([Class_Id], [Class_Name]) VALUES (N'JSJ_1', N'计算机')
INSERT [dbo].[Web_Book_class] ([Class_Id], [Class_Name]) VALUES (N'JSJ_2', N'不知道')
SET IDENTITY_INSERT [dbo].[Web_Borrowing] ON 

INSERT [dbo].[Web_Borrowing] ([Borrowing_Id], [Borrowing_Book_Id], [Borrowing_User_Name], [Return_Time], [Borrowing_Time]) VALUES (1, N'JSJ_1', N'admin', CAST(0xA90A040E AS SmallDateTime), CAST(0xA90A03AE AS SmallDateTime))
INSERT [dbo].[Web_Borrowing] ([Borrowing_Id], [Borrowing_Book_Id], [Borrowing_User_Name], [Return_Time], [Borrowing_Time]) VALUES (2, N'JSJ_1', N'admin', NULL, CAST(0xA90C0215 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Web_Borrowing] OFF
SET IDENTITY_INSERT [dbo].[Web_User] ON 

INSERT [dbo].[Web_User] ([User_Id], [User_Name], [User_Password], [User_Row], [User_Nickname], [User_Tel], [User_Address], [User_Sex]) VALUES (4, N'1', N'1', 3, N'1', 1, N'1', 0)
INSERT [dbo].[Web_User] ([User_Id], [User_Name], [User_Password], [User_Row], [User_Nickname], [User_Tel], [User_Address], [User_Sex]) VALUES (2, N'123', N'123', 3, N'123', 123, N'123', 0)
INSERT [dbo].[Web_User] ([User_Id], [User_Name], [User_Password], [User_Row], [User_Nickname], [User_Tel], [User_Address], [User_Sex]) VALUES (1, N'admin', N'admin', 1, N'蓝雨', 110, N'火星', 1)
SET IDENTITY_INSERT [dbo].[Web_User] OFF
ALTER TABLE [dbo].[Web_Book] ADD  CONSTRAINT [DF_Web_Book_Book_Borrowing]  DEFAULT ((0)) FOR [Book_Borrowing]
GO
USE [master]
GO
ALTER DATABASE [web_book] SET  READ_WRITE 
GO
