SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_CustomersByPeriod
(
    @StartDate datetime,
    @EndDate datetime
)
AS
BEGIN

SELECT COUNT(*) as [No_Of_Customers]
FROM
(
    SELECT DISTINCT Cust_ID
    FROM ICE_Orders
    WHERE Order_Date between @StartDate and @EndDate
    and Order_Status_ID in (0,1,2,4)
) P

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersByPeriod]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersByPeriod]
	TO [davor.dumeljic]
GO
