SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory] (
		[Cat_ID]        [smallint] IDENTITY(1, 1) NOT NULL,
		[Cat_name]      [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Cat_order]     [smallint] NOT NULL,
		[Image]         [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCategory]
	ADD
	CONSTRAINT [PK__tblCategory__70D3A237]
	PRIMARY KEY
	CLUSTERED
	([Cat_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCategory]
	ADD
	CONSTRAINT [DF__tblCatego__Cat_o__71C7C670]
	DEFAULT (1) FOR [Cat_order]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Cat_ID]
	ON [dbo].[tblCategory] ([Cat_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCategory] SET (LOCK_ESCALATION = TABLE)
GO
