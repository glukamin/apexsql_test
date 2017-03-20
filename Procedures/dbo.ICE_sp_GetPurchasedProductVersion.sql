SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE DBO.ICE_sp_GetPurchasedProductVersion
(
 @Order_Detail_ID int )
AS
BEGIN
	DECLARE @Product_ID int
	DECLARE @Order_ID int
	SET @Order_ID = (select Order_ID from ICE_Order_Details where ICE_Order_Details.Order_Detail_Id = @Order_Detail_ID)
	SET @Product_ID = (SELECT Product_ID from ICE_Order_Details where ICE_Order_Details.Order_Detail_Id = @Order_Detail_ID)
      SELECT
          P.Product_Name AS Product_Name ,
          dbo.ICE_GetProductMajorBuild(ICE_Order_Details.Product_ID , ICE_Orders.Order_Date) AS Purchased ,
          dbo.ICE_GetProductMajorBuild(ICE_Order_Details.Product_ID , GetDate()) AS Latest ,
          CASE
               	WHEN ISNULL((SELECT Dated
                           FROM ICE_Major_Builds
                           WHERE Product_ID = @Product_ID 
				AND Major_Build_Version = (dbo.ICE_GetProductMajorBuild(@Product_ID , GETDATE()) )),
				'01/01/1990') <= (dbo.ICE_GetOrderDetailExpiry(@Order_Detail_ID)) THEN 'Yes'
               ELSE 'No'
          END AS Eligible
      FROM
          ICE_Orders INNER JOIN ICE_Order_Details
          ON ICE_Orders.Order_ID = ICE_Order_Details.Order_ID INNER JOIN ICE_Products P
          ON ICE_Order_Details.Product_ID = P.Product_ID
      WHERE
          ICE_Orders.Order_ID = @Order_ID
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetPurchasedProductVersion]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetPurchasedProductVersion]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetPurchasedProductVersion]
	TO [davor.dumeljic]
GO
