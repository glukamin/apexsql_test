SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[ICE_TotalSalesByQuarter]
(
@DateBegin datetime,
@DateEnd datetime
)
RETURNS TABLE
AS
RETURN

select top 100 percent
T.Year,
T.Total
from
(
Select Top 100 percent
Year = CONVERT(varchar(4),dbo.ICE_GetQuarterYear(Order_Date)) + '-' + CONVERT(varchar(1), dbo.ICE_Quarter(Order_Date)),
Total = convert(float, Sum(ROUND(Total, 0)))

from
ICE_Orders
where
Order_Status_ID in (0,1,2,4) and
Order_Date >=@DateBegin and
Order_Date<=@DateEnd

Group by
CONVERT(varchar(4),dbo.ICE_GetQuarterYear(Order_Date)) + '-' + CONVERT(varchar(1), dbo.ICE_Quarter(Order_Date))
) T order by T.Year 
GO
GRANT SELECT
	ON [dbo].[ICE_TotalSalesByQuarter]
	TO [adrijan.bandu]
GO
GRANT SELECT
	ON [dbo].[ICE_TotalSalesByQuarter]
	TO [davor.dumeljic]
GO
