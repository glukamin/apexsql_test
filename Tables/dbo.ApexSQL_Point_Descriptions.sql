SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApexSQL_Point_Descriptions] (
		[Reason_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Reason_Name]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApexSQL_Point_Descriptions]
	ADD
	CONSTRAINT [PK_ApexSQL_Point_Descriptions]
	PRIMARY KEY
	CLUSTERED
	([Reason_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApexSQL_Point_Descriptions] SET (LOCK_ESCALATION = TABLE)
GO
