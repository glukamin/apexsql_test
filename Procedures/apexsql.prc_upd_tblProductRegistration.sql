SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE procedure prc_upd_tblProductRegistration
/* ------------------------------------------------------------
   PROCEDURE:    prc_upd_tblProductRegistration                         
   
   DESCRIPTION:  Updates a record in table 'tblProductRegistration'                         
   
   AUTHOR:       sa 12/11/2001 2:43:03 PM                               
   ------------------------------------------------------------ */
	@RegID                             int,
	@UserID                            int,
	@ProductID                         int,
	@ProductKey                        int,
	@VendorID                          int  = NULL,
	@LicenseNumber                     varchar(100),
	@PurChaseDate                      smalldatetime  = NULL,
	@RegStatus                         int,
	@Comment                           varchar(300)  = NULL,
	@Update_By                         int  = NULL,
	@Enter_Date                        smalldatetime,
	@Update_Date                       smalldatetime  = NULL
	AS UPDATE [tblProductRegistration]
	SET 
		[UserID]                           = @UserID,
		[ProductID]                        = @ProductID,
		[ProductKey]                       = @ProductKey,
		[VendorID]                         = @VendorID,
		[LicenseNumber]                    = @LicenseNumber,
		[PurChaseDate]                     = @PurChaseDate,
		[RegStatus]                        = @RegStatus,
		[Comment]                          = @Comment,
		[Update_By]                        = @Update_By,
		[Enter_Date]                       = @Enter_Date,
		[Update_Date]                      = @Update_Date
	WHERE 
		[RegID]                            = @RegID
	IF @@ROWCOUNT = 0
	BEGIN
		 RAISERROR ('No Rows affected', 16, 1)
	END
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_tblProductRegistration]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_tblProductRegistration]
	TO [davor.dumeljic]
GO
