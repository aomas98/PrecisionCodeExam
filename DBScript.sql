USE [Precision]
GO
/****** Object:  Table [dbo].[LeaveRequest]    Script Date: 2/9/2023 3:56:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequest](
	[LeaveRqstId] [int] IDENTITY(1,1) NOT NULL,
	[LeaveRqstGuid] [uniqueidentifier] NOT NULL,
	[RequestorId] [int] NOT NULL,
	[ReportingToId] [int] NOT NULL,
	[RequestedBy] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[NoOfDays] [int] NOT NULL,
	[Comments] [nvarchar](500) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_LeaveRequest_1] PRIMARY KEY CLUSTERED 
(
	[LeaveRqstId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/9/2023 3:56:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserGuid] [uniqueidentifier] NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[Username] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTypeMapping]    Script Date: 2/9/2023 3:56:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTypeMapping](
	[UserTypeMappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeMappingGuid] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserId2] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_UsersTypeMapping] PRIMARY KEY CLUSTERED 
(
	[UserTypeMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2/9/2023 3:56:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeGuid] [uniqueidentifier] NOT NULL,
	[UserTypeName] [nvarchar](50) NULL,
	[UserTypeDescription] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserGuid], [UserTypeId], [Username], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], [Birthday], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'1b5736a6-1357-4586-839f-b0da2233ffaa', 1, NULL, N'Joshua', N'Dy', N'Villaroman', NULL, NULL, NULL, N'Admin', CAST(N'2023-02-07T15:35:48.940' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [UserGuid], [UserTypeId], [Username], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], [Birthday], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'eaee8e57-0dff-4769-9baf-663212ac2f53', 1, NULL, N'Joshua2', N'Dy', N'Villaroman2', NULL, NULL, NULL, N'Admin', CAST(N'2023-02-07T15:36:12.943' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [UserGuid], [UserTypeId], [Username], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], [Birthday], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'2782fcc0-b796-4ede-a1f7-01c670f14584', 1, NULL, N'Joshua3', N'Dy', N'Villaroman3', NULL, NULL, NULL, N'Admin', CAST(N'2023-02-07T15:36:29.377' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [UserGuid], [UserTypeId], [Username], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], [Birthday], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'4a70b697-489c-4e89-8498-579639b68dd4', 2, NULL, N'Employee1', N'Employee1', N'Employee1', NULL, NULL, NULL, N'Admin', CAST(N'2023-02-07T15:36:47.140' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [UserGuid], [UserTypeId], [Username], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], [Birthday], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'94075969-ad5e-44bc-a158-f1b427ce4d8f', 2, NULL, N'Employee2', N'Employee2', N'Employee2', NULL, NULL, NULL, N'Admin', CAST(N'2023-02-07T15:37:02.480' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeGuid], [UserTypeName], [UserTypeDescription], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'2125903c-71ef-4d10-8f87-9f062e55389b', N'Manager', N'Manager', N'Admin', CAST(N'2023-02-07T15:31:13.353' AS DateTime), NULL, NULL)
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeGuid], [UserTypeName], [UserTypeDescription], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'530455be-1107-48d0-83d2-4cf09f0b08bf', N'Supervisor', N'Supervisor', N'Admin', CAST(N'2023-02-07T15:31:37.280' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[LeaveRequest] ADD  CONSTRAINT [DF_LeaveRequest_LeaveRqstGuid]  DEFAULT (newid()) FOR [LeaveRqstGuid]
GO
ALTER TABLE [dbo].[LeaveRequest] ADD  CONSTRAINT [DF_LeaveRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserGuid]  DEFAULT (newid()) FOR [UserGuid]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UsersTypeMapping] ADD  CONSTRAINT [DF_UsersTypeMapping_UserTypeMappingGuid]  DEFAULT (newid()) FOR [UserTypeMappingGuid]
GO
ALTER TABLE [dbo].[UsersTypeMapping] ADD  CONSTRAINT [DF_UsersTypeMapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserTypes] ADD  CONSTRAINT [DF_UserType_UserTypeGuid]  DEFAULT (newid()) FOR [UserTypeGuid]
GO
ALTER TABLE [dbo].[UserTypes] ADD  CONSTRAINT [DF_UserTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
