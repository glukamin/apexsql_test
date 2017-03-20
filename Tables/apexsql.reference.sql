SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[reference] (
		[id]               [int] IDENTITY(1, 1) NOT NULL,
		[reseller]         [int] NOT NULL,
		[http_referer]     [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[remote_addr]      [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[remote_name]      [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[inserted]         [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[reference]
	ADD
	CONSTRAINT [PK_reference]
	PRIMARY KEY
	NONCLUSTERED
	([id])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[reference]
	ADD
	CONSTRAINT [DF__reference__inser__2C88998B]
	DEFAULT (getdate()) FOR [inserted]
GO
ALTER TABLE [apexsql].[reference] SET (LOCK_ESCALATION = TABLE)
GO
