SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICE_Activation_Helper] (
		[ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Email]          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[OrderID]        [int] NULL,
		[NoLicences]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Activation_Helper]
	ADD
	CONSTRAINT [PK__ICE_Acti__3214EC2768174884]
	PRIMARY KEY
	CLUSTERED
	([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Activation_Helper]
	WITH CHECK
	ADD CONSTRAINT [FK__ICE_Activ__Order__01FEF990]
	FOREIGN KEY ([OrderID]) REFERENCES [dbo].[ICE_Orders] ([Order_ID])
ALTER TABLE [dbo].[ICE_Activation_Helper]
	CHECK CONSTRAINT [FK__ICE_Activ__Order__01FEF990]

GO
ALTER TABLE [dbo].[ICE_Activation_Helper] SET (LOCK_ESCALATION = TABLE)
GO
