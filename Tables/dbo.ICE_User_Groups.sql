SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_User_Groups] (
		[User_Group_ID]     [int] NOT NULL,
		[Group_Name]        [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_User_Groups]
	ADD
	CONSTRAINT [PK_ICE_User_Groups]
	PRIMARY KEY
	CLUSTERED
	([User_Group_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_User_Groups] SET (LOCK_ESCALATION = TABLE)
GO
