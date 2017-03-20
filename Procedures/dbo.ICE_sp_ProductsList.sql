SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_ProductsList]
As
Select Product_ID, Product_Name from ICE_Products where Not Product_ID in (163225) Order by Product_Name
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductsList]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductsList]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductsList]
	TO [davor.dumeljic]
GO
