SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_Products_Price_Log] (
		[Log_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Product_ID]       [int] NOT NULL,
		[Price]            [money] NOT NULL,
		[Date_Changed]     [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Products_Price_Log]
	ADD
	CONSTRAINT [PK__ICE_Prod__2D26E7AE14A79AD7]
	PRIMARY KEY
	CLUSTERED
	([Log_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Products_Price_Log]
	WITH NOCHECK
	ADD CONSTRAINT [FK__ICE_Produ__Produ__1BBECB93]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
ALTER TABLE [dbo].[ICE_Products_Price_Log]
	CHECK CONSTRAINT [FK__ICE_Produ__Produ__1BBECB93]

GO
ALTER TABLE [dbo].[ICE_Products_Price_Log] SET (LOCK_ESCALATION = TABLE)
GO
