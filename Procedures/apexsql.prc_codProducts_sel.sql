SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_codProducts_sel

   Description:  Selects record(s) from table 'prc_codProducts_sel'

   AUTHOR:       LockwoodTech 4/23/2001 5:38:18 PM
   ------------------------------------------------------------ */

CREATE  PROCEDURE prc_codProducts_sel
(
@ProductID int
)
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
	WHERE
([ProductID] = @ProductID OR @ProductID IS NULL)

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_sel]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_sel]
	TO [davor.dumeljic]
GO
