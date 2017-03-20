SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_ProductCountByMonth]
(
 @ProductID int ,
 @DateBegin datetime ,
 @DateEnd datetime )
AS
IF @ProductID IN ( 300267612 , 300172715 , 300172714 , 300171838 , 300100681 )
   BEGIN
         SELECT
             Month = dbo.ICE_GetMonthName(T.Month1) ,
             T.Count
         FROM
             ( SELECT TOP 100 PERCENT
                   Month1 = Year(O.Order_Date) * 100 + Month(O.Order_Date) ,
                   Count = Count(*)
               FROM
               ICE_Orders O INNER JOIN ICE_Order_Details OD
               ON O.Order_ID = OD.Order_ID
               WHERE
                   O.Order_Status_ID IN (0, 1 , 2 , 4 ) AND O.Order_Date >= @DateBegin AND O.Order_Date <= @DateEnd AND OD.Product_ID = @ProductID AND ( Upper(OD.Coupon) IS NULL OR LTRIM(RTRIM(Upper(OD.Coupon))) NOT IN ( 'GRATUITY' , 'PRODUCT SPLIT' ) )
               GROUP BY
                   Year(O.Order_Date) * 100 + Month(O.Order_Date)
               ORDER BY
                   Year(O.Order_Date) * 100 + Month(O.Order_Date) ) AS T
         ORDER BY
                   T.Month1
   END
ELSE
   BEGIN
         SELECT
             Month = dbo.ICE_GetMonthName(T.Month1) ,
             T.Count
         FROM
             ( SELECT TOP 100 PERCENT
                   Month1 = Year(O.Order_Date) * 100 + Month(O.Order_Date) ,
                   Count = Count(*)
               FROM
               ICE_Orders O INNER JOIN ICE_Order_Details OD
               ON O.Order_ID = OD.Order_ID
               WHERE
                   O.Order_Status_ID IN (0, 1 , 2 , 4 ) AND O.Order_Date >= @DateBegin AND O.Order_Date <= @DateEnd AND OD.Product_ID = @ProductID
               GROUP BY
                   Year(O.Order_Date) * 100 + Month(O.Order_Date)
               ORDER BY
                   Year(O.Order_Date) * 100 + Month(O.Order_Date) ) AS T
         ORDER BY
                   T.Month1
   END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductCountByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductCountByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductCountByMonth]
	TO [davor.dumeljic]
GO
