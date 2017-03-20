SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[asprpt_tbl_UserGroup] (
		[UserGroupID]          [int] IDENTITY(1, 1) NOT NULL,
		[UserGroupUserID]      [int] NOT NULL,
		[UserGroupGroupID]     [int] NOT NULL,
		CONSTRAINT [IX_asprpt_tbl_UserGroup]
		UNIQUE
		NONCLUSTERED
		([UserGroupUserID], [UserGroupGroupID])
		ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserGroup]
	ADD
	CONSTRAINT [PK_asprpt_tbl_UserGroup]
	PRIMARY KEY
	CLUSTERED
	([UserGroupID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserGroup]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_UserGroup_asprpt_tbl_Group]
	FOREIGN KEY ([UserGroupGroupID]) REFERENCES [dbo].[asprpt_tbl_Group] ([GroupID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_UserGroup]
	CHECK CONSTRAINT [FK_asprpt_tbl_UserGroup_asprpt_tbl_Group]

GO
ALTER TABLE [dbo].[asprpt_tbl_UserGroup]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_UserGroup_asprpt_tbl_User]
	FOREIGN KEY ([UserGroupUserID]) REFERENCES [dbo].[asprpt_tbl_User] ([UserID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_UserGroup]
	CHECK CONSTRAINT [FK_asprpt_tbl_UserGroup_asprpt_tbl_User]

GO
ALTER TABLE [dbo].[asprpt_tbl_UserGroup] SET (LOCK_ESCALATION = TABLE)
GO
