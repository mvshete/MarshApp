USE [master]
GO
/****** Object:  Database [Test]    Script Date: 04/12/2022 5:50:22 PM ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Test] SET QUERY_STORE = OFF
GO
USE [Test]
GO
/****** Object:  Table [dbo].[Citizen]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NricId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLastActivated] [datetime] NULL,
	[DateLastDeActivated] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Citizen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Citizen] ON 

INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (301, 378988, N'Drew', N'X', N'Randall', CAST(N'2022-04-11T13:39:23.247' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (302, 945152, N'Jules', N'M', N'Simpson', CAST(N'2022-04-11T13:40:00.370' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (303, 994123, N'Bryon', N'f', N'Ebden', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (304, 418413, N'Ronald', N'v', N'Whittle', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (305, 854123, N'Matt', N'Q', N'Rycroft', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (306, 290738, N'Samara', N'C', N'Carter', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (307, 742083, N'Percy', N'g', N'Jenkin', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (308, 469872, N'Liliana', N'6', N'Bishop', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (309, 967448, N'Jocelyn', N'O', N'Morris', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (310, 407078, N'George', N'M', N'Rehman', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (311, 410878, N'Kurt', N'S', N'Davies', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (312, 367448, N'Amelia', N'A', N'Curtis', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (313, 238454, N'Julius', N'v', N'Andersson', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (314, 893782, N'Harvey', N'J', N'Jenkin', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (315, 768807, N'Moira', N'y', N'Whitehouse', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (316, 659723, N'Amy', N'G', N'Wilson', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (317, 689529, N'Logan', N'R', N'Jefferson', CAST(N'2022-04-11T13:40:00.373' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (318, 924977, N'Norah', N'v', N'Wilton', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (319, 896389, N'Oliver', N'm', N'Harrington', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (320, 349586, N'Russel', N'r', N'Hobbs', CAST(N'2022-04-11T13:40:00.377' AS DateTime), CAST(N'2022-04-11T13:41:01.853' AS DateTime), CAST(N'2022-04-11T13:41:04.157' AS DateTime), 2)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (321, 575291, N'Domenic', N'0', N'Denton', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (322, 357732, N'Ramon', N'y', N'Hunt', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (323, 570864, N'Chelsea', N'u', N'Thomas', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (324, 615304, N'Luke', N'0', N'Malone', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (325, 162002, N'Rosalie', N'v', N'Bowen', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (326, 226899, N'Lana', N'r', N'Dempsey', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (327, 247584, N'Henry', N'p', N'Quinton', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (328, 331210, N'Julian', N'6', N'Ross', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (329, 940546, N'Ronald', N'5', N'Milner', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (330, 519983, N'Jane', N'K', N'Wooldridge', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (331, 878938, N'Liliana', N'L', N'Reid', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (332, 538924, N'Vivian', N'G', N'Dubois', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (333, 863978, N'Josephine', N'7', N'Plant', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (334, 504749, N'Matthew', N'r', N'Blythe', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (335, 860513, N'Peter', N's', N'Ellis', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (336, 159508, N'Livia', N'r', N'Lane', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (337, 354638, N'John', N'v', N'Rehman', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (338, 596765, N'Mabel', N'D', N'Underhill', CAST(N'2022-04-11T13:40:00.377' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (339, 659186, N'Danielle', N'J', N'Knight', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (340, 682643, N'William', N'r', N'Douglas', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (341, 751278, N'Chester', N'D', N'Walsh', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (342, 454134, N'Cedrick', N'X', N'Wallace', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (343, 433729, N'Eduardo', N'b', N'Ramsey', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (344, 619393, N'Marjorie', N'M', N'John', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (345, 599179, N'Cadence', N'y', N'Brennan', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (346, 300882, N'Nicholas', N'N', N'Tyrrell', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (347, 127039, N'Faith', N'x', N'Nurton', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (348, 212570, N'Barry', N'v', N'Amstead', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (349, 688754, N'Rufus', N'T', N'Salt', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (350, 715812, N'Hank', N'c', N'Vass', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (351, 213333, N'Denis', N'N', N'Morrow', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (352, 131838, N'Sarah', N'x', N'Rixon', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (353, 170386, N'Ron', N'd', N'Nelson', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (354, 954130, N'Charlize', N'Y', N'Yoman', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (355, 421454, N'Cristal', N'o', N'Drummond', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (356, 141069, N'Jacob', N'A', N'Gonzales', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (357, 134328, N'Manuel', N'F', N'Neal', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (358, 270040, N'Maxwell', N'g', N'Horton', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (359, 797838, N'Tyson', N'E', N'Marshall', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (360, 980561, N'William', N'x', N'Osman', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (361, 594812, N'Bryce', N'H', N'Grey', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (362, 431677, N'Maxwell', N'G', N'Quinn', CAST(N'2022-04-11T13:40:00.380' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (363, 693618, N'Nate', N'A', N'Michael', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (364, 299517, N'Logan', N'1', N'Woodley', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (365, 774286, N'Rick', N'a', N'Benson', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (366, 936413, N'Isla', N'G', N'Ring', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (367, 110185, N'Ryan', N'P', N'Rees', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (368, 325144, N'Jules', N'L', N'Adler', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (369, 998151, N'Dasha', N'M', N'Wilson', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (370, 484671, N'Luke', N'A', N'Saunders', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (371, 450085, N'Javier', N'Y', N'Doherty', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (372, 944504, N'Denny', N'G', N'Brown', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (373, 714552, N'Aurelia', N'R', N'Denton', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (374, 176323, N'Charlotte', N'v', N'Nielson', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (375, 538677, N'Phoebe', N'M', N'Lane', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (376, 693950, N'Lucas', N'e', N'Keys', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (377, 565569, N'Julius', N'h', N'Matthews', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (378, 859757, N'Natalie', N'W', N'Dillon', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (379, 904811, N'Danielle', N't', N'Griffiths', CAST(N'2022-04-11T13:40:00.383' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (380, 924323, N'Harriet', N'2', N'Dallas', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (381, 397348, N'Martin', N'A', N'Carson', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (382, 983536, N'Davina', N's', N'Bennett', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (383, 579057, N'Manuel', N'v', N'Tate', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (384, 100834, N'Michael', N'g', N'Kennedy', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (385, 914071, N'Sofia', N'T', N'Rowe', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (386, 878503, N'Ron', N'i', N'Uttridge', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (387, 868087, N'Jacqueline', N'j', N'Moran', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (388, 891134, N'Ivy', N'p', N'Hall', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (389, 895024, N'Alice', N'V', N'Henderson', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (390, 130936, N'Manuel', N'T', N'Rainford', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (391, 430485, N'Stacy', N'I', N'Dixon', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (392, 640152, N'Carmen', N'J', N'Gates', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (393, 377606, N'Christine', N'G', N'Hewitt', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (394, 997916, N'Parker', N'A', N'Heaton', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (395, 396584, N'Isabella', N'U', N'Campbell', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (396, 503721, N'Mina', N'9', N'Hudson', CAST(N'2022-04-11T13:40:00.387' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (397, 109503, N'Freya', N'Z', N'Rosenbloom', CAST(N'2022-04-11T13:40:00.390' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (398, 607358, N'Lorraine', N'z', N'Anderson', CAST(N'2022-04-11T13:40:00.390' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (399, 601947, N'Cassidy', N'n', N'Weasley', CAST(N'2022-04-11T13:40:00.390' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Citizen] ([Id], [NricId], [FirstName], [MiddleName], [LastName], [DateCreated], [DateLastActivated], [DateLastDeActivated], [Status]) VALUES (400, 536812, N'Sarah', N'R', N'Power', CAST(N'2022-04-11T13:40:00.390' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Citizen] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [DF_Citizen_UniqueName]    Script Date: 04/12/2022 5:50:22 PM ******/
ALTER TABLE [dbo].[Citizen] ADD  CONSTRAINT [DF_Citizen_UniqueName] UNIQUE NONCLUSTERED 
(
	[FirstName] ASC,
	[MiddleName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Nric_UniqueNumber]    Script Date: 04/12/2022 5:50:22 PM ******/
ALTER TABLE [dbo].[Citizen] ADD  CONSTRAINT [UK_Nric_UniqueNumber] UNIQUE NONCLUSTERED 
(
	[NricId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Citizen] ADD  CONSTRAINT [DF_Citizen_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Citizen] ADD  CONSTRAINT [DF_Citizen_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[GetCitizenById]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCitizenById]
@Id INT
AS
BEGIN
	SELECT Id, NricId,FirstName,MiddleName,LastName,DateCreated, DateLastActivated, DateLastDeActivated, [Status],1 AS [TotalRecords]
	FROM Citizen 
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddCitizen]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_AddCitizen] 
	@NricId INT,
	@FirstName NVARCHAR(50),
	@MiddleName NVARCHAR(50),
	@LastName NVARCHAR(100)
AS 
	BEGIN 		
	   INSERT INTO [dbo].[Citizen]([NricId],[FirstName],[MiddleName],[LastName])
	   VALUES(@NricId,@FirstName,@MiddleName,@LastName)
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_DoesCitizenAlreadyExist]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DoesCitizenAlreadyExist]
@Id INT,
@NricId INT,
@FirstName NVARCHAR(50),
@MiddleName NVARCHAR(50),
@LastName NVARCHAR(100)
AS
BEGIN
	IF (@Id = 0)
		BEGIN
			SELECT COUNT(1)	FROM Citizen 
			WHERE (NricId = @NricId) OR (FirstName = @FirstName AND MiddleName = @MiddleName AND LastName = @LastName)
		END
	ELSE
		BEGIN
			SELECT COUNT(1)	FROM Citizen 
			WHERE (Id <> @Id) AND ((NricId = @NricId) OR (FirstName = @FirstName AND MiddleName = @MiddleName AND LastName = @LastName))
		END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListPaginated]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ListPaginated] 
(
	@OffsetValue INT,
	@PagingSize INT,
	@SearchTerm NVARCHAR(500)
)
AS
BEGIN
	DECLARE @TotalRecords INT
	IF (@SearchTerm IS NULL or @SearchTerm = '')
	BEGIN
		SELECT Id, NricId,FirstName,MiddleName,LastName,DateCreated, DateLastActivated, DateLastDeActivated, 
			   [Status],(SELECT COUNT(Id) from Citizen) AS TotalRecords
		FROM Citizen 
		ORDER BY Id DESC
		OFFSET @OffsetValue ROWS FETCH NEXT @PagingSize ROWS ONLY	
	END
	ELSE
	BEGIN 
		SET @TotalRecords = (SELECT COUNT(Id) from Citizen WHERE 
		(	NricId LIKE '%'+ @SearchTerm +'%' OR
			FirstName LIKE '%'+ @SearchTerm +'%' OR 
			MiddleName LIKE '%'+ @SearchTerm +'%' OR 
			LastName LIKE '%'+ @SearchTerm +'%'
		))

		SELECT Id, NricId,FirstName,MiddleName,LastName,DateCreated, DateLastActivated, DateLastDeActivated, 
		[Status],@TotalRecords AS TotalRecords
		FROM Citizen 
		WHERE 
		(	NricId LIKE '%'+ @SearchTerm +'%' OR
			FirstName LIKE '%'+ @SearchTerm +'%' OR 
			MiddleName LIKE '%'+ @SearchTerm +' %' OR 
			LastName LIKE '%'+ @SearchTerm +'%'
		)
		ORDER BY Id DESC
		OFFSET @OffsetValue ROWS FETCH NEXT @PagingSize ROWS ONLY
	END	
END

GO
/****** Object:  StoredProcedure [dbo].[usp_SetCitizenSubscription]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetCitizenSubscription]
@Ids AS  VARCHAR(500),
@SubscriptionStatus INT
AS
BEGIN
	
	IF (@SubscriptionStatus = 1)
		BEGIN
			UPDATE Citizen
			SET DateLastActivated = GETDATE(),
			Status = 1
			WHERE Id IN (SELECT value FROM STRING_SPLIT(@Ids,','))
		END       
	ELSE 
		BEGIN
			UPDATE Citizen
			SET DateLastDeActivated = GETDATE(),
			Status = 2
			WHERE Id IN (SELECT value FROM STRING_SPLIT(@Ids,','))
        END	
END


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCitizen]    Script Date: 04/12/2022 5:50:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateCitizen]
	@Id INT,
	@NricId INT,
	@FirstName NVARCHAR(50),
	@MiddleName NVARCHAR(50),
	@LastName NVARCHAR(100)
AS
BEGIN
	
	UPDATE Citizen
	SET 
		NricId = @NricId,
		FirstName = @FirstName,
		MiddleName = @MiddleName,
		LastName = @LastName
	WHERE Id = @Id
	
END
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
