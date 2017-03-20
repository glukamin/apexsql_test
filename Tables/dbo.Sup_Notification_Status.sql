SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sup_Notification_Status] (
		[Notification_Status_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Notification_Status_Name]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Notification_Status]
	ADD
	CONSTRAINT [PK_Sup_Notification_Status]
	PRIMARY KEY
	CLUSTERED
	([Notification_Status_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Notification_Status] SET (LOCK_ESCALATION = TABLE)
GO
