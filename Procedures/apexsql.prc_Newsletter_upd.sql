SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_Newsletter_upd

   Description:  updates a record into table 'Newsletter'

   AUTHOR:       LockwoodTech 5/19/2003 5:38:18 PM
   ------------------------------------------------------------ */
CREATE PROCEDURE prc_Newsletter_upd

@UserEmail varchar(50)

As	
	UPDATE
	[Newsletter]
	SET Status = 1	
	WHERE
	[UserEmail] = @UserEmail
	RETURN  @@Error
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_upd]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_upd]
	TO [davor.dumeljic]
GO
