SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_SavedFilters] (
		[FilterID]         [int] IDENTITY(1, 1) NOT NULL,
		[UserID]           [int] NOT NULL,
		[FilterName]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[CategoryID]       [int] NULL,
		[SearchString]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_SavedFilters]
	ADD
	CONSTRAINT [PK_asprpt_tbl_SavedFilters]
	PRIMARY KEY
	CLUSTERED
	([FilterID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_SavedFilters]
	WITH CHECK
	ADD CONSTRAINT [FK_asprpt_tbl_SavedFilters_asprpt_tbl_User]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[asprpt_tbl_User] ([UserID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_SavedFilters]
	CHECK CONSTRAINT [FK_asprpt_tbl_SavedFilters_asprpt_tbl_User]

GO
ALTER TABLE [dbo].[asprpt_tbl_SavedFilters] SET (LOCK_ESCALATION = TABLE)
GO
