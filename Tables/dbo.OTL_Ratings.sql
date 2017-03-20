SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OTL_Ratings] (
		[Id]             [int] IDENTITY(1, 1) NOT NULL,
		[UserId]         [int] NULL,
		[TemplateId]     [numeric](18, 0) NULL,
		[Rating]         [decimal](5, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Ratings]
	ADD
	CONSTRAINT [PK_OTL_UserTemplateRating]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Ratings]
	WITH CHECK
	ADD CONSTRAINT [FK_OTL_Ratings_OTL_Templates]
	FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[OTL_Templates] ([Id])
	ON DELETE CASCADE
ALTER TABLE [dbo].[OTL_Ratings]
	CHECK CONSTRAINT [FK_OTL_Ratings_OTL_Templates]

GO
ALTER TABLE [dbo].[OTL_Ratings]
	WITH CHECK
	ADD CONSTRAINT [FK_OTL_Ratings_tblAuthor]
	FOREIGN KEY ([UserId]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
ALTER TABLE [dbo].[OTL_Ratings]
	CHECK CONSTRAINT [FK_OTL_Ratings_tblAuthor]

GO
ALTER TABLE [dbo].[OTL_Ratings] SET (LOCK_ESCALATION = TABLE)
GO
