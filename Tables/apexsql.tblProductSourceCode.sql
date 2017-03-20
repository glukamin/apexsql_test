SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[tblProductSourceCode] (
		[SourceCodeID]       [int] IDENTITY(1, 1) NOT NULL,
		[ProductID]          [int] NOT NULL,
		[UrlTitle]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Url]                [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[UrlDescription]     [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[PostedDate]         [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblProductSourceCode]
	ADD
	CONSTRAINT [tblProductSourceCode_SourceCodeID_PK]
	PRIMARY KEY
	NONCLUSTERED
	([SourceCodeID])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblProductSourceCode]
	WITH NOCHECK
	ADD CONSTRAINT [fk_ProdSourceCode]
	FOREIGN KEY ([ProductID]) REFERENCES [apexsql].[codProducts] ([ProductID])
ALTER TABLE [apexsql].[tblProductSourceCode]
	CHECK CONSTRAINT [fk_ProdSourceCode]

GO
EXEC sp_bindefault @defname=N'[apexsql].[UD_DefaultDate]', @objname=N'[apexsql].[tblProductSourceCode].[PostedDate]'
GO
ALTER TABLE [apexsql].[tblProductSourceCode] SET (LOCK_ESCALATION = TABLE)
GO
