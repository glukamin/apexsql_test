SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE   ICE_sp_QuarterlySalesRevenueChanges_07_09
AS
BEGIN
	CREATE TABLE #2007 (Quarter varchar(1), [Year] varchar(6), Total real)
	CREATE TABLE #2008 (Quarter varchar(1), [Year] varchar(6), Total real)
	CREATE TABLE #2009 (Quarter varchar(1), [Year] varchar(6), Total real)
	CREATE TABLE #2010 (Quarter varchar(1), [Year] varchar(6), Total real)
	
	INSERT INTO #2007	
	SELECT substring(Year, 6, 1), Year, Total FROM ICE_TotalSalesByQuarter('11/01/2006','10/31/2007 23:59:59')
	
	INSERT INTO #2008
	SELECT substring(Year, 6, 1), Year, Total FROM ICE_TotalSalesByQuarter('11/01/2007','10/31/2008 23:59:59')
	
	INSERT INTO #2009
	SELECT substring(Year, 6, 1), Year, Total FROM ICE_TotalSalesByQuarter('11/01/2008','10/31/2009 23:59:59')
	
	INSERT INTO #2010
	SELECT substring(Year, 6, 1), Year, Total FROM ICE_TotalSalesByQuarter('11/01/2009','10/31/2010 23:59:59')
		
	CREATE TABLE #Results (
		Row_number int, 
		Quarter_2007 varchar(6), 
		Sales_2007 varchar(50), 
		No_Results varchar(50), 
		Quarter_2008 varchar(6), 
		Sales_2008 varchar(50), 
		Change_2007_2008 varchar(50),
		Change_Percent_2007_2008 varchar(50),
		Quarter_2009 varchar(6), 
		Sales_2009 varchar(50), 
		Change_2008_2009 varchar(50),
		Change_Percent_2008_2009 varchar(50),
		Quarter_2010 varchar(6), 
		Sales_2010 varchar(50), 
		Change_2009_2010 varchar(50),
		Change_Percent_2009_2010 varchar(50)
		)
		
	INSERT INTO #Results
	SELECT  6, '',
		CONVERT(varchar(50), CONVERT(int, SUM(#2007.Total))), '', '', 
		CONVERT(varchar(50), CONVERT(int, SUM(#2008.Total))), 
		CONVERT(varchar(50), CONVERT(int, SUM(#2008.Total) - SUM(#2007.Total))), 
		CONVERT(varchar(50), ROUND((SUM(#2008.Total) - SUM(#2007.Total))/SUM(#2007.Total)*100,2)), '', 
		CONVERT(varchar(50), CONVERT(int, SUM(#2009.Total))), 
		CONVERT(varchar(50), CONVERT(int, SUM(#2009.Total) - SUM(#2008.Total))), 
		CONVERT(varchar(50), ROUND((SUM(#2009.Total) - SUM(#2008.Total))/SUM(#2008.Total)*100,2)), '',
		CONVERT(varchar(50), CONVERT(int, SUM(#2010.Total))), 
		CONVERT(varchar(50), CONVERT(int, SUM(#2010.Total) - SUM(#2009.Total))), 
		CONVERT(varchar(50), ROUND((SUM(#2010.Total) - SUM(#2009.Total))/SUM(#2009.Total)*100,2))
		FROM #2007 
		INNER JOIN #2008 ON #2007.Quarter = #2008.Quarter
		INNER JOIN #2009 ON #2008.Quarter = #2009.Quarter
		LEFT JOIN #2010 ON #2009.Quarter = #2010.Quarter
				
	INSERT INTO #Results			
	SELECT  Convert(int, #2007.Quarter),
		#2007.Year AS [Q-#-Yr],
		CONVERT(varchar(50), #2007.Total) AS [Q. Sales],
		'No prior year comparative data',
		CONVERT(varchar(50), #2008.Year) AS [Q-#-Yr],
		CONVERT(varchar(50), #2008.Total) AS [Q. Sales],
		CONVERT(varchar(50), #2008.Total - #2007.Total) AS [Change $],
		CONVERT(varchar(50), ROUND((#2008.Total - #2007.Total)/#2007.Total*100,2)) AS [Change %],
		
		#2009.Year AS [Q-#-Yr],
		CONVERT(varchar(50), #2009.Total) AS [Q. Sales],
		CONVERT(varchar(50), #2009.Total - #2008.Total) AS [Change $],
		CONVERT(varchar(50), ROUND((#2009.Total - #2008.Total)/#2008.Total*100, 2)) AS [Change %],
		
		CONVERT(varchar(50), #2010.Year) AS [Q-#-Yr],
		CONVERT(varchar(50), #2010.Total) AS [Q. Sales],
		CONVERT(varchar(50), #2010.Total - #2009.Total) AS [Change $],
		CONVERT(varchar(50), ROUND((#2010.Total - #2009.Total)/#2009.Total*100,2)) AS [Change %]
	FROM #2007 
	INNER JOIN #2008 ON #2007.Quarter = #2008.Quarter
	INNER JOIN #2009 ON #2008.Quarter = #2009.Quarter
	LEFT JOIN #2010 ON #2009.Quarter = #2010.Quarter
		
		
	--INSERT INTO #Results		
	--SELECT 5, '', 'Yr Total', '', '', 'Yr Total', 'Yr Change', '', '', 'Yr Total', 'Yr Change','','','','',''
		
	SELECT Quarter_2007, 
		Sales_2007, 
		No_Results, 
		Quarter_2008,
		Sales_2008, 
		Change_2007_2008,
		Change_Percent_2007_2008,
		Quarter_2009, 
		Sales_2009, 
		Change_2008_2009,
		Change_Percent_2008_2009,
		Quarter_2010 , 
		Sales_2010 , 
		Change_2009_2010 ,
		Change_Percent_2009_2010 
	FROM #Results	
	ORDER BY #Results.Row_number	
END

GO
GRANT EXECUTE
	ON [apexsql].[ICE_sp_QuarterlySalesRevenueChanges_07_09]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[ICE_sp_QuarterlySalesRevenueChanges_07_09]
	TO [davor.dumeljic]
GO
