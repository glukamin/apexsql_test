SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_tblMailContent_sel_all

   Description:  Selects all records from the table 'prc_tblMailContent_sel_all'

   AUTHOR:       LockwoodTech 3/6/2004 1:10:22 PM
   ------------------------------------------------------------ */

CREATE PROCEDURE prc_tblMailContent_sel_all
As
BEGIN
	DECLARE @Err Int

	SELECT a.*, b.ProductName FROM tblMailContent a, codProducts b
WHERE a.ProductId = b.ProductID

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_sel_all]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_sel_all]
	TO [davor.dumeljic]
GO
