SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Customer_Comments] (
		[ID]          [int] IDENTITY(1, 1) NOT NULL,
		[Cust_ID]     [int] NOT NULL,
		[Comment]     [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Dated]       [datetime] NOT NULL,
		[User_ID]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Customer_Comments]
	ADD
	CONSTRAINT [PK_Customer_Comments]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Customer_Comments]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Customer_Comments_ICE_Customers]
	FOREIGN KEY ([Cust_ID]) REFERENCES [dbo].[ICE_Customers] ([Cust_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Customer_Comments]
	CHECK CONSTRAINT [FK_ICE_Customer_Comments_ICE_Customers]

GO
ALTER TABLE [dbo].[ICE_Customer_Comments]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Customer_Comments_ICE_Users]
	FOREIGN KEY ([User_ID]) REFERENCES [dbo].[ICE_Users] ([User_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Customer_Comments]
	CHECK CONSTRAINT [FK_ICE_Customer_Comments_ICE_Users]

GO
ALTER TABLE [dbo].[ICE_Customer_Comments] SET (LOCK_ESCALATION = TABLE)
GO
