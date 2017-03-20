SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE lwSELECT_CountryList
AS
SELECT 
	CountryID,
	CountryName
FROM
	lwCountries
GO
GRANT EXECUTE
	ON [apexsql].[lwSELECT_CountryList]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[lwSELECT_CountryList]
	TO [davor.dumeljic]
GO
