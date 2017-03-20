SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_GetBundleActiveProduct]
(
@StartDate datetime,
@EndDate datetime,
@ProductID int
)
AS
BEGIN
	SELECT (SELECT ip2.Product_Name FROM dbo.ICE_Products ip2 WHERE ip2.Product_ID = iuc.Product_ID) AS product,
count(distinct ia.Hardware_ID) AS ActivateCount
 FROM dbo.ICE_Activations ia WITH (NOLOCK)
INNER JOIN dbo.ICE_Unlock_Codes iuc WITH (NOLOCK) ON iuc.Unlock_Code_ID = ia.Unlock_Code_ID
INNER JOIN dbo.ICE_Order_Details iod WITH (NOLOCK) ON iod.Order_Detail_Id = iuc.Order_Detail_ID
INNER JOIN dbo.ICE_Products ip WITH (NOLOCK) ON ip.Product_ID = @ProductID
INNER JOIN dbo.ICE_Orders io WITH (NOLOCK) ON io.Order_ID = iod.Order_ID
	WHERE io.Order_Date BETWEEN @StartDate AND @EndDate 
	AND ia.Process_Date BETWEEN @StartDate AND @EndDate  
AND ia.Failed = 0
AND iod.Product_ID = @ProductID
AND ia.Reactivation not in (1)
AND ip.Bundle_Products LIKE '%' + CONVERT(varchar , iuc.Product_ID) + '%'
AND iuc.Order_ID != 25024
GROUP BY iuc.Product_ID
END
GO
