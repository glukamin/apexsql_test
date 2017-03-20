SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Web_Pages] (
		[Page_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Page_Path]         [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Page_Group_ID]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Pages]
	ADD
	CONSTRAINT [PK_ICE_Web_Pages]
	PRIMARY KEY
	CLUSTERED
	([Page_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Pages]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Web_Pages_ICE_Web_Page_Groups]
	FOREIGN KEY ([Page_Group_ID]) REFERENCES [dbo].[ICE_Web_Page_Groups] ([Page_Group_ID])
ALTER TABLE [dbo].[ICE_Web_Pages]
	CHECK CONSTRAINT [FK_ICE_Web_Pages_ICE_Web_Page_Groups]

GO
CREATE NONCLUSTERED INDEX [IX_Page_Path]
	ON [dbo].[ICE_Web_Pages] ([Page_Path])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Pages] SET (LOCK_ESCALATION = TABLE)
GO
