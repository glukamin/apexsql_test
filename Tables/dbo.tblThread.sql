SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblThread] (
		[Thread_ID]          [int] IDENTITY(1, 1) NOT NULL,
		[Topic_ID]           [int] NOT NULL,
		[Author_ID]          [int] NULL,
		[Message]            [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Message_date]       [datetime] NOT NULL,
		[Show_signature]     [bit] NOT NULL,
		[IP_addr]            [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblThread]
	ADD
	CONSTRAINT [PK__tblThread__0015E5C7]
	PRIMARY KEY
	CLUSTERED
	([Thread_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblThread]
	ADD
	CONSTRAINT [DF__tblThread__Messa__010A0A00]
	DEFAULT (getdate()) FOR [Message_date]
GO
ALTER TABLE [dbo].[tblThread]
	ADD
	CONSTRAINT [DF__tblThread__Show___01FE2E39]
	DEFAULT (0) FOR [Show_signature]
GO
ALTER TABLE [dbo].[tblThread]
	WITH NOCHECK
	ADD CONSTRAINT [tblThread_FK00]
	FOREIGN KEY ([Author_ID]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
ALTER TABLE [dbo].[tblThread]
	CHECK CONSTRAINT [tblThread_FK00]

GO
ALTER TABLE [dbo].[tblThread]
	WITH NOCHECK
	ADD CONSTRAINT [tblThread_FK01]
	FOREIGN KEY ([Topic_ID]) REFERENCES [dbo].[tblTopic] ([Topic_ID])
ALTER TABLE [dbo].[tblThread]
	CHECK CONSTRAINT [tblThread_FK01]

GO
CREATE NONCLUSTERED INDEX [Message_date]
	ON [dbo].[tblThread] ([Message_date])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Message_ID]
	ON [dbo].[tblThread] ([Thread_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblAuthortblThread]
	ON [dbo].[tblThread] ([Author_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblTopictblThread]
	ON [dbo].[tblThread] ([Topic_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Topic_ID]
	ON [dbo].[tblThread] ([Topic_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblThread] SET (LOCK_ESCALATION = TABLE)
GO
