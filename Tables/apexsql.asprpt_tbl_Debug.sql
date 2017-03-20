SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [apexsql].[asprpt_tbl_Debug] (
		[text]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[asprpt_tbl_Debug] SET (LOCK_ESCALATION = TABLE)
GO
