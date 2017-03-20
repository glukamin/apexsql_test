SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[codProducts] (
		[ProductID]               [int] IDENTITY(1, 1) NOT NULL,
		[ProductName]             [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ProductDownloadLink]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ProductGraphicLoc]       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Version]                 [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ShowRegFlag]             [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[codProducts]
	ADD
	CONSTRAINT [codProducts_ProductID_PK]
	PRIMARY KEY
	NONCLUSTERED
	([ProductID])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[codProducts] SET (LOCK_ESCALATION = TABLE)
GO
