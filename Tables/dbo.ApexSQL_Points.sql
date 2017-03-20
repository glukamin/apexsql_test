SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApexSQL_Points] (
		[Points_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Points]        [int] NOT NULL,
		[Date]          [datetime] NOT NULL,
		[Reason_ID]     [int] NOT NULL,
		[User_ID]       [int] NOT NULL,
		[Comment]       [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Admin_ID]      [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApexSQL_Points]
	ADD
	CONSTRAINT [PK_ApexSQL_Points]
	PRIMARY KEY
	CLUSTERED
	([Points_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApexSQL_Points]
	WITH CHECK
	ADD CONSTRAINT [FK_ApexSQL_Points_ApexSQL_Point_Descriptions]
	FOREIGN KEY ([Reason_ID]) REFERENCES [dbo].[ApexSQL_Point_Descriptions] ([Reason_ID])
ALTER TABLE [dbo].[ApexSQL_Points]
	CHECK CONSTRAINT [FK_ApexSQL_Points_ApexSQL_Point_Descriptions]

GO
ALTER TABLE [dbo].[ApexSQL_Points] SET (LOCK_ESCALATION = TABLE)
GO
