SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure prc_ins_tblProductSourceCode
/* ------------------------------------------------------------
   PROCEDURE:    prc_ins_tblProductSourceCode                           
   
   DESCRIPTION:  Inserts a record into table 'tblProductSourceCode'                         
   
   AUTHOR:       sa 1/17/2002 3:56:12 PM                                
   ------------------------------------------------------------ */
	@SourceCodeID                      int OUTPUT,
	@ProductID                         int,
	@UrlTitle                          varchar(100),
	@Url                               varchar(100),
	@UrlDescription                    varchar(300),
	@PostedDate                        smalldatetime
	AS INSERT INTO [tblProductSourceCode]
	(
		[ProductID],
		[UrlTitle],
		[Url],
		[UrlDescription],
		[PostedDate]
	)
	VALUES
	(
		@ProductID,
		@UrlTitle,
		@Url,
		@UrlDescription,
		@PostedDate
	)
	SET @SourceCodeID = @@IDENTITY
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_ins_tblProductSourceCode]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_ins_tblProductSourceCode]
	TO [davor.dumeljic]
GO
