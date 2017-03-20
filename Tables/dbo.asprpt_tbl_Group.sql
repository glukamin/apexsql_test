SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Group] (
		[GroupID]          [int] IDENTITY(1, 1) NOT NULL,
		[GroupName]        [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[GroupComment]     [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Group]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Group]
	PRIMARY KEY
	CLUSTERED
	([GroupID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Group] SET (LOCK_ESCALATION = TABLE)
GO
