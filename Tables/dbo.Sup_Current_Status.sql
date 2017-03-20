SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sup_Current_Status] (
		[Current_Status_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Current_Status_Name]     [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Current_Status]
	ADD
	CONSTRAINT [PK_Sup_Current_Status]
	PRIMARY KEY
	CLUSTERED
	([Current_Status_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Current_Status] SET (LOCK_ESCALATION = TABLE)
GO
