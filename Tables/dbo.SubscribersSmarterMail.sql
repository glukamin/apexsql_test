SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubscribersSmarterMail] (
		[Email]     [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubscribersSmarterMail] SET (LOCK_ESCALATION = TABLE)
GO
