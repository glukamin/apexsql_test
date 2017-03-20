SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPollChoice] (
		[Choice_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Poll_ID]       [int] NOT NULL,
		[Choice]        [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Votes]         [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPollChoice]
	ADD
	CONSTRAINT [PK__tblPollChoice__1AC9DC03]
	PRIMARY KEY
	CLUSTERED
	([Choice_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPollChoice]
	ADD
	CONSTRAINT [DF__tblPollCh__Poll___1BBE003C]
	DEFAULT (0) FOR [Poll_ID]
GO
ALTER TABLE [dbo].[tblPollChoice]
	ADD
	CONSTRAINT [DF__tblPollCh__Votes__1CB22475]
	DEFAULT (0) FOR [Votes]
GO
ALTER TABLE [dbo].[tblPollChoice]
	WITH CHECK
	ADD CONSTRAINT [tblPollChoice_FK00]
	FOREIGN KEY ([Poll_ID]) REFERENCES [dbo].[tblPoll] ([Poll_ID])
ALTER TABLE [dbo].[tblPollChoice]
	CHECK CONSTRAINT [tblPollChoice_FK00]

GO
CREATE NONCLUSTERED INDEX [Choice_ID]
	ON [dbo].[tblPollChoice] ([Choice_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Poll_ID]
	ON [dbo].[tblPollChoice] ([Poll_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblPollstblPollChoice]
	ON [dbo].[tblPollChoice] ([Poll_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPollChoice] SET (LOCK_ESCALATION = TABLE)
GO
