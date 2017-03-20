SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblEmailNotify] (
		[Watch_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Author_ID]     [int] NOT NULL,
		[Forum_ID]      [int] NOT NULL,
		[Topic_ID]      [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailNotify]
	ADD
	CONSTRAINT [PK__tblEmailNotify__1E9A6CE7]
	PRIMARY KEY
	CLUSTERED
	([Watch_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailNotify]
	ADD
	CONSTRAINT [DF__tblEmailN__Autho__1F8E9120]
	DEFAULT (0) FOR [Author_ID]
GO
ALTER TABLE [dbo].[tblEmailNotify]
	ADD
	CONSTRAINT [DF__tblEmailN__Forum__2082B559]
	DEFAULT (0) FOR [Forum_ID]
GO
ALTER TABLE [dbo].[tblEmailNotify]
	ADD
	CONSTRAINT [DF__tblEmailN__Topic__2176D992]
	DEFAULT (0) FOR [Topic_ID]
GO
ALTER TABLE [dbo].[tblEmailNotify]
	WITH CHECK
	ADD CONSTRAINT [tblEmailNotify_FK00]
	FOREIGN KEY ([Author_ID]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
ALTER TABLE [dbo].[tblEmailNotify]
	CHECK CONSTRAINT [tblEmailNotify_FK00]

GO
CREATE NONCLUSTERED INDEX [Author_ID]
	ON [dbo].[tblEmailNotify] ([Author_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Forum_ID]
	ON [dbo].[tblEmailNotify] ([Forum_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblAuthortblTopicWatch]
	ON [dbo].[tblEmailNotify] ([Author_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Toipc_ID]
	ON [dbo].[tblEmailNotify] ([Topic_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Watch_ID]
	ON [dbo].[tblEmailNotify] ([Watch_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailNotify] SET (LOCK_ESCALATION = TABLE)
GO
