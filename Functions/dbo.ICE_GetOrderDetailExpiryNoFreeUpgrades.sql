SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ICE_GetOrderDetailExpiryNoFreeUpgrades] 
(
    @Order_Detail_ID int
)
returns datetime
as
BEGIN

DECLARE @Expiry DATETIME

SELECT @Expiry = Max(Extension_Expiry) from ICE_Extension_Details where Extension_Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)

IF @Expiry is null
         SELECT @Expiry = DateAdd(Year, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID where ICE_Order_Details.Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)

RETURN @Expiry
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailExpiryNoFreeUpgrades]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailExpiryNoFreeUpgrades]
	TO [davor.dumeljic]
GO
