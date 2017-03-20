SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_License_Types] (
		[License_Type_ID]     [int] NOT NULL,
		[License_Type]        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Activations]         [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_License_Types]
	ADD
	CONSTRAINT [PK_ICE_License_Types]
	PRIMARY KEY
	CLUSTERED
	([License_Type_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_License_Types] SET (LOCK_ESCALATION = TABLE)
GO
