SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sup_Priority] (
		[Priority_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Priority_Name]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Priority]
	ADD
	CONSTRAINT [PK_Sup_Priority]
	PRIMARY KEY
	CLUSTERED
	([Priority_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Priority] SET (LOCK_ESCALATION = TABLE)
GO
