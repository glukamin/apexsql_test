SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Mailing_List_Item] (
		[Mailing_List_Item_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Mailing_List]             [int] NOT NULL,
		[First_Name]               [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Name]                [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]                    [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Mailing_List_Item]
	ADD
	CONSTRAINT [PK_ICE_Mailing_List_Item]
	PRIMARY KEY
	CLUSTERED
	([Mailing_List_Item_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Mailing_List_Item] SET (LOCK_ESCALATION = TABLE)
GO
