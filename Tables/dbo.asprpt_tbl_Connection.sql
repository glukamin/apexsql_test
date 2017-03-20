SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Connection] (
		[ID]                       [int] IDENTITY(1, 1) NOT NULL,
		[Name]                     [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ServerName]               [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DatabaseName]             [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AuthenticationTypeId]     [int] NOT NULL,
		[UserName]                 [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Password]                 [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Comments]                 [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Connection]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Connection]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Connection] SET (LOCK_ESCALATION = TABLE)
GO
