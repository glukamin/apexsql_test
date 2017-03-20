SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_User] (
		[UserID]           [int] IDENTITY(1, 1) NOT NULL,
		[UserName]         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[UserPassword]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[UserLevel]        [int] NOT NULL,
		CONSTRAINT [IX_asprpt_tbl_User_UserName]
		UNIQUE
		NONCLUSTERED
		([UserName])
		ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_User]
	ADD
	CONSTRAINT [PK_asprpt_tbl_User]
	PRIMARY KEY
	CLUSTERED
	([UserID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_User] SET (LOCK_ESCALATION = TABLE)
GO
