SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Logs] (
		[ID]              [int] IDENTITY(1, 1) NOT NULL,
		[Dated]           [datetime] NOT NULL,
		[Source]          [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Error]           [tinyint] NULL,
		[Description]     [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Logs]
	ADD
	CONSTRAINT [PK_ICE_Logs]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Logs] SET (LOCK_ESCALATION = TABLE)
GO
