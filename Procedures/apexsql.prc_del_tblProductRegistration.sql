SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO





























create procedure prc_del_tblProductRegistration
/* ------------------------------------------------------------
   PROCEDURE:    prc_del_tblProductRegistration                         
   
   DESCRIPTION:  Deletes a record FROM table 'tblProductRegistration'                       
   
   AUTHOR:       sa 12/11/2001 2:43:02 PM                               
   ------------------------------------------------------------ */
	@RegID                             int 
	AS DELETE FROM [tblProductRegistration]
	WHERE 
		[RegID]                            = @RegID
	IF @@ROWCOUNT = 0
	BEGIN
		 RAISERROR ('No Rows affected', 16, 1)
	END
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_del_tblProductRegistration]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_del_tblProductRegistration]
	TO [davor.dumeljic]
GO
