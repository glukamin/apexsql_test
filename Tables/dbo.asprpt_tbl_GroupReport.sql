SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[asprpt_tbl_GroupReport] (
		[GroupReportID]           [int] IDENTITY(1, 1) NOT NULL,
		[GroupReportGroupID]      [int] NOT NULL,
		[GroupReportReportID]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_GroupReport]
	ADD
	CONSTRAINT [PK_GroupReport]
	PRIMARY KEY
	CLUSTERED
	([GroupReportID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_GroupReport]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_GroupReport_asprpt_tbl_Group]
	FOREIGN KEY ([GroupReportGroupID]) REFERENCES [dbo].[asprpt_tbl_Group] ([GroupID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_GroupReport]
	CHECK CONSTRAINT [FK_asprpt_tbl_GroupReport_asprpt_tbl_Group]

GO
ALTER TABLE [dbo].[asprpt_tbl_GroupReport]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_GroupReport_asprpt_tbl_Report]
	FOREIGN KEY ([GroupReportReportID]) REFERENCES [dbo].[asprpt_tbl_Report] ([ReportID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_GroupReport]
	CHECK CONSTRAINT [FK_asprpt_tbl_GroupReport_asprpt_tbl_Report]

GO
ALTER TABLE [dbo].[asprpt_tbl_GroupReport] SET (LOCK_ESCALATION = TABLE)
GO
