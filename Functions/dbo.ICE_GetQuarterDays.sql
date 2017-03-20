SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION dbo.ICE_GetQuarterDays
(
	@Quarter int
)
returns int
as 
BEGIN
	IF @Quarter = 1 
		RETURN 92 -- nov 30 + dec 31 + jan 31
	IF @Quarter = 2 
		RETURN 89 -- feb 28 + mar 31 + apr 30
	IF @Quarter = 3 
		RETURN 92 -- may 31 + june 30 + jul 31
	IF @Quarter = 4 
		RETURN 92 -- avg 31 + sep 30 + oct 31 
	--Error
	RETURN -1	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuarterDays]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuarterDays]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuarterDays]
	TO [davor.dumeljic]
GO
