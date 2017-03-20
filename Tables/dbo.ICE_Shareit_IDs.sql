SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_Shareit_IDs] (
		[Shareit_ID]          [int] NOT NULL,
		[Product_ID]          [int] NOT NULL,
		[License_Type_ID]     [int] NOT NULL,
		[Maintenance_ID]      [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	ADD
	CONSTRAINT [PK_ICE_ShareItIDs]
	PRIMARY KEY
	CLUSTERED
	([Shareit_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Shareit_IDs_ICE_License_Types]
	FOREIGN KEY ([License_Type_ID]) REFERENCES [dbo].[ICE_License_Types] ([License_Type_ID])
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	CHECK CONSTRAINT [FK_ICE_Shareit_IDs_ICE_License_Types]

GO
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Shareit_IDs_ICE_Maintenances]
	FOREIGN KEY ([Maintenance_ID]) REFERENCES [dbo].[ICE_Maintenances] ([Maintenance_ID])
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	CHECK CONSTRAINT [FK_ICE_Shareit_IDs_ICE_Maintenances]

GO
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Shareit_IDs_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[ICE_Shareit_IDs]
	CHECK CONSTRAINT [FK_ICE_Shareit_IDs_ICE_Products]

GO
CREATE NONCLUSTERED INDEX [IX_ICE_Shareit_IDs]
	ON [dbo].[ICE_Shareit_IDs] ([Product_ID], [License_Type_ID], [Maintenance_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Shareit_IDs] SET (LOCK_ESCALATION = TABLE)
GO
