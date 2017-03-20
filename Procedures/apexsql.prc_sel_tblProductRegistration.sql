SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure prc_sel_tblProductRegistration
/* ------------------------------------------------------------
   PROCEDURE:    prc_sel_tblProductRegistration                         
   
   DESCRIPTION:  Selects a record FROM table 'tblProductRegistration'                       
   
   AUTHOR:       sa 12/11/2001 2:43:02 PM                               
   ------------------------------------------------------------ */
	@RegID                             int 
	AS SELECT 
		 [RegID],
		 [UserID],
		 [ProductID],
		 [ProductKey],
		 [VendorID],
		 [LicenseNumber],
		 [PurChaseDate],
		 [RegStatus],
		 [Comment],
		 [Update_By],
		 [Enter_Date],
		 [Update_Date]
 FROM [tblProductRegistration]
	WHERE 
		[RegID]                            = @RegID
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_tblProductRegistration]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_tblProductRegistration]
	TO [davor.dumeljic]
GO
