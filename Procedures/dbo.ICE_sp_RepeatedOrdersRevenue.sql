SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- broj customera 
--  koji 

CREATE PROCEDURE [dbo].[ICE_sp_RepeatedOrdersRevenue]
( 
    @StartDate datetime,
    @EndDate datetime,
    @IncludeRenewals bit
)
AS
BEGIN

IF @IncludeRenewals = 0
BEGIN
     SELECT SUM(Total) as TotalRevenue
    FROM dbo.ICE_Orders io
    WHERE io.Order_ID in
    (
	   select distinct a.Order_ID
	   from 
	   (
		 select O.Cust_ID, 
		  O.Order_Date, 
		  O.Order_ID,
		  ROW_NUMBER() over (partition by O.Cust_ID order by O.Order_Date) as OrderNumber
		  from ICE_Orders O
		  where O.Order_Status_ID in (0,1,2,4)
		  group by Cust_ID, Order_Date, O.Order_ID
	   ) a 
		   LEFT JOIN
		  (
			SELECT distinct O.Order_ID
			FROM ICE_Orders O
			INNER JOIN ICE_Extension_Details ED on O.Order_ID = ED.Order_ID
			WHERE O.Order_Status_ID in (0,1,2,4)
	   )b
	   ON a.Order_ID = b.Order_ID
	   WHERE b.Order_ID IS NULL AND a.OrderNumber > 1
	   and a.Order_Date between @StartDate and @EndDate
    )
END
ELSE
    BEGIN
    SELECT SUM(Total) as TotalRevenue
    FROM ICE_Orders
    WHERE Order_ID in
    (
	   select distinct Z.Order_ID
	   from 
	   (
		  select O.Cust_ID, 
		  O.Order_Date, 
		  O.Order_ID,
		  ROW_NUMBER() over (partition by O.Cust_ID order by O.Order_Date) as OrderNumber 
		  from ICE_Orders O
		  where O.Order_Status_ID in (0,1,2,4)
		  group by Cust_ID, Order_Date, O.Order_ID
	   ) Z 
	   where Z.OrderNumber > 1
	   and Z.Order_Date between @StartDate and @EndDate
    )
    END

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RepeatedOrdersRevenue]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RepeatedOrdersRevenue]
	TO [davor.dumeljic]
GO
