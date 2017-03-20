SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_UserPreferences] (
		[UserID]                 [int] NOT NULL,
		[Stylesheet]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ReportInNewWindow]      [bit] NOT NULL,
		[ReportFilterID]         [int] NULL,
		[MaximumOutputRows]      [int] NOT NULL,
		[MaximumRowsPerPage]     [int] NOT NULL,
		[DateFormat]             [int] NOT NULL,
		[WordWrap]               [bit] NULL,
		[BadReports]             [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	ADD
	CONSTRAINT [PK_asprpt_tbl_UserPreferences]
	PRIMARY KEY
	CLUSTERED
	([UserID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	ADD
	CONSTRAINT [DF_asprpt_tbl_UserPreferences_DateFormat]
	DEFAULT (0) FOR [DateFormat]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	ADD
	CONSTRAINT [DF_asprpt_tbl_UserPreferences_MaximumOutputRows]
	DEFAULT (500) FOR [MaximumOutputRows]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	ADD
	CONSTRAINT [DF_asprpt_tbl_UserPreferences_MaximumRowsPerPage]
	DEFAULT (10) FOR [MaximumRowsPerPage]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	ADD
	CONSTRAINT [DF_asprpt_tbl_UserPreferences_ReportInNewWindow]
	DEFAULT (0) FOR [ReportInNewWindow]
GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	WITH CHECK
	ADD CONSTRAINT [FK_asprpt_tbl_UserPreferences_asprpt_tbl_User]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[asprpt_tbl_User] ([UserID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences]
	CHECK CONSTRAINT [FK_asprpt_tbl_UserPreferences_asprpt_tbl_User]

GO
ALTER TABLE [dbo].[asprpt_tbl_UserPreferences] SET (LOCK_ESCALATION = TABLE)
GO
