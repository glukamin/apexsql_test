SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTopic] (
		[Topic_ID]            [int] IDENTITY(1, 1) NOT NULL,
		[Forum_ID]            [int] NULL,
		[Poll_ID]             [int] NOT NULL,
		[Moved_ID]            [int] NOT NULL,
		[Subject]             [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Start_date]          [datetime] NOT NULL,
		[Last_entry_date]     [datetime] NULL,
		[No_of_views]         [int] NOT NULL,
		[Locked]              [bit] NOT NULL,
		[Priority]            [smallint] NOT NULL,
		[Solved]              [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [PK__tblTopic__7968E838]
	PRIMARY KEY
	CLUSTERED
	([Topic_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [DF__tblTopic__Locked__7E2D9D55]
	DEFAULT ((0)) FOR [Locked]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [DF__tblTopic__Moved___7B5130AA]
	DEFAULT ((0)) FOR [Moved_ID]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [DF__tblTopic__No_of___7D39791C]
	DEFAULT ((0)) FOR [No_of_views]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [DF__tblTopic__Poll_I__7A5D0C71]
	DEFAULT ((0)) FOR [Poll_ID]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [DF__tblTopic__Start___7C4554E3]
	DEFAULT (getdate()) FOR [Start_date]
GO
ALTER TABLE [dbo].[tblTopic]
	ADD
	CONSTRAINT [DF_tblTopic_Solved]
	DEFAULT ((0)) FOR [Solved]
GO
ALTER TABLE [dbo].[tblTopic]
	WITH NOCHECK
	ADD CONSTRAINT [tblTopic_FK00]
	FOREIGN KEY ([Forum_ID]) REFERENCES [dbo].[tblForum] ([Forum_ID])
ALTER TABLE [dbo].[tblTopic]
	CHECK CONSTRAINT [tblTopic_FK00]

GO
CREATE NONCLUSTERED INDEX [Forum_ID]
	ON [dbo].[tblTopic] ([Forum_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Poll_ID]
	ON [dbo].[tblTopic] ([Poll_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblForumtblTopic]
	ON [dbo].[tblTopic] ([Forum_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Topic_ID]
	ON [dbo].[tblTopic] ([Topic_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTopic] SET (LOCK_ESCALATION = TABLE)
GO
