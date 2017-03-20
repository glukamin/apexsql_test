SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_tblMailContent_ins

   Description:  Inserts a record into table 'prc_tblMailContent_ins'

   AUTHOR:       LockwoodTech 3/6/2004 1:10:22 PM
   ------------------------------------------------------------ */

CREATE  PROCEDURE prc_tblMailContent_ins
(
@ProductID int = null output,
@Subject varchar(100),
@Body varchar(8000)
)
As
BEGIN
	DECLARE @Err Int

	INSERT
	INTO [tblMailContent]
	(
[ProductID],
[Subject],
[Body]
	)
	VALUES
	(
@ProductID,
@Subject,
@Body
	)

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_ins]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblMailContent_ins]
	TO [davor.dumeljic]
GO
