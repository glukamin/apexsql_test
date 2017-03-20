SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Activations_per_bundle]
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN
SET @DateEnd = DATEADD(day,1, @DateEnd );
WITH Temp_data as(
	SELECT iod.Product_ID AS bundleID, iod.Order_Detail_Id, iuc.Unlock_Code AS UnlocCode, iuc.Product_ID, MAX(ia.Activation_ID) AS activationID FROM dbo.ICE_Order_Details iod
	INNER JOIN dbo.ICE_Orders io ON io.Order_ID = iod.Order_ID
	INNER JOIN dbo.ICE_Unlock_Codes iuc ON iuc.Order_Detail_ID = iod.Order_Detail_Id
	LEFT JOIN dbo.ICE_Activations ia ON ia.Unlock_Code_ID = iuc.Unlock_Code_ID
	WHERE iod.Product_ID IN (204978, 300625332, 141582) AND io.Order_ID NOT IN (18413, 16014) AND io.Order_Date >= @DateStart AND io.Order_Date <= @DateEnd AND io.Order_Status_ID IN (-2,-1,0,1,2,4)
	GROUP BY iod.Order_Detail_Id, iuc.Product_ID, iod.Product_ID, iuc.Unlock_Code)

	SELECT 'ApexSQL Universal' AS Product_Name, count(DISTINCT ud.Order_Detail_Id) AS NoActivate FROM Temp_data ud
	WHERE ud.bundleID = 204978
	UNION ALL
	SELECT ip.Product_Name, count(u.activationID) AS NoActivate FROM Temp_data u
	INNER JOIN dbo.ICE_Products ip ON u.Product_ID = ip.Product_ID
	WHERE u.bundleID = 204978
	GROUP BY ip.Product_Name
	UNION ALL 
	SELECT 'ApexSQL DBA' AS Product_Name, count(DISTINCT DbaD.Order_Detail_Id) AS NoActivate FROM Temp_data DbaD
	WHERE DbaD.bundleID = 300625332
	UNION ALL
	SELECT ip.Product_Name, count(DbaD.activationID) AS NoActivate FROM Temp_data DbaD
	INNER JOIN dbo.ICE_Products ip ON DbaD.Product_ID = ip.Product_ID
	WHERE DbaD.bundleID = 300625332
	GROUP BY ip.Product_Name
	UNION ALL 
	SELECT 'ApexSQL Developer' AS Product_Name, count(DISTINCT DevD.Order_Detail_Id) AS NoActivate FROM Temp_data DevD
	WHERE DevD.bundleID = 141582
	UNION ALL
	SELECT ip.Product_Name, count(DevD.activationID) AS NoActivate FROM Temp_data DevD
	INNER JOIN dbo.ICE_Products ip ON DevD.Product_ID = ip.Product_ID
	WHERE DevD.bundleID = 141582
	GROUP BY ip.Product_Name

END
GO
