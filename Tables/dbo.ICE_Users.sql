SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Users] (
		[User_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Login]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Password]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[User_Group_ID]     [int] NULL,
		[Allow]             [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Users]
	ADD
	CONSTRAINT [PK_ICE_User]
	PRIMARY KEY
	CLUSTERED
	([User_ID])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ICE_Users]
	ON [dbo].[ICE_Users] ([Login])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Users] SET (LOCK_ESCALATION = TABLE)
GO
