SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Countries] (
		[Country_Name]     [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Country_Code]     [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Sort_No]          [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Countries]
	ADD
	CONSTRAINT [PK_ICE_Countries]
	PRIMARY KEY
	CLUSTERED
	([Country_Name])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Countries] SET (LOCK_ESCALATION = TABLE)
GO
