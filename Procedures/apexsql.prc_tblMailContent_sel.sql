SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_tblMailContent_sel

   Description:  Selects record(s) from table 'prc_tblMailContent_sel'

   AUTHOR:       LockwoodTech 3/6/2004 1:10:22 PM
   ------------------------------------------------------------ */

CREATE PROCEDURE prc_tblMailContent_sel
(
@ProductID int
)
As
BEGIN
	DECLARE @Err Int

	Select
[ProductID],
[Subject],
[Body]
	FROM [tblMailContent]
	WHERE
([ProductID] = @ProductID OR @ProductID IS NULL)

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_sel]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_sel]
	TO [davor.dumeljic]
GO
