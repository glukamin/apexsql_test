SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_BundleList]
As
Select Product_ID, Product_Name from ICE_Products where Not Product_ID in (163225) AND Bundle_Products IS NOT NULL Order by Product_Name
GO
