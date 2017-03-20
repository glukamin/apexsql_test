SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Page_Score] (
		[Page]      [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Score]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Page_Score]
	ADD
	CONSTRAINT [PK_ICE_Page_Score]
	PRIMARY KEY
	CLUSTERED
	([Page])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Page_Score] SET (LOCK_ESCALATION = TABLE)
GO