Create Database [Precision]
go

USE [Precision]
GO
/****** Object:  Table [dbo].[LeaveRequest]    Script Date: 2/13/2023 1:35:44 AM ******/
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
	[Comments] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/13/2023 1:35:44 AM ******/
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
/****** Object:  Table [dbo].[UsersTypeMapping]    Script Date: 2/13/2023 1:35:44 AM ******/
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2/13/2023 1:35:44 AM ******/
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
SET IDENTITY_INSERT [dbo].[LeaveRequest] ON 

INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'11c8632d-fe52-4a26-bf63-9b6bfe92743c', 1, 2, NULL, CAST(N'2023-02-11' AS Date), CAST(N'2023-02-11' AS Date), CAST(N'2023-02-12' AS Date), 0, N'123', NULL, NULL, NULL, N'Admin', CAST(N'2023-02-11T16:48:58.263' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'8cdcc29c-4681-4047-a1f5-30afd337642e', 1, 2, NULL, CAST(N'2023-02-11' AS Date), CAST(N'2023-02-12' AS Date), CAST(N'2023-02-13' AS Date), 0, N'wqe', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-11T16:52:22.150' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1002, N'2f921cb7-1888-4196-946a-268c95f8cfd8', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), CAST(N'2023-02-15' AS Date), 0, N'asd', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:12:22.997' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1003, N'2dfec446-50a1-4e2a-a8ec-3aadfdac7a91', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, N'asd', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:20:23.810' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1004, N'21a2ea24-de2b-4715-ad36-d50cffb46f5d', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, N'asdasd', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:21:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1005, N'e9f3d990-3649-43c6-952a-387ceaa41b7f', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, N'sd', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:22:59.323' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1006, N'5d4e1771-83cc-4bfc-961d-2ac0272df70d', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, NULL, N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:29:05.763' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1007, N'fc330f5e-2c06-47a6-a3ce-9bc2daf03c85', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-16' AS Date), CAST(N'2023-02-17' AS Date), 0, N'123', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:29:26.700' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1008, N'1016c402-09fb-4864-86c7-7cb692f4ac9b', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-15' AS Date), CAST(N'2023-02-16' AS Date), 0, N'131', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T00:36:11.440' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1009, N'af6e82d6-0adb-4148-bb25-88d0047e8435', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, N'123123', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T01:05:56.587' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1010, N'19c7ab0f-f19e-42d6-b1af-bc7988e9da72', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, N'123', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T01:14:37.077' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1011, N'3cd87218-3a83-47c0-a080-7c13b9e1594c', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), 0, N'123', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T01:29:36.807' AS DateTime), NULL, NULL)
INSERT [dbo].[LeaveRequest] ([LeaveRqstId], [LeaveRqstGuid], [RequestorId], [ReportingToId], [RequestedBy], [StartDate], [EndDate], [ReturnDate], [NoOfDays], [Comments], [Status], [ApprovedBy], [ApprovedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1012, N'484d58ce-7d9b-40e6-b9a6-72a3ac767304', 1, 2, NULL, CAST(N'2023-02-13' AS Date), CAST(N'2023-02-14' AS Date), CAST(N'2023-02-15' AS Date), 0, N'2312', N'PENDING', NULL, NULL, N'Admin', CAST(N'2023-02-13T01:34:18.250' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[LeaveRequest] OFF
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
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequest_Users] FOREIGN KEY([RequestorId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [FK_LeaveRequest_Users]
GO
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequest_Users1] FOREIGN KEY([ReportingToId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [FK_LeaveRequest_Users1]
GO
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [CK_RequestorId_ReportingToId] CHECK  (([ReportingToId]=[ReportingToId]))
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [CK_RequestorId_ReportingToId]
GO
