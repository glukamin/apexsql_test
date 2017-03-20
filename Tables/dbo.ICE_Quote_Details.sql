SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Quote_Details] (
		[Quote_Detail_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Quote_ID]            [int] NOT NULL,
		[Product_ID]          [int] NOT NULL,
		[Qty]                 [int] NOT NULL,
		[Price]               [money] NULL,
		[CD]                  [tinyint] NULL,
		[CDCharge]            [money] NULL,
		[Coupon]              [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Discount]            [money] NULL,
		[Total]               [money] NULL,
		[Maintenance_ID]      [int] NULL,
		[License_Type_ID]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	ADD
	CONSTRAINT [PK_ICE_Quote_Details]
	PRIMARY KEY
	CLUSTERED
	([Quote_Detail_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	ADD
	CONSTRAINT [DF_ICE_Quote_Details_CD]
	DEFAULT (0) FOR [CD]
GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	ADD
	CONSTRAINT [DF_ICE_Quote_Details_Discount]
	DEFAULT (0) FOR [Discount]
GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	ADD
	CONSTRAINT [DF_ICE_Quote_Details_Price]
	DEFAULT (0) FOR [Price]
GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	ADD
	CONSTRAINT [DF_ICE_Quote_Details_Total]
	DEFAULT (0) FOR [Total]
GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Details_ICE_License_Types]
	FOREIGN KEY ([License_Type_ID]) REFERENCES [dbo].[ICE_License_Types] ([License_Type_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Details_ICE_License_Types]

GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Details_ICE_Maintenances]
	FOREIGN KEY ([Maintenance_ID]) REFERENCES [dbo].[ICE_Maintenances] ([Maintenance_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Details_ICE_Maintenances]

GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Details_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Details_ICE_Products]

GO
ALTER TABLE [dbo].[ICE_Quote_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Details_ICE_Quotes]
	FOREIGN KEY ([Quote_ID]) REFERENCES [dbo].[ICE_Quotes] ([Quote_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Details_ICE_Quotes]

GO
ALTER TABLE [dbo].[ICE_Quote_Details] SET (LOCK_ESCALATION = TABLE)
GO
