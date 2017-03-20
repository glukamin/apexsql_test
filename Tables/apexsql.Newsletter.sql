SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [apexsql].[Newsletter] (
		[UserEmail]       [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[CreatedOn]       [smalldatetime] NULL,
		[Status]          [bit] NULL,
		[ProcessFlag]     [bit] NULL,
		CONSTRAINT [IX_Newsletter]
		UNIQUE
		NONCLUSTERED
		([UserEmail])
		ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[Newsletter]
	ADD
	CONSTRAINT [DF__Newslette__Creat__46D27B73]
	DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [apexsql].[Newsletter]
	ADD
	CONSTRAINT [DF__newslette__Proce__5EAA0504]
	DEFAULT ((0)) FOR [ProcessFlag]
GO
ALTER TABLE [apexsql].[Newsletter]
	ADD
	CONSTRAINT [DF__Newslette__Statu__47C69FAC]
	DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [apexsql].[Newsletter] SET (LOCK_ESCALATION = TABLE)
GO
