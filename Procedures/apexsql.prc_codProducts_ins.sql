SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_codProducts_ins

   Description:  Inserts a record into table 'prc_codProducts_ins'

   AUTHOR:       LockwoodTech 4/23/2001 5:38:18 PM
   ------------------------------------------------------------ */

CREATE  PROCEDURE prc_codProducts_ins
(
@ProductID int = null output,
@ProductName varchar(40),
@ProductDownloadLink varchar(100) = null,
@ProductGraphicLoc varchar(100) = null,
@Version varchar(6) = null
)
As
BEGIN
	DECLARE @Err Int

	INSERT
	INTO [codProducts]
	(
[ProductName],
[ProductDownloadLink],
[ProductGraphicLoc],
[Version]
	)
	VALUES
	(
@ProductName,
@ProductDownloadLink,
@ProductGraphicLoc,
@Version
	)

	Set @Err = @@Error
set @ProductID = @@identity

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_ins]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_codProducts_ins]
	TO [davor.dumeljic]
GO
