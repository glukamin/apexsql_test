SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBanList] (
		[Ban_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[IP]         [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]      [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBanList]
	ADD
	CONSTRAINT [PK__tblBanList__2B0043CC]
	PRIMARY KEY
	CLUSTERED
	([Ban_ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Ban_ID]
	ON [dbo].[tblBanList] ([Ban_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBanList] SET (LOCK_ESCALATION = TABLE)
GO
