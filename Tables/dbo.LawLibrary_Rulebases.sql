SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LawLibrary_Rulebases] (
		[Id]                 [int] IDENTITY(1, 1) NOT NULL,
		[Name]               [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FileName]           [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Version]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[UserId]             [int] NOT NULL,
		[Code]               [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AuthorName]         [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AuthorCompany]      [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AuthorLegal]        [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RulesCount]         [int] NOT NULL,
		[Status]             [int] NULL,
		[Downloads]          [bigint] NULL,
		[Views]              [bigint] NULL,
		[DateLoaded]         [datetime] NULL,
		[DateUpdated]        [datetime] NULL,
		[DiscussionLink]     [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[LawLibrary_Rulebases]
	ADD
	CONSTRAINT [PK_Rulebases]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[LawLibrary_Rulebases]
	ADD
	CONSTRAINT [DF_LawLibrary_Rulebases_RulesCount]
	DEFAULT ((0)) FOR [RulesCount]
GO
ALTER TABLE [dbo].[LawLibrary_Rulebases] SET (LOCK_ESCALATION = TABLE)
GO
