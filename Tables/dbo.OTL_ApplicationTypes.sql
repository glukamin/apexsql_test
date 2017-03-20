SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTL_ApplicationTypes] (
		[Id]       [int] IDENTITY(1, 1) NOT NULL,
		[Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_ApplicationTypes]
	ADD
	CONSTRAINT [PK_OTL_ApplicationType]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_ApplicationTypes] SET (LOCK_ESCALATION = TABLE)
GO
