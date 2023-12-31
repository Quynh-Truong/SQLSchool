USE [master]
GO
/****** Object:  Database [SchoolDB]    Script Date: 2023-12-10 01:33:37 ******/
CREATE DATABASE [SchoolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB', FILENAME = N'C:\Users\Asus\SchoolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_log', FILENAME = N'C:\Users\Asus\SchoolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = OFF
GO
USE [SchoolDB]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 2023-12-10 01:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseGrades]    Script Date: 2023-12-10 01:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGrades](
	[CourseGradeID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[GradeID] [int] NULL,
	[DateofGradeSetting] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseGradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2023-12-10 01:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NULL,
	[ClassID] [int] NULL,
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 2023-12-10 01:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2023-12-10 01:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2023-12-10 01:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[SocialSecurityNumber] [nvarchar](13) NOT NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (1, N'3A')
INSERT [dbo].[Classes] ([ClassID], [ClassName]) VALUES (2, N'1A')
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseGrades] ON 

INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (1, 1, 2, 2, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (2, 1, 3, 1, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (3, 1, 5, 3, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (4, 2, 2, 5, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (5, 2, 3, 4, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (6, 2, 5, 4, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (7, 3, 2, 4, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (8, 3, 3, 3, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (9, 3, 5, 3, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (10, 4, 2, 5, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (11, 4, 3, 5, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (12, 4, 5, 5, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (13, 5, 1, 5, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (14, 5, 4, 3, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (15, 5, 6, 5, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (16, 6, 1, 5, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (17, 6, 4, 5, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (18, 6, 6, 4, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (19, 7, 1, 4, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (20, 7, 4, 5, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (21, 7, 6, 4, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (22, 8, 1, 4, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (23, 8, 4, 5, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[CourseGrades] ([CourseGradeID], [StudentID], [CourseID], [GradeID], [DateofGradeSetting]) VALUES (24, 8, 6, 3, CAST(N'2023-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[CourseGrades] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [ClassID], [StaffID]) VALUES (1, N'Beginner Level: How To Conquer The World', 2, 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [ClassID], [StaffID]) VALUES (2, N'World Discovering Like Columbus', 1, 2)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [ClassID], [StaffID]) VALUES (3, N'Intermediate Level: Becoming The Next Einstein', 1, 10)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [ClassID], [StaffID]) VALUES (4, N'Kicking Ass Like A Modern Feminist', 2, 4)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [ClassID], [StaffID]) VALUES (5, N'Robots: A Man''s Best Friend', 1, 7)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [ClassID], [StaffID]) VALUES (6, N'AI: Smarter Than Man?', 2, 7)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (1, 1)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (2, 2)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (3, 3)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (4, 4)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (1, N'Darth', N'Vader', N'Teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (2, N'Christopher', N'Columbus', N'Teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (3, N'James "Wolverine"', N'Howlett', N'Ex teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (4, N'Gloria', N'Steinem', N'Teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (5, N'Albus', N'Dumbledore', N'Principal')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (6, N'Beelzebub', N'Lord of Flies', N'Lunch lady')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (7, N'Anthony', N'Stark', N'Teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (8, N'Pam', N'Beesly', N'Administrator')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (9, N'Snoop', N'Dogg', N'Ex teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (10, N'Albert', N'Einstein', N'Teacher')
INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Position]) VALUES (11, N'WALL-E', N'Robot', N'Janitor')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (1, N'Bart', N'Simpson', N'20130920-1111', 1)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (2, N'Dora "The Explorer"', N'Marquez', N'20130511-2222', 1)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (3, N'Ash', N'Ketchum', N'20130201-3333', 1)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (4, N'Lisa', N'Simpson', N'20151118-4444', 1)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (5, N'Stewie', N'Griffin', N'20220330-5555', 2)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (6, N'Blossom', N'Powerpuff', N'20170110-6666', 2)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (7, N'Buttercup', N'Powerpuff', N'20170110-7777', 2)
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [SocialSecurityNumber], [ClassID]) VALUES (8, N'Bubbles', N'Powerpuff', N'20170110-8888', 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[CourseGrades]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseGrades]  WITH CHECK ADD FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grades] ([GradeID])
GO
ALTER TABLE [dbo].[CourseGrades]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
USE [master]
GO
ALTER DATABASE [SchoolDB] SET  READ_WRITE 
GO
