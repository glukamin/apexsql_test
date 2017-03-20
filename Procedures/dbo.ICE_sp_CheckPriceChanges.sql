SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_CheckPriceChanges]
(
@ProductID int,
@ForDate datetime
)
AS
BEGIN
    SELECT TOP 1 PPL.Price, PPL.Date_Changed FROM [dbo].[ICE_Products_Price_Log] PPL
	WHERE PPL.[Product_ID] = @ProductID AND PPL.[Date_Changed] <= @ForDate
	ORDER BY PPL.[Date_Changed] DESC
END
GO
