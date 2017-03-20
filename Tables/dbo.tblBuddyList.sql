SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBuddyList] (
		[Address_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Author_ID]       [int] NOT NULL,
		[Buddy_ID]        [int] NOT NULL,
		[Description]     [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Block]           [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBuddyList]
	ADD
	CONSTRAINT [PK__tblBuddyList__0D6FE0E5]
	PRIMARY KEY
	CLUSTERED
	([Address_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBuddyList]
	ADD
	CONSTRAINT [DF__tblBuddyL__Block__0E64051E]
	DEFAULT (0) FOR [Block]
GO
ALTER TABLE [dbo].[tblBuddyList]
	WITH CHECK
	ADD CONSTRAINT [tblBuddyList_FK00]
	FOREIGN KEY ([Buddy_ID]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
ALTER TABLE [dbo].[tblBuddyList]
	CHECK CONSTRAINT [tblBuddyList_FK00]

GO
CREATE NONCLUSTERED INDEX [Address_ID]
	ON [dbo].[tblBuddyList] ([Address_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Author_ID]
	ON [dbo].[tblBuddyList] ([Buddy_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Buddy_ID]
	ON [dbo].[tblBuddyList] ([Author_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblAuthortblBuddyList]
	ON [dbo].[tblBuddyList] ([Buddy_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBuddyList] SET (LOCK_ESCALATION = TABLE)
GO
