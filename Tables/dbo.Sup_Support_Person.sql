SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Sup_Support_Person] (
		[User_Forum_ID]     [int] NOT NULL,
		[Display]           [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Support_Person]
	ADD
	CONSTRAINT [PK_Sup_Support_Person]
	PRIMARY KEY
	CLUSTERED
	([User_Forum_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Support_Person] SET (LOCK_ESCALATION = TABLE)
GO
