SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[tblDownloads] (
		[DownloadID]       [int] IDENTITY(1, 1) NOT NULL,
		[UserID]           [int] NOT NULL,
		[ProductID]        [int] NOT NULL,
		[DownloadDate]     [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblDownloads]
	ADD
	CONSTRAINT [tblDownloads_DownloadID_PK]
	PRIMARY KEY
	NONCLUSTERED
	([DownloadID])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblDownloads]
	ADD
	CONSTRAINT [DF__tblDownlo__Downl__420DC656]
	DEFAULT (getdate()) FOR [DownloadDate]
GO
ALTER TABLE [apexsql].[tblDownloads]
	WITH NOCHECK
	ADD CONSTRAINT [tblDownloads_ProductID_codProducts_FK]
	FOREIGN KEY ([ProductID]) REFERENCES [apexsql].[codProducts] ([ProductID])
ALTER TABLE [apexsql].[tblDownloads]
	CHECK CONSTRAINT [tblDownloads_ProductID_codProducts_FK]

GO
ALTER TABLE [apexsql].[tblDownloads] SET (LOCK_ESCALATION = TABLE)
GO
