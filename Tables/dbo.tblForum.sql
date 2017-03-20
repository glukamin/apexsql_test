SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblForum] (
		[Forum_ID]              [int] IDENTITY(1, 1) NOT NULL,
		[Cat_ID]                [smallint] NULL,
		[Forum_Order]           [smallint] NOT NULL,
		[Forum_name]            [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Forum_description]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date_Started]          [datetime] NOT NULL,
		[No_of_topics]          [int] NOT NULL,
		[No_of_posts]           [int] NOT NULL,
		[Password]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Forum_code]            [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Locked]                [bit] NOT NULL,
		[Read]                  [int] NULL,
		[Post]                  [int] NULL,
		[Reply_posts]           [int] NULL,
		[Edit_posts]            [int] NULL,
		[Delete_posts]          [int] NULL,
		[Priority_posts]        [int] NULL,
		[Poll_create]           [int] NULL,
		[Vote]                  [int] NULL,
		[Attachments]           [int] NULL,
		[Image_upload]          [int] NULL,
		[Hide]                  [bit] NOT NULL,
		[Show_topics]           [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblForum]
	ADD
	CONSTRAINT [PK__tblForum__73B00EE2]
	PRIMARY KEY
	CLUSTERED
	([Forum_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblForum]
	ADD
	CONSTRAINT [DF__tblForum__Date_S__75985754]
	DEFAULT (getdate()) FOR [Date_Started]
GO
ALTER TABLE [dbo].[tblForum]
	ADD
	CONSTRAINT [DF__tblForum__Forum___74A4331B]
	DEFAULT (0) FOR [Forum_Order]
GO
ALTER TABLE [dbo].[tblForum]
	ADD
	CONSTRAINT [DF__tblForum__No_of___768C7B8D]
	DEFAULT (0) FOR [No_of_topics]
GO
ALTER TABLE [dbo].[tblForum]
	ADD
	CONSTRAINT [DF__tblForum__No_of___77809FC6]
	DEFAULT (0) FOR [No_of_posts]
GO
ALTER TABLE [dbo].[tblForum]
	WITH CHECK
	ADD CONSTRAINT [tblForum_FK00]
	FOREIGN KEY ([Cat_ID]) REFERENCES [dbo].[tblCategory] ([Cat_ID])
ALTER TABLE [dbo].[tblForum]
	CHECK CONSTRAINT [tblForum_FK00]

GO
CREATE NONCLUSTERED INDEX [Cat_ID]
	ON [dbo].[tblForum] ([Cat_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Forum_code]
	ON [dbo].[tblForum] ([Forum_code])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblCategoriestblForum]
	ON [dbo].[tblForum] ([Cat_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblForum] SET (LOCK_ESCALATION = TABLE)
GO
