SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Unlock_Codes] (
		[Unlock_Code_ID]         [int] IDENTITY(30009, 1) NOT NULL,
		[Order_Detail_ID]        [int] NULL,
		[Unlock_Code]            [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Comment]                [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Dated]                  [datetime] NOT NULL,
		[Order_ID]               [int] NOT NULL,
		[Product_ID]             [int] NOT NULL,
		[License_No]             [int] NOT NULL,
		[Activation_Counter]     [int] NOT NULL,
		[Activation_Blocked]     [tinyint] NULL,
		[Parent_Code_ID]         [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	ADD
	CONSTRAINT [PK_ICE_Unlock_Codes]
	PRIMARY KEY
	CLUSTERED
	([Unlock_Code_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	WITH CHECK
	ADD CONSTRAINT [FK__ICE_Unloc__Paren__5DF6A344]
	FOREIGN KEY ([Parent_Code_ID]) REFERENCES [dbo].[ICE_Unlock_Codes] ([Unlock_Code_ID])
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	CHECK CONSTRAINT [FK__ICE_Unloc__Paren__5DF6A344]

GO
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	WITH CHECK
	ADD CONSTRAINT [FK_ICE_Unlock_Codes_ICE_Order_Details]
	FOREIGN KEY ([Order_Detail_ID]) REFERENCES [dbo].[ICE_Order_Details] ([Order_Detail_Id])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	CHECK CONSTRAINT [FK_ICE_Unlock_Codes_ICE_Order_Details]

GO
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Unlock_Codes_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
ALTER TABLE [dbo].[ICE_Unlock_Codes]
	CHECK CONSTRAINT [FK_ICE_Unlock_Codes_ICE_Products]

GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ICE_Unlock_Codes]
	ON [dbo].[ICE_Unlock_Codes] ([Unlock_Code], [Order_Detail_ID], [Product_ID])
	WHERE (([Unlock_Code] IS NOT NULL))
	ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ICE_Unlock_Codes] SET (LOCK_ESCALATION = TABLE)
GO
