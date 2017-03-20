SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [apexsql].[lwCountries] (
		[CountryID]       [int] IDENTITY(1, 1) NOT NULL,
		[CountryName]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [apexsql].[lwCountries]
	ADD
	CONSTRAINT [PK_lwCountries]
	PRIMARY KEY
	NONCLUSTERED
	([CountryID])
	ON [PRIMARY]
GO
ALTER TABLE [apexsql].[lwCountries] SET (LOCK_ESCALATION = TABLE)
GO
