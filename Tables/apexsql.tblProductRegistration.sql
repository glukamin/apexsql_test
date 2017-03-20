SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[tblProductRegistration] (
		[RegID]             [int] IDENTITY(1, 1) NOT NULL,
		[UserID]            [int] NOT NULL,
		[ProductID]         [int] NOT NULL,
		[ProductKey]        [int] NOT NULL,
		[VendorID]          [int] NULL,
		[LicenseNumber]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[PurChaseDate]      [smalldatetime] NULL,
		[RegStatus]         [int] NOT NULL,
		[Comment]           [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Update_By]         [int] NULL,
		[Enter_Date]        [smalldatetime] NOT NULL,
		[Update_Date]       [smalldatetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblProductRegistration]
	ADD
	CONSTRAINT [tblProductRegistration_RegID_PK]
	PRIMARY KEY
	NONCLUSTERED
	([RegID])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[tblProductRegistration]
	WITH NOCHECK
	ADD CONSTRAINT [fk_ProdReg]
	FOREIGN KEY ([ProductID]) REFERENCES [apexsql].[codProducts] ([ProductID])
ALTER TABLE [apexsql].[tblProductRegistration]
	CHECK CONSTRAINT [fk_ProdReg]

GO
ALTER TABLE [apexsql].[tblProductRegistration] SET (LOCK_ESCALATION = TABLE)
GO
