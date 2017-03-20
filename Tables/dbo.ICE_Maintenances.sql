SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Maintenances] (
		[Maintenance_ID]     [int] NOT NULL,
		[Maintenance]        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Percentage]         [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Maintenances]
	ADD
	CONSTRAINT [PK_ICE_Maintenances]
	PRIMARY KEY
	CLUSTERED
	([Maintenance_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Maintenances] SET (LOCK_ESCALATION = TABLE)
GO
