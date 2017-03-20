SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_codProducts_upd

   Description:  Updates a record In table 'prc_codProducts_upd'

   AUTHOR:       LockwoodTech 4/23/2001 5:38:18 PM
   ------------------------------------------------------------ */

CREATE  PROCEDURE prc_codProducts_upd
(
@ProductID int,
@ProductName varchar(40),
@ProductDownloadLink varchar(100),
@ProductGraphicLoc varchar(100),
@Version varchar(6)
)
As
BEGIN
	DECLARE @Err Int

	UPDATE [codProducts]
	Set
[ProductName] = @ProductName,
[ProductDownloadLink] = @ProductDownloadLink,
[ProductGraphicLoc] = @ProductGraphicLoc,
[Version] = @Version
	WHERE
[ProductID] = @ProductID

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_upd]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_upd]
	TO [davor.dumeljic]
GO
