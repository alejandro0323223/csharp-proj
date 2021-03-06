USE [Socrates]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'.NET')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'SQL Server')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'SharePoint')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (4, N'Java')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (6, N'JavaScript')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (7, N'Apple')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (8, N'Oracle')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (1, N'MVC-104', N'Introduction to ASP.NET MVC 5', 4, N'Teaches attendees all the skills necessary for designing and building an effective ASP.NET MVC 5 application.', CAST(0x0000A2B900000000 AS DateTime), 1, 1)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (5, N'SQL-100', N'Introduction to SQL Server 2000', 5, N'Teaches attendees the skills they need to successfully build, administer, and query Microsoft SQL Server 2000 databases.', CAST(0x00008F4800000000 AS DateTime), 0, 2)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (6, N'ORC-334', N'Oracle 12c for Administrators', 5, N'Introduces the many powerful capabilities of the Oracle database.', CAST(0x0000A2A700000000 AS DateTime), 1, 8)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (7, N'NET-944', N'Introduction to Visual C++/CLI ', 5, N'Teaches attendees how to write high-performance C++ applications that leverage the power of the .NET Framework. This course is taught using Visual Studio 2012 or 2013.', CAST(0x0000A27300000000 AS DateTime), 1, 1)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (9, N'SCRPT-136', N'Introduction to AngularJS', 3, N'Teaches developers how to use AngularJS to facilitate development of single-page web applications.', CAST(0x0000A24600000000 AS DateTime), 1, 6)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (10, N'SHPT-300', N'SharePoint Designer 2013', 4, N'Teaches how to build SharePoint sites.', CAST(0x0000A14700000000 AS DateTime), 1, 3)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (11, N'NET-942', N'.NET Web Application Security', 3, N'Teaches students the fundamentals of web application security.', CAST(0x0000A1F400000000 AS DateTime), 1, 1)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (12, N'MVC-102', N'Introduction to ASP.NET MVC 4', 4, N'Teaches attendees how to build ASP.NET MVC 4 applications.', CAST(0x0000A0A000000000 AS DateTime), 1, 1)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (13, N'SCRPT-130', N'Introduction to Backbone.js', 3, N'Teaches how to structure applications using Backbone.js.', CAST(0x0000A1F400000000 AS DateTime), 1, 6)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (14, N'SQL-204', N'SQL Server 2008 Performance Tuning', 3, N'Teaches how to accelerate SQL Server 2008.', CAST(0x00009A3800000000 AS DateTime), 1, 2)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (15, N'MBL-120', N'Building iOS 7 Applications', 5, N'Teaches developers how to build applications for iPhone, iPad, and iPod Touch.', CAST(0x0000A25700000000 AS DateTime), 1, 7)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (16, N'SCRPT-150', N'JavaScript for Graphics and Multimedia', 2, N'Teaches how to develop multimedia JavaScript applications.', CAST(0x0000A20200000000 AS DateTime), 1, 6)
INSERT [dbo].[Courses] ([Id], [Number], [Title], [Duration], [Description], [AvailabilityDate], [IsActive], [Department_Id]) VALUES (17, N'JWS-202', N'Developing Java Web Services for Java EE 6', 5, N'This training teaches development of SOAP-based Java web services using JAX-WS.', CAST(0x0000A29000000000 AS DateTime), 1, 4)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Instructors] ON 

INSERT [dbo].[Instructors] ([Id], [FirstName], [LastName], [Department_Id]) VALUES (1, N'Bill', N'Gates', 1)
INSERT [dbo].[Instructors] ([Id], [FirstName], [LastName], [Department_Id]) VALUES (2, N'Tim', N'Cook', 7)
INSERT [dbo].[Instructors] ([Id], [FirstName], [LastName], [Department_Id]) VALUES (3, N'John', N'Doe', 4)
INSERT [dbo].[Instructors] ([Id], [FirstName], [LastName], [Department_Id]) VALUES (4, N'Jane', N'Doe', 2)
SET IDENTITY_INSERT [dbo].[Instructors] OFF
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (1, 1)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (4, 5)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (3, 7)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (1, 11)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (1, 12)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (3, 13)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (4, 14)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (2, 15)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (4, 16)
INSERT [dbo].[InstructorCourses] ([Instructor_Id], [Course_Id]) VALUES (3, 17)