SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Proc] (
		[ProcedureID]              [int] IDENTITY(1, 1) NOT NULL,
		[Name]                     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Type]                     [tinyint] NOT NULL,
		[IsAvailableForReport]     [bit] NOT NULL,
		[ConnectionID]             [int] NULL,
		[Schema]                   [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Proc]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Proc]
	PRIMARY KEY
	CLUSTERED
	([ProcedureID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Proc]
	ADD
	CONSTRAINT [DF_asprpt_tbl_Proc_IsAvailableForReport]
	DEFAULT (1) FOR [IsAvailableForReport]
GO
ALTER TABLE [dbo].[asprpt_tbl_Proc]
	ADD
	CONSTRAINT [DF_asprpt_tbl_Proc_ProcReport]
	DEFAULT (0) FOR [Type]
GO
ALTER TABLE [dbo].[asprpt_tbl_Proc] SET (LOCK_ESCALATION = TABLE)
GO
