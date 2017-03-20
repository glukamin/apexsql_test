SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure prc_sel_ProductRegStatus
/* ------------------------------------------------------------
   PROCEDURE:    prc_sel_ProductRegStatus                         
   
   DESCRIPTION:  Checks whetthe a User is valid and regitered any Products
		 Used to give access customer center for download sorce code                        
   
   AUTHOR:       sa 03/21/2001 2:43:02 PM                               
   ------------------------------------------------------------ */
	@UserID                             Int, 
	@ProductRegStatus 		    Bit OUTPUT	
	AS 
	SET @ProductRegStatus = 0	
	IF EXISTS(Select UserID From tblProductRegistration Where UserID =@UserID)
		BEGIN
			Set @ProductRegStatus = 1
		END
	/*Select @ProductRegStatus*/
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_ProductRegStatus]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_ProductRegStatus]
	TO [davor.dumeljic]
GO
