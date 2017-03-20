SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Quotes] (
		[Quote_ID]                 [int] IDENTITY(1, 1) NOT NULL,
		[Quote_Date]               [datetime] NOT NULL,
		[Cust_ID]                  [int] NULL,
		[License_To]               [tinyint] NULL,
		[Reg_Name]                 [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Notes]                    [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Name_Ship]           [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[First_Name_Ship]          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Email_Ship]               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Ship]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone_Ship]               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fax_Ship]                 [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1_Ship]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2_Ship]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City_Ship]                [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State_Ship]               [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country_Ship]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Zip_Ship]                 [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Amount]                   [money] NULL,
		[Tax]                      [float] NULL,
		[Total]                    [money] NULL,
		[Quote]                    [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Sent_Email]               [tinyint] NULL,
		[Order_ID]                 [int] NULL,
		[Reseller_ID]              [int] NULL,
		[Discount]                 [float] NULL,
		[Wire_Transfer]            [tinyint] NULL,
		[Wire_Transfer_Amount]     [money] NULL,
		[Created_By]               [int] NULL,
		[Create_Date]              [datetime] NULL,
		[Edited_By]                [int] NULL,
		[Edit_Date]                [datetime] NULL,
		[FollowUp]                 [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Quotes]
	ADD
	CONSTRAINT [PK_ICE_Quote]
	PRIMARY KEY
	CLUSTERED
	([Quote_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Quotes]
	ADD
	CONSTRAINT [DF_ICE_Quotes_Amount]
	DEFAULT (0) FOR [Amount]
GO
ALTER TABLE [dbo].[ICE_Quotes]
	ADD
	CONSTRAINT [DF_ICE_Quotes_Discount]
	DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[ICE_Quotes]
	ADD
	CONSTRAINT [DF_ICE_Quotes_Tax]
	DEFAULT (0) FOR [Tax]
GO
ALTER TABLE [dbo].[ICE_Quotes]
	ADD
	CONSTRAINT [DF_ICE_Quotes_Total]
	DEFAULT (0) FOR [Total]
GO
ALTER TABLE [dbo].[ICE_Quotes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Quotes_ICE_Resellers]
	FOREIGN KEY ([Reseller_ID]) REFERENCES [dbo].[ICE_Resellers] ([Reseller_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Quotes]
	CHECK CONSTRAINT [FK_ICE_Quotes_ICE_Resellers]

GO
ALTER TABLE [dbo].[ICE_Quotes] SET (LOCK_ESCALATION = TABLE)
GO
