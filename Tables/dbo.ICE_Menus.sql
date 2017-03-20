SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Menus] (
		[Menu_ID]            [int] IDENTITY(1, 1) NOT NULL,
		[Menu_Name]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Menu_Link]          [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Parent_Menu_ID]     [int] NULL,
		[User_Group_IDs]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Sort_No]            [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Menus]
	ADD
	CONSTRAINT [PK_ICE_Menus]
	PRIMARY KEY
	CLUSTERED
	([Menu_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Menus] SET (LOCK_ESCALATION = TABLE)
GO
