SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  Procedure tiSELECT_UsersForMailing
@ProcessFlag Bit

As
	If @ProcessFlag = 0
	BEGIN
		SELECT UserEmail
		FROM Newsletter
		WHERE Status = 1 AND ProcessFlag =0
	END
	ELSE
	BEGIN
		SELECT UserEmail
		FROM Newsletter
		WHERE Status = 1
	END
GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_UsersForMailing]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_UsersForMailing]
	TO [davor.dumeljic]
GO
