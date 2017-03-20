SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Post_Download_Status] (
		[Post_Download_Status_ID]     [int] NOT NULL,
		[Status]                      [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Post_Download_Status]
	ADD
	CONSTRAINT [PK_ICE_Post_Download_Status]
	PRIMARY KEY
	CLUSTERED
	([Post_Download_Status_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Post_Download_Status] SET (LOCK_ESCALATION = TABLE)
GO
