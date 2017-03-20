SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure prc_upd_tblProductSourceCode
/* ------------------------------------------------------------
   PROCEDURE:    prc_upd_tblProductSourceCode                           
   
   DESCRIPTION:  Updates a record in table 'tblProductSourceCode'                           
   
   AUTHOR:       sa 1/17/2002 3:56:12 PM                                
   ------------------------------------------------------------ */
	@SourceCodeID                      int,
	@ProductID                         int,
	@UrlTitle                          varchar(100),
	@Url                               varchar(100),
	@UrlDescription                    varchar(300),
	@PostedDate                        smalldatetime 
	AS UPDATE [tblProductSourceCode]
	SET 
		[ProductID]                        = @ProductID,
		[UrlTitle]                         = @UrlTitle,
		[Url]                              = @Url,
		[UrlDescription]                   = @UrlDescription,
		[PostedDate]                       = @PostedDate
	WHERE 
		[SourceCodeID]                     = @SourceCodeID
	IF @@ROWCOUNT = 0
	BEGIN
		 RAISERROR ('No Rows affected', 16, 1)
	END
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_tblProductSourceCode]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_tblProductSourceCode]
	TO [davor.dumeljic]
GO
