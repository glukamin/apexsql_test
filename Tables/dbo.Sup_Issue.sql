SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sup_Issue] (
		[Issue_ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[User_Info]                  [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[User_ID]                    [int] NULL,
		[Date_Reported]              [datetime] NOT NULL,
		[Person_In_Charge]           [int] NOT NULL,
		[Forum_Link]                 [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]                [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Received_Via_ID]            [int] NOT NULL,
		[Date_Posted]                [datetime] NULL,
		[Date_Resolved]              [datetime] NULL,
		[Current_Status_ID]          [int] NOT NULL,
		[Notification_Status_ID]     [int] NOT NULL,
		[Priority_ID]                [int] NOT NULL,
		[Date_Modified]              [datetime] NULL,
		[Modified_By]                [int] NULL,
		[Rate]                       [int] NULL,
		[Comment]                    [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Issue]
	ADD
	CONSTRAINT [PK_Sup_Issue]
	PRIMARY KEY
	CLUSTERED
	([Issue_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Issue]
	WITH CHECK
	ADD CONSTRAINT [FK_Sup_Issue_Sup_Current_Status]
	FOREIGN KEY ([Current_Status_ID]) REFERENCES [dbo].[Sup_Current_Status] ([Current_Status_ID])
ALTER TABLE [dbo].[Sup_Issue]
	CHECK CONSTRAINT [FK_Sup_Issue_Sup_Current_Status]

GO
ALTER TABLE [dbo].[Sup_Issue]
	WITH CHECK
	ADD CONSTRAINT [FK_Sup_Issue_Sup_Notification_Status]
	FOREIGN KEY ([Notification_Status_ID]) REFERENCES [dbo].[Sup_Notification_Status] ([Notification_Status_ID])
ALTER TABLE [dbo].[Sup_Issue]
	CHECK CONSTRAINT [FK_Sup_Issue_Sup_Notification_Status]

GO
ALTER TABLE [dbo].[Sup_Issue]
	WITH CHECK
	ADD CONSTRAINT [FK_Sup_Issue_Sup_Priority]
	FOREIGN KEY ([Priority_ID]) REFERENCES [dbo].[Sup_Priority] ([Priority_ID])
ALTER TABLE [dbo].[Sup_Issue]
	CHECK CONSTRAINT [FK_Sup_Issue_Sup_Priority]

GO
ALTER TABLE [dbo].[Sup_Issue]
	WITH CHECK
	ADD CONSTRAINT [FK_Sup_Issue_Sup_Recieved_Via]
	FOREIGN KEY ([Received_Via_ID]) REFERENCES [dbo].[Sup_Recieved_Via] ([Received_Via_ID])
ALTER TABLE [dbo].[Sup_Issue]
	CHECK CONSTRAINT [FK_Sup_Issue_Sup_Recieved_Via]

GO
ALTER TABLE [dbo].[Sup_Issue]
	WITH CHECK
	ADD CONSTRAINT [FK_Sup_Issue_Sup_Support_Person]
	FOREIGN KEY ([Person_In_Charge]) REFERENCES [dbo].[Sup_Support_Person] ([User_Forum_ID])
ALTER TABLE [dbo].[Sup_Issue]
	CHECK CONSTRAINT [FK_Sup_Issue_Sup_Support_Person]

GO
ALTER TABLE [dbo].[Sup_Issue] SET (LOCK_ESCALATION = TABLE)
GO
