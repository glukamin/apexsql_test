SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[titles] (
		[title_id]      [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[title]         [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[type]          [char](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pub_id]        [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[price]         [money] NULL,
		[advance]       [money] NULL,
		[royalty]       [int] NULL,
		[ytd_sales]     [int] NULL,
		[notes]         [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[pubdate]       [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[titles] SET (LOCK_ESCALATION = TABLE)
GO
