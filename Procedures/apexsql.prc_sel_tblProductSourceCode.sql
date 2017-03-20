SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure prc_sel_tblProductSourceCode
/* ------------------------------------------------------------
   PROCEDURE:    prc_sel_tblProductSourceCode                           
   
   DESCRIPTION:  Selects a record FROM table 'tblProductSourceCode'                         
   
   AUTHOR:       sa 1/17/2002 3:56:12 PM                                
   ------------------------------------------------------------ */
	@SourceCodeID                      int 
	AS SELECT 
		 [SourceCodeID],
		 [ProductID],
		 [UrlTitle],
		 [Url],
		 [UrlDescription],
		 [PostedDate]
 FROM [tblProductSourceCode]
	WHERE 
		[SourceCodeID]                     = @SourceCodeID
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_tblProductSourceCode]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_sel_tblProductSourceCode]
	TO [davor.dumeljic]
GO
