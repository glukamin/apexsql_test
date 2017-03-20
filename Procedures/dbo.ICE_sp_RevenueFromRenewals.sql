SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_RevenueFromRenewals]
(
    @StartDate datetime,
    @EndDate datetime
)
AS 
BEGIN


SELECT SUM(Total) as [Total]
FROM dbo.ICE_Extension_Details ied
WHERE ied.Order_ID in 
(
SELECT distinct O.Order_ID
FROM ICE_Orders O
INNER JOIN ICE_Extension_Details ED on O.Order_ID = ED.Order_ID
WHERE O.Order_Date BETWEEN @StartDate and @EndDate
and O.Order_Status_ID in (0,1,2,4)
)

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RevenueFromRenewals]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RevenueFromRenewals]
	TO [davor.dumeljic]
GO
