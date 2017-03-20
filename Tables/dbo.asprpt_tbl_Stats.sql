SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[asprpt_tbl_Stats] (
		[StatsID]           [int] IDENTITY(1, 1) NOT NULL,
		[StatsUserID]       [int] NULL,
		[StatsGroupID]      [int] NULL,
		[StatsReportID]     [int] NULL,
		[StatsDateNow]      [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Stats]
	ADD
	CONSTRAINT [PK_Table1]
	PRIMARY KEY
	CLUSTERED
	([StatsID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Stats]
	ADD
	CONSTRAINT [DF_Table1_StatsDateNow]
	DEFAULT (getdate()) FOR [StatsDateNow]
GO
ALTER TABLE [dbo].[asprpt_tbl_Stats]
	ADD
	CONSTRAINT [DF_Table1_StatsGroupID]
	DEFAULT (0) FOR [StatsGroupID]
GO
ALTER TABLE [dbo].[asprpt_tbl_Stats]
	ADD
	CONSTRAINT [DF_Table1_StatsReportID]
	DEFAULT (0) FOR [StatsReportID]
GO
ALTER TABLE [dbo].[asprpt_tbl_Stats]
	ADD
	CONSTRAINT [DF_Table1_StatsUserID]
	DEFAULT (0) FOR [StatsUserID]
GO
ALTER TABLE [dbo].[asprpt_tbl_Stats] SET (LOCK_ESCALATION = TABLE)
GO
