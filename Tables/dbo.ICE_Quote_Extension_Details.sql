SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Quote_Extension_Details] (
		[Extension_Detail_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Quote_ID]                      [int] NOT NULL,
		[Extension_Order_Detail_ID]     [int] NOT NULL,
		[Product_ID]                    [int] NOT NULL,
		[Qty]                           [int] NOT NULL,
		[Maintenance_ID]                [int] NULL,
		[Price]                         [money] NULL,
		[Coupon]                        [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Discount]                      [money] NULL,
		[Total]                         [money] NULL,
		[Extension_Expiry]              [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Maintenances]
	FOREIGN KEY ([Maintenance_ID]) REFERENCES [dbo].[ICE_Maintenances] ([Maintenance_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Maintenances]

GO
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Order_Details]
	FOREIGN KEY ([Extension_Order_Detail_ID]) REFERENCES [dbo].[ICE_Order_Details] ([Order_Detail_Id])
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Order_Details]

GO
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Products]

GO
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Quotes]
	FOREIGN KEY ([Quote_ID]) REFERENCES [dbo].[ICE_Quotes] ([Quote_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quote_Extension_Details]
	CHECK CONSTRAINT [FK_ICE_Quote_Extension_Details_ICE_Quotes]

GO
ALTER TABLE [dbo].[ICE_Quote_Extension_Details] SET (LOCK_ESCALATION = TABLE)
GO
