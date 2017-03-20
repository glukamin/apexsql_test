SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[ICE_GetUnlockCodeExpiry](@Unlock_Code_ID int)
returns datetime
as
Begin
declare @Order_Detail_ID int
Select @Order_Detail_ID=Order_Detail_ID from ICE_Unlock_Codes where Unlock_Code_ID=ISNULL(@Unlock_Code_ID, 0)
declare @Free_Upgrades tinyint, @Expiry datetime
Select @Free_Upgrades = ICE_Orders.Free_Upgrades from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID where ICE_Order_Details.Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetUnlockCodeExpiry]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetUnlockCodeExpiry]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetUnlockCodeExpiry]
	TO [davor.dumeljic]
GO