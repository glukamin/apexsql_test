SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Unique_activations_per_individual_product]
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN
SET @DateEnd = DATEADD(day,1, @DateEnd );
	
	WITH ActivProduct as(
	SELECT iod.Order_ID, iuc.Unlock_Code, iod.Product_ID, MIN(io.Order_Date) AS Order_Date, MIN(ia.Process_Date) AS Process_Date, DATEDIFF(day,MIN(io.Order_Date), MIN(ia.Process_Date)) AS DiffDate FROM dbo.ICE_Order_Details iod
	INNER JOIN dbo.ICE_Orders io ON io.Order_ID = iod.Order_ID
	INNER JOIN dbo.ICE_Unlock_Codes iuc ON iuc.Order_Detail_ID = iod.Order_Detail_Id
	LEFT JOIN dbo.ICE_Activations ia ON ia.Unlock_Code_ID = iuc.Unlock_Code_ID
	WHERE io.Order_ID NOT IN (18413, 16014) AND  io.Order_Date >= @DateStart AND io.Order_Date <= @DateEnd AND io.Order_Status_ID IN (-2,-1,0,1,2,4)
	GROUP BY iod.Order_ID, iuc.Unlock_Code, iod.Product_ID)

	SELECT ip.Product_Name, 
	count(ip.Product_Name) AS '#OrdersPurchased',
	count(ap.Process_Date) AS '#Activation',
	(sum(ap.DiffDate) / count(ap.Process_Date)) AS Average#DaysPurchaseToActivate
	FROM ActivProduct ap
	INNER JOIN dbo.ICE_Products ip ON ap.Product_ID = ip.Product_ID
	GROUP BY ip.Product_Name

END
GO
