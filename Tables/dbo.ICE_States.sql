SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_States] (
		[State_Name]     [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[State_Code]     [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Sort_No]        [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_States]
	ADD
	CONSTRAINT [PK_ICE_States]
	PRIMARY KEY
	CLUSTERED
	([State_Name])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_States] SET (LOCK_ESCALATION = TABLE)
GO
