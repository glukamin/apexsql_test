SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Report] (
		[ReportID]                [int] IDENTITY(1, 1) NOT NULL,
		[ReportUserID]            [int] NOT NULL,
		[ReportName]              [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ProcID]                  [int] NOT NULL,
		[ReportCategoryID]        [int] NOT NULL,
		[ReportComment]           [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ReportType]              [tinyint] NOT NULL,
		[DrillMasterField]        [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DrillChildProcedure]     [int] NULL,
		[TemplateType]            [tinyint] NOT NULL,
		[quarantine]              [int] NOT NULL,
		[HasDrilldown]            [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Report]
	PRIMARY KEY
	CLUSTERED
	([ReportID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	ADD
	CONSTRAINT [DF__asprpt_tb__quara__54968AE5]
	DEFAULT (0) FOR [quarantine]
GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	ADD
	CONSTRAINT [DF_asprpt_tbl_Report_HasDrilldown]
	DEFAULT (0) FOR [HasDrilldown]
GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	ADD
	CONSTRAINT [DF_asprpt_tbl_Report_ProcID]
	DEFAULT (1) FOR [ProcID]
GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	ADD
	CONSTRAINT [DF_asprpt_tbl_Report_Template]
	DEFAULT (0) FOR [TemplateType]
GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_Report_asprpt_tbl_Category]
	FOREIGN KEY ([ReportCategoryID]) REFERENCES [dbo].[asprpt_tbl_Category] ([CategoryID])
ALTER TABLE [dbo].[asprpt_tbl_Report]
	CHECK CONSTRAINT [FK_asprpt_tbl_Report_asprpt_tbl_Category]

GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_Report_asprpt_tbl_Proc]
	FOREIGN KEY ([ProcID]) REFERENCES [dbo].[asprpt_tbl_Proc] ([ProcedureID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_Report]
	CHECK CONSTRAINT [FK_asprpt_tbl_Report_asprpt_tbl_Proc]

GO
ALTER TABLE [dbo].[asprpt_tbl_Report]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_Report_asprpt_tbl_User]
	FOREIGN KEY ([ReportUserID]) REFERENCES [dbo].[asprpt_tbl_User] ([UserID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_Report]
	CHECK CONSTRAINT [FK_asprpt_tbl_Report_asprpt_tbl_User]

GO
ALTER TABLE [dbo].[asprpt_tbl_Report] SET (LOCK_ESCALATION = TABLE)
GO
