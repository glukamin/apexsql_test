SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_Product_Licenses] (
		[Product_License_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Product_ID]             [int] NOT NULL,
		[License_Count]          [int] NOT NULL,
		[License_Type_ID]        [int] NOT NULL,
		[Percentage]             [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Product_Licenses]
	ADD
	CONSTRAINT [PK_ICE_Product_Details]
	PRIMARY KEY
	CLUSTERED
	([Product_License_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Product_Licenses]
	ADD
	CONSTRAINT [DF_ICE_Product_Licenses_License_Type_ID]
	DEFAULT ((0)) FOR [License_Type_ID]
GO
ALTER TABLE [dbo].[ICE_Product_Licenses]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Product_Licenses_ICE_License_Types]
	FOREIGN KEY ([License_Type_ID]) REFERENCES [dbo].[ICE_License_Types] ([License_Type_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Product_Licenses]
	CHECK CONSTRAINT [FK_ICE_Product_Licenses_ICE_License_Types]

GO
ALTER TABLE [dbo].[ICE_Product_Licenses]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Product_Licenses_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Product_Licenses]
	CHECK CONSTRAINT [FK_ICE_Product_Licenses_ICE_Products]

GO
ALTER TABLE [dbo].[ICE_Product_Licenses] SET (LOCK_ESCALATION = TABLE)
GO
