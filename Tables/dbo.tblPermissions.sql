SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblPermissions] (
		[Group_ID]           [int] NOT NULL,
		[Author_ID]          [int] NOT NULL,
		[Forum_ID]           [int] NOT NULL,
		[Read]               [bit] NOT NULL,
		[Post]               [bit] NOT NULL,
		[Reply_posts]        [bit] NOT NULL,
		[Edit_posts]         [bit] NOT NULL,
		[Delete_posts]       [bit] NOT NULL,
		[Priority_posts]     [bit] NOT NULL,
		[Poll_create]        [bit] NOT NULL,
		[Vote]               [bit] NOT NULL,
		[Attachments]        [bit] NOT NULL,
		[Image_upload]       [bit] NOT NULL,
		[Moderate]           [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPermissions]
	ADD
	CONSTRAINT [DF__tblPermis__Autho__2453463D]
	DEFAULT (0) FOR [Author_ID]
GO
ALTER TABLE [dbo].[tblPermissions]
	ADD
	CONSTRAINT [DF__tblPermis__Forum__25476A76]
	DEFAULT (0) FOR [Forum_ID]
GO
ALTER TABLE [dbo].[tblPermissions]
	ADD
	CONSTRAINT [DF__tblPermis__Group__235F2204]
	DEFAULT (0) FOR [Group_ID]
GO
ALTER TABLE [dbo].[tblPermissions]
	WITH CHECK
	ADD CONSTRAINT [tblPermissions_FK00]
	FOREIGN KEY ([Forum_ID]) REFERENCES [dbo].[tblForum] ([Forum_ID])
ALTER TABLE [dbo].[tblPermissions]
	CHECK CONSTRAINT [tblPermissions_FK00]

GO
CREATE NONCLUSTERED INDEX [tblForum_ID]
	ON [dbo].[tblPermissions] ([Forum_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblForumtblPermissions]
	ON [dbo].[tblPermissions] ([Forum_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblGroup_ID]
	ON [dbo].[tblPermissions] ([Group_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPermissions] SET (LOCK_ESCALATION = TABLE)
GO
