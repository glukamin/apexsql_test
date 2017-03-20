SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sup_Recieved_Via] (
		[Received_Via_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Received_Via_Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Recieved_Via]
	ADD
	CONSTRAINT [PK_Sup_Recieved_Via]
	PRIMARY KEY
	CLUSTERED
	([Received_Via_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Recieved_Via] SET (LOCK_ESCALATION = TABLE)
GO
