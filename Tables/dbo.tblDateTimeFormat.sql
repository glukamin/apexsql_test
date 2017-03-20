SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDateTimeFormat] (
		[Date_format]     [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Year_format]     [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Seporator]       [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month1]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month2]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month3]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month4]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month5]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month6]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month7]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month8]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month9]          [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month10]         [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month11]         [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Month12]         [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Time_format]     [smallint] NULL,
		[am]              [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[pm]              [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDateTimeFormat]
	ADD
	CONSTRAINT [PK__tblDateTimeForma__12349602]
	PRIMARY KEY
	CLUSTERED
	([Date_format])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDateTimeFormat] SET (LOCK_ESCALATION = TABLE)
GO
