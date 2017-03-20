SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[audit_demo_categories] (
		[CategoryID]       [int] IDENTITY(1, 1) NOT NULL,
		[CategoryName]     [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description]      [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Picture]          [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[audit_demo_categories]
	ADD
	CONSTRAINT [PK_audit_demo_categories]
	PRIMARY KEY
	CLUSTERED
	([CategoryID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CategoryName]
	ON [dbo].[audit_demo_categories] ([CategoryName])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[audit_demo_categories] SET (LOCK_ESCALATION = TABLE)
GO
