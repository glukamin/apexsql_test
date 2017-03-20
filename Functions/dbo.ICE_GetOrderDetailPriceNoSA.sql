SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ICE_GetOrderDetailPriceNoSA](@Order_Detail_ID int)
returns money
as
Begin
declare @result money
set @result = 0

declare @Total money
SET @Total = (select Total from ICE_Order_Details where Order_Detail_Id = @Order_Detail_ID)

declare @SA int
SET @SA = (select Maintenance_ID from ICE_Order_Details where Order_Detail_Id = @Order_Detail_ID)

SET @result = @Total

if @SA = 1
	SET @result =  @Total / 1.25
if @SA = 2
	SET @result = @Total / 1.4
if @SA = 3
	SET @result = @Total / 1.45

return @result

End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailPriceNoSA]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailPriceNoSA]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailPriceNoSA]
	TO [davor.dumeljic]
GO
