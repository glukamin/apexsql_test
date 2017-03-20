SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmailQueue] (
		[Email_Queue_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Email_Body]          [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Recepient_Name]      [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Recepient_Email]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[From_Name]           [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[From_Email]          [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Subject]             [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Is_Html]             [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailQueue]
	ADD
	CONSTRAINT [PK_tblEmailQueue]
	PRIMARY KEY
	CLUSTERED
	([Email_Queue_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailQueue]
	ADD
	CONSTRAINT [DF_tblEmailQueue_Email_Body]
	DEFAULT ('') FOR [Email_Body]
GO
ALTER TABLE [dbo].[tblEmailQueue] SET (LOCK_ESCALATION = TABLE)
GO
