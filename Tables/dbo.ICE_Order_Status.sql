SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Order_Status] (
		[Order_Status_ID]     [int] NOT NULL,
		[Status]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Order_Status]
	ADD
	CONSTRAINT [PK_Order_Status]
	PRIMARY KEY
	CLUSTERED
	([Order_Status_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Order_Status] SET (LOCK_ESCALATION = TABLE)
GO
