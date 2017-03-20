SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Help] (
		[HelpID]           [int] IDENTITY(1, 1) NOT NULL,
		[HelpLocation]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[HelpComment]      [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[HelpOn]           [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Help]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Help]
	PRIMARY KEY
	CLUSTERED
	([HelpID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Help] SET (LOCK_ESCALATION = TABLE)
GO
