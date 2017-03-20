SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTL_DatabaseTypes] (
		[Id]       [int] IDENTITY(1, 1) NOT NULL,
		[Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_DatabaseTypes]
	ADD
	CONSTRAINT [PK_OTL_DatabaseType]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Description', N'Primary key', 'SCHEMA', N'dbo', 'TABLE', N'OTL_DatabaseTypes', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'Description', N'This is some test description', 'SCHEMA', N'dbo', 'TABLE', N'OTL_DatabaseTypes', NULL, NULL
GO
ALTER TABLE [dbo].[OTL_DatabaseTypes] SET (LOCK_ESCALATION = TABLE)
GO
