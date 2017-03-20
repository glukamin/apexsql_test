SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[titleauthor] (
		[au_id]          [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[title_id]       [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[au_ord]         [tinyint] NULL,
		[royaltyper]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[titleauthor] SET (LOCK_ESCALATION = TABLE)
GO
