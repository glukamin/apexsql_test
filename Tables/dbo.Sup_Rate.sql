SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sup_Rate] (
		[Rate_ID]        [int] IDENTITY(1, 1) NOT NULL,
		[Issue_ID]       [int] NOT NULL,
		[Quality]        [int] NOT NULL,
		[Comment]        [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Manager_ID]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Rate]
	ADD
	CONSTRAINT [PK_Sup_Rate]
	PRIMARY KEY
	CLUSTERED
	([Rate_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sup_Rate]
	WITH CHECK
	ADD CONSTRAINT [FK_Sup_Rate_Sup_Issue]
	FOREIGN KEY ([Issue_ID]) REFERENCES [dbo].[Sup_Issue] ([Issue_ID])
ALTER TABLE [dbo].[Sup_Rate]
	CHECK CONSTRAINT [FK_Sup_Rate_Sup_Issue]

GO
ALTER TABLE [dbo].[Sup_Rate] SET (LOCK_ESCALATION = TABLE)
GO
