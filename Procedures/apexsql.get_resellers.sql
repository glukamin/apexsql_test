SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE get_resellers
AS
SELECT DISTINCT
	id=reseller,
	name=CAST(reseller AS varchar(100))
FROM
	reference
GO
GRANT EXECUTE
	ON [apexsql].[get_resellers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[get_resellers]
	TO [davor.dumeljic]
GO
