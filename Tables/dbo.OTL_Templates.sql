SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTL_Templates] (
		[Id]                    [numeric](18, 0) IDENTITY(1, 1) NOT NULL,
		[UserId]                [int] NULL,
		[TemplateFileName]      [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ArchiveFileName]       [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ProjectTypeId]         [int] NOT NULL,
		[DatabaseTypeId]        [int] NULL,
		[OutputTypeId]          [int] NULL,
		[ApplicationTypeId]     [int] NULL,
		[Title]                 [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ShortDesc]             [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LongDesc]              [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Copyright]             [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ScriptLanguage]        [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[OutputLanguage]        [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DownloadCount]         [int] NULL,
		[ViewCount]             [int] NULL,
		[LinesCount]            [int] NULL,
		[DiscussionLink]        [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DateLoaded]            [datetime] NULL,
		[DateUpdated]           [datetime] NULL,
		[Status]                [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Templates]
	ADD
	CONSTRAINT [PK_OTL_UserToTemplates]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[OTL_Templates]
	ADD
	CONSTRAINT [DF_OTL_Templates_DownloadCount]
	DEFAULT ((0)) FOR [DownloadCount]
GO
ALTER TABLE [dbo].[OTL_Templates]
	ADD
	CONSTRAINT [DF_OTL_Templates_ProjectTypeId]
	DEFAULT ((1)) FOR [ProjectTypeId]
GO
ALTER TABLE [dbo].[OTL_Templates]
	ADD
	CONSTRAINT [DF_OTL_Templates_Status]
	DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[OTL_Templates]
	ADD
	CONSTRAINT [DF_OTL_Templates_ViewCount]
	DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[OTL_Templates]
	ADD
	CONSTRAINT [DF_OTL_UserToTemplates_DateLoaded]
	DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [dbo].[OTL_Templates]
	WITH CHECK
	ADD CONSTRAINT [FK_OTL_Templates_OTL_ApplicationTypes]
	FOREIGN KEY ([ApplicationTypeId]) REFERENCES [dbo].[OTL_ApplicationTypes] ([Id])
ALTER TABLE [dbo].[OTL_Templates]
	CHECK CONSTRAINT [FK_OTL_Templates_OTL_ApplicationTypes]

GO
ALTER TABLE [dbo].[OTL_Templates]
	WITH CHECK
	ADD CONSTRAINT [FK_OTL_Templates_OTL_DatabaseTypes]
	FOREIGN KEY ([DatabaseTypeId]) REFERENCES [dbo].[OTL_DatabaseTypes] ([Id])
ALTER TABLE [dbo].[OTL_Templates]
	CHECK CONSTRAINT [FK_OTL_Templates_OTL_DatabaseTypes]

GO
ALTER TABLE [dbo].[OTL_Templates]
	WITH CHECK
	ADD CONSTRAINT [FK_OTL_Templates_OTL_OutputTypes]
	FOREIGN KEY ([OutputTypeId]) REFERENCES [dbo].[OTL_OutputTypes] ([Id])
ALTER TABLE [dbo].[OTL_Templates]
	CHECK CONSTRAINT [FK_OTL_Templates_OTL_OutputTypes]

GO
ALTER TABLE [dbo].[OTL_Templates]
	WITH CHECK
	ADD CONSTRAINT [FK_OTL_Templates_tblAuthor]
	FOREIGN KEY ([UserId]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
ALTER TABLE [dbo].[OTL_Templates]
	CHECK CONSTRAINT [FK_OTL_Templates_tblAuthor]

GO
ALTER TABLE [dbo].[OTL_Templates] SET (LOCK_ESCALATION = TABLE)
GO
