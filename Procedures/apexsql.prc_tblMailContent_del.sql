SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_tblMailContent_del

   Description:  Deletes a record from table 'prc_tblMailContent_del'

   AUTHOR:       LockwoodTech 3/6/2004 1:10:23 PM
   ------------------------------------------------------------ */

CREATE PROCEDURE prc_tblMailContent_del
(
@ProductID int
)
As
BEGIN
	DECLARE @Err Int

	DELETE
	FROM [tblMailContent]
	WHERE
[ProductID] = @ProductID

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_del]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_del]
	TO [davor.dumeljic]
GO
