SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[codVendors] (
		[VendorID]       [int] IDENTITY(1, 1) NOT NULL,
		[VendorName]     [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[SortOrder]      [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[codVendors]
	ADD
	CONSTRAINT [codVendors_VendorID_PK]
	PRIMARY KEY
	NONCLUSTERED
	([VendorID])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[codVendors] SET (LOCK_ESCALATION = TABLE)
GO
