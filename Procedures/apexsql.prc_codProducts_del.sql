SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_codProducts_del

   Description:  Deletes a record from table 'prc_codProducts_del'

   AUTHOR:       LockwoodTech 4/23/2001 5:38:18 PM
   ------------------------------------------------------------ */

CREATE PROCEDURE prc_codProducts_del
(
@ProductID int
)
As
BEGIN
	DECLARE @Err Int

	DELETE
	FROM [codProducts]
	WHERE
[ProductID] = @ProductID

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_del]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_del]
	TO [davor.dumeljic]
GO
