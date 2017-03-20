SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_FakeAuthor] (
		[AuthorID]                   [int] IDENTITY(1, 1) NOT NULL,
		[RealName]                   [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]                      [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DateAdded]                  [datetime] NULL,
		[FirstDownloadedProduct]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_FakeAuthor]
	ADD
	CONSTRAINT [PK__ICE_Fake__70DAFC14586A4F8D]
	PRIMARY KEY
	CLUSTERED
	([AuthorID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_FakeAuthor] SET (LOCK_ESCALATION = TABLE)
GO
