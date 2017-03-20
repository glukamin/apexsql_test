SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGuestName] (
		[Guest_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Thread_ID]     [int] NULL,
		[Name]          [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGuestName]
	ADD
	CONSTRAINT [PK__tblGuestName__272FB2E8]
	PRIMARY KEY
	CLUSTERED
	([Guest_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGuestName]
	WITH CHECK
	ADD CONSTRAINT [tblGuestName_FK00]
	FOREIGN KEY ([Thread_ID]) REFERENCES [dbo].[tblThread] ([Thread_ID])
ALTER TABLE [dbo].[tblGuestName]
	CHECK CONSTRAINT [tblGuestName_FK00]

GO
CREATE NONCLUSTERED INDEX [Guest_ID]
	ON [dbo].[tblGuestName] ([Guest_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblThreadtblGuestName]
	ON [dbo].[tblGuestName] ([Thread_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Thread_ID]
	ON [dbo].[tblGuestName] ([Thread_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGuestName] SET (LOCK_ESCALATION = TABLE)
GO
