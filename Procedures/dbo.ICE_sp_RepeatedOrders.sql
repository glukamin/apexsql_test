SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- broj customera 
--  koji 

CREATE PROCEDURE dbo.ICE_sp_RepeatedOrders
( 
    @StartDate datetime,
    @EndDate datetime,
    @IncludeRenewals bit
)
AS
BEGIN

IF @IncludeRenewals = 0
BEGIN
    SELECT COUNT(*) as [CustomerCount]
    FROM
    (
    select distinct Z.Cust_ID
    from 
    (
	   select O.Cust_ID, 
	   O.Order_Date, 
	   O.Order_ID,
	   ROW_NUMBER() over (partition by O.Cust_ID order by O.Order_Date) as OrderNumber 
	   from ICE_Orders O  
	   inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID
	   where O.Order_Status_ID in (0,1,2,4)
	   group by Cust_ID, Order_Date, O.Order_ID
    ) Z 
    where Z.OrderNumber > 1
    and Z.Order_Date between @StartDate and @EndDate
    ) M
END
ELSE
    BEGIN
    SELECT COUNT(*) as [CustomerCount]
    FROM
    (
    select distinct Z.Cust_ID
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
    ) M
    END

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RepeatedOrders]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RepeatedOrders]
	TO [davor.dumeljic]
GO
