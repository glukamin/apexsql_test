SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPostRate] (
		[Thread_ID]      [int] NOT NULL,
		[Rate]           [int] NOT NULL,
		[Rated_Date]     [datetime] NOT NULL,
		[Rated_By]       [int] NOT NULL,
		[Comment]        [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPostRate]
	ADD
	CONSTRAINT [PK_tblPostRate]
	PRIMARY KEY
	CLUSTERED
	([Thread_ID], [Rated_By])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPostRate]
	WITH CHECK
	ADD CONSTRAINT [FK_tblPostRate_tblThread]
	FOREIGN KEY ([Thread_ID]) REFERENCES [dbo].[tblThread] ([Thread_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[tblPostRate]
	CHECK CONSTRAINT [FK_tblPostRate_tblThread]

GO
ALTER TABLE [dbo].[tblPostRate] SET (LOCK_ESCALATION = TABLE)
GO
