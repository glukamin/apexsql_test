SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ICE_GetEligableVersion]
(
 @Order_Detail_ID int,
 @Product_ID int
)
RETURNS int
AS
BEGIN
DECLARE @Version int
DECLARE @ExpiryDate datetime
SET @ExpiryDate = dbo.ICE_GetOrderDetailExpiry(@Order_Detail_ID)

-- I use max here because in future we`ll have more than one major build versions for each product
SET @Version = ( SELECT
                     MAX(Major_Build_Version)
                 FROM
                     ICE_Major_Builds MB LEFT JOIN ICE_Major_Builds_Helper BH ON MB.Major_Build_ID = BH.Major_Build_ID
                 WHERE
                     MB.Dated < @ExpiryDate AND 
		     MB.Product_ID = @Product_ID AND 
			 BH.Active = 1 AND     /*Column active defines that current major build is released or not */
		     MB.Dated <= GETDATE() /*So we dont take into account major build versions that are not out*/
               )
IF @Version IS NULL -- if product doesnt have Major Build
   BEGIN
         SET @Version = ( SELECT
                              Default_Major_Build_Version
                          FROM
                              ICE_Products P
                          WHERE
                              P.Product_ID = @Product_ID )
   END
RETURN ISNULL(@version , -1)
END




GO
GRANT EXECUTE
	ON [dbo].[ICE_GetEligableVersion]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetEligableVersion]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetEligableVersion]
	TO [davor.dumeljic]
GO
