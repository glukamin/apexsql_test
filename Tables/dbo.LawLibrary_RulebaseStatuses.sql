SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LawLibrary_RulebaseStatuses] (
		[Id]       [int] NULL,
		[Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LawLibrary_RulebaseStatuses] SET (LOCK_ESCALATION = TABLE)
GO
