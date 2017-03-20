SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[tblMailContent] (
		[ProductID]     [int] NOT NULL,
		[Subject]       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Body]          [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		CONSTRAINT [UK_tblMailContent_ProductID]
		UNIQUE
		NONCLUSTERED
		([ProductID])
		ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblMailContent] SET (LOCK_ESCALATION = TABLE)
GO
