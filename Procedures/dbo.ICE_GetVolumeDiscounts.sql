SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.ICE_GetVolumeDiscounts
(
 @ProductID int ,
 @MaintenanceID int )
AS
BEGIN

      SELECT
          CONVERT(varchar , License_count) + ISNULL(' - ' + CONVERT(varchar , ( SELECT
                                                                                    Min(License_Count) - 1
                                                                                FROM
                                                                                    ICE_Product_Licenses
                                                                                WHERE
                                                                                    Product_ID = @ProductID AND License_Count > PLs.License_Count )) , ' +') AS Licenses ,
          dbo.ICE_GetLicensePrice(@ProductID , PLs.License_Type_ID , @MaintenanceID , License_Count) AS Price
      FROM
          ICE_Product_Licenses PLs
      WHERE
          Product_ID = @ProductID AND License_Type_ID = 0
      ORDER BY
          License_Count
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetVolumeDiscounts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetVolumeDiscounts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetVolumeDiscounts]
	TO [davor.dumeljic]
GO
