SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 08/24/2007
-- Description:	Updates the downloadcount or viewcount as per the counttype e.g.'D' for download count
-- =============================================
CREATE PROCEDURE [dbo].[OTL_UpdateCount]
(
@Id int,
@CountType varchar(5)
)
 AS
	BEGIN

		DECLARE @PrevCount int
		--update count for the download
		IF (@CountType='D')
		BEGIN
			UPDATE OTL_Templates SET DownloadCount=ISNULL(DownloadCount,0) +1 WHERE Id=@Id
			SELECT DownloadCount,ViewCount FROM OTL_Templates WHERE Id=@Id
		END
	
		--update count for the view
		IF (@CountType='V')
		BEGIN
			UPDATE OTL_Templates SET ViewCount=ISNULL(ViewCount,0) + 1 WHERE Id=@Id
			SELECT DownloadCount,ViewCount FROM OTL_Templates WHERE Id=@Id
		END	

	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_UpdateCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_UpdateCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_UpdateCount]
	TO [davor.dumeljic]
GO
