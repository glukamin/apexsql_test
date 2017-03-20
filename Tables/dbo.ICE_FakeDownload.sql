SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_FakeDownload] (
		[DownloadID]       [int] IDENTITY(1, 1) NOT NULL,
		[AuthorID]         [int] NOT NULL,
		[ProductID]        [int] NOT NULL,
		[DownloadDate]     [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_FakeDownload]
	ADD
	CONSTRAINT [PK__ICE_Fake__73D5A71086DF2CCA]
	PRIMARY KEY
	CLUSTERED
	([DownloadID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_FakeDownload]
	WITH CHECK
	ADD CONSTRAINT [FK_AuthorID]
	FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[ICE_FakeAuthor] ([AuthorID])
ALTER TABLE [dbo].[ICE_FakeDownload]
	CHECK CONSTRAINT [FK_AuthorID]

GO
ALTER TABLE [dbo].[ICE_FakeDownload]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
ALTER TABLE [dbo].[ICE_FakeDownload]
	CHECK CONSTRAINT [FK_ProductID]

GO
ALTER TABLE [dbo].[ICE_FakeDownload] SET (LOCK_ESCALATION = TABLE)
GO
