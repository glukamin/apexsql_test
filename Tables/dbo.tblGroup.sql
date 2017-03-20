SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGroup] (
		[Group_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Name]               [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Minimum_posts]      [int] NOT NULL,
		[Special_rank]       [bit] NOT NULL,
		[Stars]              [int] NOT NULL,
		[Custom_stars]       [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Starting_group]     [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGroup]
	ADD
	CONSTRAINT [PK__tblGroup__0836F5D3]
	PRIMARY KEY
	CLUSTERED
	([Group_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGroup]
	ADD
	CONSTRAINT [DF__tblGroup__Minimu__151102AD]
	DEFAULT ((0)) FOR [Minimum_posts]
GO
ALTER TABLE [dbo].[tblGroup]
	ADD
	CONSTRAINT [DF__tblGroup__Stars__160526E6]
	DEFAULT ((0)) FOR [Stars]
GO
ALTER TABLE [dbo].[tblGroup]
	ADD
	CONSTRAINT [DF__tblGroup__Starti__16F94B1F]
	DEFAULT ((0)) FOR [Starting_group]
GO
CREATE NONCLUSTERED INDEX [tblGroup_ID]
	ON [dbo].[tblGroup] ([Group_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGroup] SET (LOCK_ESCALATION = TABLE)
GO
