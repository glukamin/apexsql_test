SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Order_Details] (
		[Order_Detail_Id]                  [int] IDENTITY(12000, 1) NOT NULL,
		[Order_ID]                         [int] NOT NULL,
		[Product_ID]                       [int] NOT NULL,
		[Qty]                              [int] NOT NULL,
		[Total]                            [money] NULL,
		[CD]                               [tinyint] NULL,
		[Discount]                         [money] NULL,
		[Price]                            [money] NULL,
		[ShareIt_Running_No]               [int] NULL,
		[Coupon_ID]                        [int] NULL,
		[CDCharge]                         [money] NULL,
		[Coupon]                           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[License_Type_ID]                  [int] NOT NULL,
		[Maintenance_ID]                   [int] NOT NULL,
		[RenewalEmailConfirmationSent]     [tinyint] NULL,
		[Expiry_Date]                      [datetime] NULL,
		[Is_Community_Edition]             [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Order_Details]
	ADD
	CONSTRAINT [PK_ICE_Order_Details]
	PRIMARY KEY
	CLUSTERED
	([Order_Detail_Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Order_Details]
	ADD
	CONSTRAINT [DF_ICE_Order_Details_CD]
	DEFAULT (0) FOR [CD]
GO
ALTER TABLE [dbo].[ICE_Order_Details]
	ADD
	CONSTRAINT [DF_ICE_Order_Details_Discount]
	DEFAULT (0) FOR [Discount]
GO
ALTER TABLE [dbo].[ICE_Order_Details]
	ADD
	CONSTRAINT [DF_ICE_Order_Details_Price]
	DEFAULT (0) FOR [Price]
GO
ALTER TABLE [dbo].[ICE_Order_Details]
	ADD
	CONSTRAINT [DF_ICE_Order_Details_Total]
	DEFAULT (0) FOR [Total]
GO
ALTER TABLE [dbo].[ICE_Order_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Order_Details_ICE_Orders]
	FOREIGN KEY ([Order_ID]) REFERENCES [dbo].[ICE_Orders] ([Order_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Order_Details]
	CHECK CONSTRAINT [FK_ICE_Order_Details_ICE_Orders]

GO
ALTER TABLE [dbo].[ICE_Order_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Order_Details_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Order_Details]
	CHECK CONSTRAINT [FK_ICE_Order_Details_ICE_Products]

GO
ALTER TABLE [dbo].[ICE_Order_Details] SET (LOCK_ESCALATION = TABLE)
GO
