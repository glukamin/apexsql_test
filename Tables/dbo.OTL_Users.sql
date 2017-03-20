SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTL_Users] (
		[Id]              [int] IDENTITY(1, 1) NOT NULL,
		[FirstName]       [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LastName]        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]           [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address]         [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip]             [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[UserName]        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Password]        [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RegistredOn]     [datetime] NULL,
		[Admin]           [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Users]
	ADD
	CONSTRAINT [PK_OTL_Users]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Users]
	ADD
	CONSTRAINT [DF_OTL_Users_Admin]
	DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[OTL_Users]
	ADD
	CONSTRAINT [DF_OTL_Users_RegistredOn]
	DEFAULT (getdate()) FOR [RegistredOn]
GO
ALTER TABLE [dbo].[OTL_Users] SET (LOCK_ESCALATION = TABLE)
GO
