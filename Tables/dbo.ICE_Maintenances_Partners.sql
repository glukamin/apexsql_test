SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Maintenances_Partners] (
		[Product_ID]         [int] NOT NULL,
		[Maintenance_ID]     [int] NOT NULL,
		[Maintenance]        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Percentage]         [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Maintenances_Partners]
	ADD
	CONSTRAINT [PK_ICE_Maintenances_Partners]
	PRIMARY KEY
	CLUSTERED
	([Product_ID], [Maintenance_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Maintenances_Partners] SET (LOCK_ESCALATION = TABLE)
GO
