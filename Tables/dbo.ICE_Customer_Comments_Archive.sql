SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Customer_Comments_Archive] (
		[ID]          [int] IDENTITY(1, 1) NOT NULL,
		[Cust_ID]     [int] NOT NULL,
		[Comment]     [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Dated]       [datetime] NOT NULL,
		[User_ID]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Customer_Comments_Archive]
	ADD
	CONSTRAINT [PK_Customer_Comments_Archive]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Customer_Comments_Archive] SET (LOCK_ESCALATION = TABLE)
GO
