SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_Downloads] (
		[Download_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Sales_Lead_Id]     [int] NOT NULL,
		[Download_Date]     [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Downloads]
	ADD
	CONSTRAINT [PK_ICE_Downloads_1]
	PRIMARY KEY
	CLUSTERED
	([Download_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Downloads]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Downloads_ICE_SalesLeads]
	FOREIGN KEY ([Sales_Lead_Id]) REFERENCES [dbo].[ICE_SalesLeads] ([SalesLeadId])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Downloads]
	CHECK CONSTRAINT [FK_ICE_Downloads_ICE_SalesLeads]

GO
ALTER TABLE [dbo].[ICE_Downloads] SET (LOCK_ESCALATION = TABLE)
GO
