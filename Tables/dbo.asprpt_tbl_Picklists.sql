SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asprpt_tbl_Picklists] (
		[PicklistID]          [int] IDENTITY(1, 1) NOT NULL,
		[ProcID]              [int] NOT NULL,
		[ViewParam]           [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ResultParam]         [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ReturnDataTypes]     [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Picklists]
	ADD
	CONSTRAINT [PK_asprpt_tbl_Picklists]
	PRIMARY KEY
	CLUSTERED
	([PicklistID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[asprpt_tbl_Picklists]
	WITH CHECK
	ADD CONSTRAINT [FK_asprpt_tbl_Picklists_asprpt_tbl_Proc]
	FOREIGN KEY ([ProcID]) REFERENCES [dbo].[asprpt_tbl_Proc] ([ProcedureID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[asprpt_tbl_Picklists]
	CHECK CONSTRAINT [FK_asprpt_tbl_Picklists_asprpt_tbl_Proc]

GO
ALTER TABLE [dbo].[asprpt_tbl_Picklists] SET (LOCK_ESCALATION = TABLE)
GO
