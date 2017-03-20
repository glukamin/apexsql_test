SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ICE_Download_Details] (
		[Download_Detail_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Download_ID]            [int] NOT NULL,
		[Product_ID]             [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Download_Details]
	ADD
	CONSTRAINT [PK_ICE_Download_Details]
	PRIMARY KEY
	CLUSTERED
	([Download_Detail_ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ICE_Download_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Download_Details_ICE_Downloads]
	FOREIGN KEY ([Download_ID]) REFERENCES [dbo].[ICE_Downloads] ([Download_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[ICE_Download_Details]
	CHECK CONSTRAINT [FK_ICE_Download_Details_ICE_Downloads]

GO
ALTER TABLE [dbo].[ICE_Download_Details]
	WITH NOCHECK
	ADD CONSTRAINT [FK_ICE_Download_Details_ICE_Products]
	FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[ICE_Products] ([Product_ID])
ALTER TABLE [dbo].[ICE_Download_Details]
	CHECK CONSTRAINT [FK_ICE_Download_Details_ICE_Products]

GO
ALTER TABLE [dbo].[ICE_Download_Details] SET (LOCK_ESCALATION = TABLE)
GO
