SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  dbo.ICE_sp_MonthlySales_08_09
AS
BEGIN
      	CREATE TABLE #2008 (Row_number int ,Month_Name varchar(20) ,Total float ,Revenue float )
      	CREATE TABLE #2009 (Row_number int ,Month_Name varchar(20) ,Total float ,Revenue float )			
	CREATE TABLE #Results
	(
		Row_number int ,Month_Name_2008 varchar(20) ,Total_2008 varchar(20) ,Revenue_2008 varchar(20) ,
		Month_Name_2009 varchar(20) ,Total_2009 varchar(20) ,Revenue_2009 varchar(100) 
	)
	
      	INSERT INTO #2008
	SELECT
      	Month,
     	MonthName = dbo.ICE_GetMonthName(T.Month) ,
        T.Total,
      	0
 	FROM
     	( 	
		SELECT TOP 100 PERCENT
           	Month = Year(Order_Date) * 100 + Month(Order_Date) ,
           	Total = CONVERT(float , Sum(ROUND(Total , 0)))
		FROM
			ICE_Orders
		WHERE
			Order_Status_ID IN ( 0 , 1 , 2 , 4 ) AND Order_Date >= '01/01/2008' AND Order_Date <= '12/31/2008'
		GROUP BY
		Year(Order_Date) * 100 + Month(Order_Date) 
	) AS T
	
	UPDATE #2008
	SET Revenue = CASE 
			WHEN Row_number = 200803 THEN (SELECT dbo.ICE_GetSalesByQuarter(2008,1))	
			WHEN Row_number = 200806 THEN (SELECT dbo.ICE_GetSalesByQuarter(2008,2))
			WHEN Row_number = 200809 THEN (SELECT dbo.ICE_GetSalesByQuarter(2008,3))
			WHEN Row_number = 200812 THEN (SELECT dbo.ICE_GetSalesByQuarter(2008,4))
			ELSE 0
			END
	
	INSERT INTO #2009
	SELECT
      	Month,
     	MonthName = dbo.ICE_GetMonthName(T.Month) ,
        T.Total,
      	0
 	FROM
     	( 	
		SELECT TOP 100 PERCENT
           	Month = Year(Order_Date) * 100 + Month(Order_Date) ,
           	Total = CONVERT(float , Sum(ROUND(Total , 0)))
		FROM
			ICE_Orders
		WHERE
			Order_Status_ID IN ( 0 , 1 , 2 , 4 ) AND Order_Date >= '01/01/2009' AND Order_Date <= '12/31/2009'
		GROUP BY
		Year(Order_Date) * 100 + Month(Order_Date) 
	) AS T
	
	UPDATE #2009
	SET Revenue = CASE 
			WHEN Row_number = 200903 THEN (SELECT dbo.ICE_GetSalesByQuarter(2009,1))	
			WHEN Row_number = 200906 THEN (SELECT dbo.ICE_GetSalesByQuarter(2009,2))
			WHEN Row_number = 200909 THEN (SELECT dbo.ICE_GetSalesByQuarter(2009,3))
			WHEN Row_number = 200912 THEN (SELECT dbo.ICE_GetSalesByQuarter(2009,4))
			ELSE 0
			END
			
	INSERT INTO #Results		
	SELECT #2008.*, #2009.Month_Name, #2009.Total, #2009.Revenue
	FROM #2008 
	LEFT JOIN #2009 on (#2008.Row_number % 100) = (#2009.Row_number % 100)	
	
	INSERT INTO #Results
	SELECT 200813, '','', (SELECT CONVERT(int, SUM(Revenue)) FROM #2008),'','', (SELECT CONVERT(int, SUM(Revenue)) FROM #2009)
	
	INSERT INTO #Results
	SELECT 200814,'',
	(SELECT AVG(Total) FROM #2008 WHERE (#2008.Row_number % 100) <= MONTH(GETDATE()) - 1)
	,'','',
	(SELECT AVG(Total) FROM #2009 WHERE (#2009.Row_number % 100) <= MONTH(GETDATE()) - 1)
	,'running monthly average up to and including last complete month'
	
	INSERT INTO #Results
	SELECT 200815,'',
	(SELECT AVG(Total) FROM #2008) 
	,'total yr avg','',
	(SELECT AVG(Total) FROM #2009 )
	,'yearlong running monthly avg including current incomplete month'
	
	SELECT Month_Name_2008 ,Total_2008  ,Revenue_2008 ,
		Month_Name_2009 ,Total_2009 ,Revenue_2009 
	FROM #Results
	ORDER BY #Results.Row_number
	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlySales_08_09]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlySales_08_09]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlySales_08_09]
	TO [davor.dumeljic]
GO
