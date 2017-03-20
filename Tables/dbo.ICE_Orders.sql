SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Orders] (
		[Order_ID]                         [int] IDENTITY(6000, 1) NOT NULL,
		[Order_Date]                       [datetime] NOT NULL,
		[Cust_ID]                          [int] NULL,
		[Last_Name]                        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[First_Name]                       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company]                          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email]                            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone]                            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fax]                              [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1]                         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2]                         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City]                             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State]                            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country]                          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip]                              [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total]                            [money] NULL,
		[PO]                               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Invoice]                          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reseller_ID]                      [int] NULL,
		[License_To]                       [tinyint] NULL,
		[Reg_Name]                         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Notes]                            [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Notes_External]                   [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Name_Ship]                   [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[First_Name_Ship]                  [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email_Ship]                       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Ship]                     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone_Ship]                       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fax_Ship]                         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1_Ship]                    [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2_Ship]                    [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City_Ship]                        [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State_Ship]                       [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country_Ship]                     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip_Ship]                         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Amount]                           [money] NULL,
		[Discount]                         [float] NULL,
		[Tax]                              [float] NULL,
		[ShareIt_Purchase_ID]              [int] NULL,
		[Paid_Date]                        [datetime] NULL,
		[Payment_Mode]                     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Check_No]                         [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Card_Type]                        [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Void_Date]                        [datetime] NULL,
		[Void_Reason]                      [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Sent_Email]                       [tinyint] NULL,
		[Refund_Date]                      [datetime] NULL,
		[Refund_Reason]                    [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Order_Status_ID]                  [int] NOT NULL,
		[Order_Type_ID]                    [tinyint] NOT NULL,
		[Bill_Ship]                        [tinyint] NULL,
		[Free_Upgrades]                    [tinyint] NULL,
		[Created_By]                       [int] NULL,
		[Create_Date]                      [datetime] NULL,
		[Edited_By]                        [int] NULL,
		[Edit_Date]                        [datetime] NULL,
		[Wire_Transfer]                    [tinyint] NULL,
		[Wire_Transfer_Amount]             [money] NULL,
		[CD_Ship_Date]                     [datetime] NULL,
		[RenewalEmailConfirmationSent]     [tinyint] NULL,
		[Sales_Person_ID]                  [int] NULL,
		[Country_Discount]                 [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [PK_ICE_Order]
	PRIMARY KEY
	CLUSTERED
	([Order_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [DF_ICE_Order_Total]
	DEFAULT (0) FOR [Total]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [DF_ICE_Orders_Amount]
	DEFAULT (0) FOR [Amount]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [DF_ICE_Orders_Discount]
	DEFAULT (0) FOR [Discount]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [DF_ICE_Orders_Order_Status_ID]
	DEFAULT (0) FOR [Order_Status_ID]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [DF_ICE_Orders_Order_Type_ID]
	DEFAULT (0) FOR [Order_Type_ID]
GO
ALTER TABLE [dbo].[ICE_Orders]
	ADD
	CONSTRAINT [DF_ICE_Orders_Tax]
	DEFAULT (0) FOR [Tax]
GO
ALTER TABLE [dbo].[ICE_Orders]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Orders_ICE_Order_Status]
	FOREIGN KEY ([Order_Status_ID]) REFERENCES [dbo].[ICE_Order_Status] ([Order_Status_ID])
ALTER TABLE [dbo].[ICE_Orders]
	CHECK CONSTRAINT [FK_ICE_Orders_ICE_Order_Status]

GO
ALTER TABLE [dbo].[ICE_Orders]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Orders_ICE_Order_Types]
	FOREIGN KEY ([Order_Type_ID]) REFERENCES [dbo].[ICE_Order_Types] ([Order_Type_ID])
ALTER TABLE [dbo].[ICE_Orders]
	CHECK CONSTRAINT [FK_ICE_Orders_ICE_Order_Types]

GO
ALTER TABLE [dbo].[ICE_Orders]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Orders_ICE_Resellers]
	FOREIGN KEY ([Reseller_ID]) REFERENCES [dbo].[ICE_Resellers] ([Reseller_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Orders]
	CHECK CONSTRAINT [FK_ICE_Orders_ICE_Resellers]

GO
ALTER TABLE [dbo].[ICE_Orders] SET (LOCK_ESCALATION = TABLE)
GO
