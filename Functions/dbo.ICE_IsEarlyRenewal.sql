SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION dbo.ICE_IsEarlyRenewal(@Order_Detail_ID int)
RETURNS BIT
AS

BEGIN
--DECLARE @Order_Detail_ID int
--SET @Order_Detail_ID = 23376

DECLARE @Result bit
SET @Result = 0

DECLARE @Exp_Date datetime
SET @Exp_Date = dbo.ICE_GetOrderDetailExpiry(@Order_Detail_ID)

DECLARE @Ord_Date datetime
SET @Ord_Date = (
    SELECT top 1 Order_Date 
    FROM ICE_Orders O 
    inner join ICE_Order_Details OD on O.Order_ID = OD.Order_Detail_Id
    inner join ICE_Extension_Details ED on O.Order_ID = ED.Order_ID
    WHERE (OD.Order_Detail_Id = @Order_Detail_ID or ED.Extension_Order_Detail_ID = @Order_Detail_ID)
    ORDER BY Order_Date DESC)

DECLARE @Date_Diff int
IF MONTH(@Ord_Date) = 2 and DAY(@Ord_Date) = 29
    SET @Date_Diff = DATEDIFF(d, @Exp_Date, CONVERT(datetime, CONVERT(varchar, YEAR(@Exp_Date)) + '-' + CONVERT(VARCHAR, MONTH(@Ord_Date)) + '-' + CONVERT(VARCHAR, DAY(@Ord_Date) - 1) + ' 00:00:00'))
ELSE 
    SET @Date_Diff = DATEDIFF(d, @Exp_Date, CONVERT(datetime, CONVERT(varchar, YEAR(@Exp_Date)) + '-' + CONVERT(VARCHAR, MONTH(@Ord_Date)) + '-' + CONVERT(VARCHAR, DAY(@Ord_Date)) + ' 00:00:00'))

IF @Date_Diff < 0 
    SET @Date_Diff = @Date_Diff * (-1)

IF @Date_Diff < 32
    SET @Result = 1
ELSE
    SET @Result = 0

RETURN @Result

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsEarlyRenewal]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsEarlyRenewal]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsEarlyRenewal]
	TO [davor.dumeljic]
GO
