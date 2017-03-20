SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OptedOut] (
		[E-Mail]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last Modification]     [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OptedOut] SET (LOCK_ESCALATION = TABLE)
GO
