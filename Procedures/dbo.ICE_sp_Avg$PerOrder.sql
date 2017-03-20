SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_Avg$PerOrder](@DateBegin DATETIME, @DateEnd DATETIME)
as
SELECT Round(Avg(Total), 2) as Avg 
FROM ICE_Orders WHERE Order_Date>=@DateBegin and Order_Date<=@DateEnd and Order_Status_ID in (0, 1, 2, 4)
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Avg$PerOrder]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Avg$PerOrder]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Avg$PerOrder]
	TO [davor.dumeljic]
GO
