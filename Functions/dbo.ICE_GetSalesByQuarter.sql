SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION dbo.ICE_GetSalesByQuarter
(
	@Year int,
	@Quarter int
)
RETURNS money
as 
BEGIN
	DECLARE @Result money
	DECLARE @DateStart datetime
	DECLARE @DateEnd datetime
	
	IF @Quarter > 4 OR @Quarter < 1 
		SET @Result = 0		
	ELSE
	BEGIN
		IF @Quarter = 1
		BEGIN
			SET @DateStart = '01/01/' + CONVERT(varchar(4), @Year) 
			SET @DateEnd = '03/31/' + CONVERT(varchar(4), @Year) 
		END
		IF @Quarter = 2
		BEGIN
			SET @DateStart = '04/01/' + CONVERT(varchar(4), @Year) 
			SET @DateEnd = '06/30/' + CONVERT(varchar(4), @Year)
		END
		IF @Quarter = 3
		BEGIN
			SET @DateStart = '07/01/' + CONVERT(varchar(4), @Year) 
			SET @DateEnd = '09/30/' + CONVERT(varchar(4), @Year) 
		END
		IF @Quarter = 4
		BEGIN
			SET @DateStart = '10/01/' + CONVERT(varchar(4), @Year) 
			SET @DateEnd = '12/31/' + CONVERT(varchar(4), @Year)
		END
			
		SET @Result = 
		(
			SELECT Sum(ROUND(Total , 0))
			FROM
				ICE_Orders
			WHERE
				Order_Status_ID IN ( 0 , 1 , 2 , 4 ) AND Order_Date >= @DateStart AND Order_Date <= @DateEnd
		)
	END
	
	RETURN @Result	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetSalesByQuarter]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetSalesByQuarter]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetSalesByQuarter]
	TO [davor.dumeljic]
GO
