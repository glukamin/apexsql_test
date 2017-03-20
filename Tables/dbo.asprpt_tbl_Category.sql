SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Category] (
		[CategoryID]       [int] IDENTITY(1, 1) NOT NULL,
		[CategoryName]     [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Category]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Category]
	PRIMARY KEY
	CLUSTERED
	([CategoryID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Category] SET (LOCK_ESCALATION = TABLE)
GO
