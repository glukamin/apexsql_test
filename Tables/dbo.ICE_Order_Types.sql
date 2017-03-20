SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Order_Types] (
		[Order_Type_ID]     [tinyint] NOT NULL,
		[Type]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Order_Types]
	ADD
	CONSTRAINT [PK_Order_Types]
	PRIMARY KEY
	CLUSTERED
	([Order_Type_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Order_Types] SET (LOCK_ESCALATION = TABLE)
GO
