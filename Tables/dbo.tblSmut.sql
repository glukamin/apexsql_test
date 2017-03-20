SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSmut] (
		[ID_no]            [int] IDENTITY(1, 1) NOT NULL,
		[Smut]             [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Word_replace]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSmut]
	ADD
	CONSTRAINT [PK__tblSmut__2917FB5A]
	PRIMARY KEY
	CLUSTERED
	([ID_no])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSmut] SET (LOCK_ESCALATION = TABLE)
GO
