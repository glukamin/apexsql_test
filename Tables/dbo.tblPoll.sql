SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPoll] (
		[Poll_ID]            [int] IDENTITY(1, 1) NOT NULL,
		[Poll_question]      [nvarchar](90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Multiple_votes]     [bit] NOT NULL,
		[Reply]              [bit] NOT NULL,
		[Author_ID]          [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPoll]
	ADD
	CONSTRAINT [PK__tblPoll__18E19391]
	PRIMARY KEY
	CLUSTERED
	([Poll_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Poll_ID]
	ON [dbo].[tblPoll] ([Poll_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPoll] SET (LOCK_ESCALATION = TABLE)
GO
