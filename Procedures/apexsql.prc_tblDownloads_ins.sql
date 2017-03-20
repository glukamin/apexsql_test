SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/* ------------------------------------------------------------
   PROCEDURE:    prc_tblDownloads_ins

   Description:  Inserts a record into table 'tblDownloads'

   AUTHOR:       LockwoodTech 4/16/2001 10:38:29 PM
   ------------------------------------------------------------ */

CREATE PROCEDURE prc_tblDownloads_ins
(
@DownloadID int = null output,
@UserID INT,
@ProductID INT
)
As
BEGIN
	DECLARE @Err Int

	INSERT
	INTO [tblDownloads]
	(
[UserID],
[ProductID]
	)
	VALUES
	(
@UserID,
@ProductID
	)

	Set @Err = @@Error
set @DownloadID = @@identity

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblDownloads_ins]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_tblDownloads_ins]
	TO [davor.dumeljic]
GO
