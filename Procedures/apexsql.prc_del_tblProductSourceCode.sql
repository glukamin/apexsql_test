SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure prc_del_tblProductSourceCode
/* ------------------------------------------------------------
   PROCEDURE:    prc_del_tblProductSourceCode                           
   
   DESCRIPTION:  Deletes a record FROM table 'tblProductSourceCode'                         
   
   AUTHOR:       sa 1/17/2002 3:56:12 PM                                
   ------------------------------------------------------------ */
	@SourceCodeID                      int 
	AS DELETE FROM [tblProductSourceCode]
	WHERE 
		[SourceCodeID]                     = @SourceCodeID
	IF @@ROWCOUNT = 0
	BEGIN
		 RAISERROR ('No Rows affected', 16, 1)
	END
	RETURN @@ERROR
GO
GRANT EXECUTE
	ON [apexsql].[prc_del_tblProductSourceCode]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_del_tblProductSourceCode]
	TO [davor.dumeljic]
GO
