SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE procedure prc_ins_tblProductRegistration
/* ------------------------------------------------------------
   PROCEDURE:    prc_ins_tblProductRegistration                         
   
   DESCRIPTION:  Inserts a record into table 'tblProductRegistration'                       
   
   AUTHOR:       sa 12/11/2001 2:43:03 PM                               
   ------------------------------------------------------------ */
	@RegID                             int OUTPUT,
	@UserID                            int,
	@ProductID                         int,
	@ProductKey                        int,
	@VendorID                          int = NULL,
	@LicenseNumber                     varchar(100),
	@PurChaseDate                      smalldatetime = NULL,
	@RegStatus                         int,
	@Comment                           varchar(300) = NULL,
	@Update_By                         int = NULL,
	@Enter_Date                        smalldatetime,
	@Update_Date                       smalldatetime = NULL
	AS INSERT INTO [tblProductRegistration]
	(
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
	)
	VALUES
	(
		@UserID,
		@ProductID,
		@ProductKey,
		@VendorID,
		@LicenseNumber,
		@PurChaseDate,
		@RegStatus,
		@Comment,
		@Update_By,
		@Enter_Date,
		@Update_Date
	)
	SET @RegID = @@IDENTITY
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_ins_tblProductRegistration]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_ins_tblProductRegistration]
	TO [davor.dumeljic]
GO
