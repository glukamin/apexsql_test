SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_GraphParams] (
		[GraphID]                      [int] IDENTITY(1, 1) NOT NULL,
		[GraphReportID]                [int] NOT NULL,
		[LabelsField]                  [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ValuesField]                  [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[GraphType]                    [smallint] NOT NULL,
		[GraphButtons]                 [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphBgcolor]                 [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphcanvasbgcolor]           [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphxaxisname]               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphyaxisname]               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphCaption]                 [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphSubcaption]              [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphyaxisminvalue]           [smallint] NULL,
		[Graphyaxismaxvalue]           [smallint] NULL,
		[GraphformatNumber]            [smallint] NULL,
		[GraphnumberPrefix]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphnumberSuffix]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphanimation]               [smallint] NULL,
		[Graphanimspeed]               [smallint] NULL,
		[Graphbasefont]                [smallint] NULL,
		[Graphbasefontsize]            [smallint] NULL,
		[Graphbasefontcolor]           [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphoutcnvbasefont]          [smallint] NULL,
		[Graphoutcnvbasefontsize]      [smallint] NULL,
		[Graphoutcnvbasefontcolor]     [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphshownames]               [smallint] NULL,
		[Graphshowvalues]              [smallint] NULL,
		[GraphshowYLimits]             [smallint] NULL,
		[GraphshowCanvas]              [smallint] NULL,
		[Graphshowgridbg]              [smallint] NULL,
		[Graphgridbgcolor]             [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphnumdivlines]             [int] NULL,
		[Graphdivlinecolor]            [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphdivlinethickness]        [smallint] NULL,
		[Graphshowhovercap]            [smallint] NULL,
		[Graphhovercapbg]              [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphhovercapborder]          [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphhovercapSepChar]         [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphzeroPlaneColor]          [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphzeroPlaneAlpha]          [int] NULL,
		[Graphlegendboxbgcolor]        [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphlegendboxbrdrcolor]      [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphnavbtncolor]             [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphpieshadowcolor]          [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphshowShadow]              [smallint] NULL,
		[Graphlinethickness]           [int] NULL,
		[GraphnumVdivlines]            [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphvDivlinecolor]           [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphvDivlinethickness]       [int] NULL,
		[GraphvDivlineAlpha]           [int] NULL,
		[Graphanchorbgcolor]           [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphanchorbrdrcolor]         [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Graphanchorscale]             [int] NULL,
		[GraphareaColor]               [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphareaAlpha]               [int] NULL,
		[GraphshowVerLines]            [smallint] NULL,
		[GraphshowAreaBorder]          [smallint] NULL,
		[GraphareaBorderThickness]     [smallint] NULL,
		[GraphareaBorderColor]         [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphVerlineWidth]            [smallint] NULL,
		[GraphVerLineColor]            [char](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[GraphVerLineAlpha]            [smallint] NULL,
		[MSMasterField]                [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MSDepFields]                  [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DrillDown]                    [int] NOT NULL,
		[DrillMasterField]             [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DrillChildProcedure]          [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DrillChildLabels]             [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DrillChildValues]             [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_GraphParams]
	ADD
	CONSTRAINT [PK_asprpt_tbl_GraphParams]
	PRIMARY KEY
	CLUSTERED
	([GraphID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_GraphParams]
	WITH NOCHECK
	ADD CONSTRAINT [FK_asprpt_tbl_GraphParams_asprpt_tbl_Report]
	FOREIGN KEY ([GraphReportID]) REFERENCES [dbo].[asprpt_tbl_Report] ([ReportID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_GraphParams]
	CHECK CONSTRAINT [FK_asprpt_tbl_GraphParams_asprpt_tbl_Report]

GO
ALTER TABLE [dbo].[asprpt_tbl_GraphParams] SET (LOCK_ESCALATION = TABLE)
GO
