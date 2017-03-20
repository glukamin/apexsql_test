SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Web_Page_Groups] (
		[Page_Group_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Group_Name]        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Group_Score]       [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Page_Groups]
	ADD
	CONSTRAINT [PK_ICE_Page_Groups]
	PRIMARY KEY
	CLUSTERED
	([Page_Group_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Web_Page_Groups] SET (LOCK_ESCALATION = TABLE)
GO
