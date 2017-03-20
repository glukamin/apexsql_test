SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Unlock_Code_Logs] (
		[ID]                     [int] IDENTITY(1, 1) NOT NULL,
		[Dated]                  [datetime] NOT NULL,
		[Unlock_Code_ID]         [int] NOT NULL,
		[Activation_Counter]     [int] NULL,
		[Activation_Blocked]     [int] NULL,
		[Comment]                [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[User_Id]                [int] NULL,
		[Counter_Change]         [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Unlock_Code_Logs]
	ADD
	CONSTRAINT [PK_ICE_CounterHis]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Unlock_Code_Logs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Unlock_Code_Logs_ICE_Unlock_Codes]
	FOREIGN KEY ([Unlock_Code_ID]) REFERENCES [dbo].[ICE_Unlock_Codes] ([Unlock_Code_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Unlock_Code_Logs]
	NOCHECK CONSTRAINT [FK_ICE_Unlock_Code_Logs_ICE_Unlock_Codes]

GO
ALTER TABLE [dbo].[ICE_Unlock_Code_Logs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Unlock_Code_Logs_ICE_Users]
	FOREIGN KEY ([User_Id]) REFERENCES [dbo].[ICE_Users] ([User_ID])
ALTER TABLE [dbo].[ICE_Unlock_Code_Logs]
	NOCHECK CONSTRAINT [FK_ICE_Unlock_Code_Logs_ICE_Users]

GO
ALTER TABLE [dbo].[ICE_Unlock_Code_Logs] SET (LOCK_ESCALATION = TABLE)
GO
