SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_tblMailContent_upd

   Description:  Updates a record In table 'prc_tblMailContent_upd'

   AUTHOR:       LockwoodTech 3/6/2004 1:10:22 PM
   ------------------------------------------------------------ */

CREATE  PROCEDURE prc_tblMailContent_upd
(
@ProductID int,
@Subject varchar(100),
@Body varchar(8000)
)
As
BEGIN
	DECLARE @Err Int

	UPDATE [tblMailContent]
	Set
[ProductID] = @ProductID,
[Subject] = @Subject,
[Body] = @Body
	WHERE
[ProductID] = @ProductID

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_upd]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_upd]
	TO [davor.dumeljic]
GO
