SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPMMessage] (
		[PM_ID]               [int] IDENTITY(1, 1) NOT NULL,
		[Author_ID]           [int] NOT NULL,
		[From_ID]             [int] NOT NULL,
		[PM_Tittle]           [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[PM_Message]          [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[PM_Message_Date]     [datetime] NOT NULL,
		[Read_Post]           [bit] NOT NULL,
		[Email_notify]        [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPMMessage]
	ADD
	CONSTRAINT [PK__tblPMMessage__08AB2BC8]
	PRIMARY KEY
	CLUSTERED
	([PM_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPMMessage]
	ADD
	CONSTRAINT [DF__tblPMMess__Email__0B879873]
	DEFAULT (0) FOR [Email_notify]
GO
ALTER TABLE [dbo].[tblPMMessage]
	ADD
	CONSTRAINT [DF__tblPMMess__PM_Me__099F5001]
	DEFAULT (getdate()) FOR [PM_Message_Date]
GO
ALTER TABLE [dbo].[tblPMMessage]
	ADD
	CONSTRAINT [DF__tblPMMess__Read___0A93743A]
	DEFAULT (0) FOR [Read_Post]
GO
ALTER TABLE [dbo].[tblPMMessage]
	WITH CHECK
	ADD CONSTRAINT [tblPMMessage_FK00]
	FOREIGN KEY ([From_ID]) REFERENCES [dbo].[tblAuthor] ([Author_ID])
ALTER TABLE [dbo].[tblPMMessage]
	CHECK CONSTRAINT [tblPMMessage_FK00]

GO
CREATE NONCLUSTERED INDEX [Auhor_ID]
	ON [dbo].[tblPMMessage] ([Author_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [From_ID]
	ON [dbo].[tblPMMessage] ([From_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Message_ID]
	ON [dbo].[tblPMMessage] ([PM_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblAuthortblPMMessage]
	ON [dbo].[tblPMMessage] ([From_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPMMessage] SET (LOCK_ESCALATION = TABLE)
GO
