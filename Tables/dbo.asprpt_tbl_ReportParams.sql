SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_ReportParams] (
		[ParamID]           [int] IDENTITY(1, 1) NOT NULL,
		[ParamReportID]     [int] NOT NULL,
		[ParamName]         [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DataType]          [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DataLength]        [int] NOT NULL,
		[ControlType]       [tinyint] NOT NULL,
		[ControlSource]     [int] NULL,
		[Required]          [bit] NOT NULL,
		[CustomText]        [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Comment]           [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DisplayName]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_ReportParams]
	ADD
	CONSTRAINT [PK_asprpt_tbl_ReportParams]
	PRIMARY KEY
	CLUSTERED
	([ParamID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_ReportParams]
	ADD
	CONSTRAINT [DF_asprpt_tbl_ReportParams_ControlType]
	DEFAULT (0) FOR [ControlType]
GO
ALTER TABLE [dbo].[asprpt_tbl_ReportParams]
	ADD
	CONSTRAINT [DF_asprpt_tbl_ReportParams_DataLength]
	DEFAULT (100) FOR [DataLength]
GO
ALTER TABLE [dbo].[asprpt_tbl_ReportParams]
	ADD
	CONSTRAINT [DF_asprpt_tbl_ReportParams_DataType]
	DEFAULT ('varchar') FOR [DataType]
GO
ALTER TABLE [dbo].[asprpt_tbl_ReportParams]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_ReportParams_asprpt_tbl_Report]
	FOREIGN KEY ([ParamReportID]) REFERENCES [dbo].[asprpt_tbl_Report] ([ReportID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_ReportParams]
	CHECK CONSTRAINT [FK_asprpt_tbl_ReportParams_asprpt_tbl_Report]

GO
ALTER TABLE [dbo].[asprpt_tbl_ReportParams] SET (LOCK_ESCALATION = TABLE)
GO
