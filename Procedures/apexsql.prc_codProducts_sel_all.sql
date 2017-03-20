SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_codProducts_sel_all

   Description:  Selects all records from the table 'prc_codProducts_sel_all'

   AUTHOR:       LockwoodTech 4/23/2001 5:38:18 PM
   ------------------------------------------------------------ */

CREATE  PROCEDURE prc_codProducts_sel_all
As
BEGIN
	DECLARE @Err Int

	Select
[ProductID],
[ProductName],
[ProductDownloadLink],
[ProductGraphicLoc],
[Version]
	FROM [codProducts]

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_sel_all]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_sel_all]
	TO [davor.dumeljic]
GO
