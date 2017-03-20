SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[pomocna] (
		[Primary_ID]     [uniqueidentifier] NOT NULL,
		[Old_ID]         [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pomocna]
	ADD
	CONSTRAINT [PK__pomocna__A5D11794FBF2219A]
	PRIMARY KEY
	CLUSTERED
	([Primary_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[pomocna]
	ADD
	CONSTRAINT [DF__pomocna__Primary__05CF8A74]
	DEFAULT (newsequentialid()) FOR [Primary_ID]
GO
ALTER TABLE [dbo].[pomocna] SET (LOCK_ESCALATION = TABLE)
GO
