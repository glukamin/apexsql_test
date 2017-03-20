SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE prc_Newsletter_ins

@UserEmail varchar(50),
@Status bit

As	
	INSERT
	INTO [Newsletter]
	(
[UserEmail],[Status]
	)
	VALUES
	(
@UserEmail,@Status
	)

	RETURN  @@Error
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_ins]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_ins]
	TO [davor.dumeljic]
GO
