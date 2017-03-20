SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  dbo.Forum_sp_ResponseTimePerApp
(
 	@DateStart datetime ,
 	@DateEnd datetime ,
 	@CategoryID int,
 	@HoursDelay int = 24
)
AS
BEGIN
      	SELECT DISTINCT
          dbo.ICE_GetMonthName(Year(T1.Message_date) * 100 + Month(T1.Message_date)) as [Month], 
          ROUND(CONVERT(real , AVG(DATEDIFF(hh , T1.Message_date , T2.Message_date))) / 24 , 2) AS Avg_Delay	  	  
     	FROM
          tblThread T1
      	JOIN tblThread T2 ON  T1.Topic_ID = T2.Topic_ID
      	JOIN tblAuthor A2 ON  T2.Author_ID = A2.Author_ID
      	JOIN tblAuthor A1 ON  T1.Author_ID = A1.Author_ID
     	WHERE
        DATEDIFF(hh , T1.Message_date , T2.Message_date) > @HoursDelay
        AND A2.Group_ID NOT IN ( 4 , 5 , 6 , 20 )
        AND A1.Group_ID IN ( 4 , 5 , 6 , 20 )
        AND A1.Active = 'True'
	AND (T1.Message_date BETWEEN @DateStart AND @DateEnd)
	AND (dbo.Forum_GetCategoryIDByTopic(T1.Topic_ID) = @CategoryID)
	AND (dbo.Forum_GetCategoryIDByTopic(T2.Topic_ID) = @CategoryID)
        AND NOT EXISTS ( SELECT
                               *
                           FROM
                               tblThread T
                           WHERE
                               T.Topic_ID = T1.Topic_ID
                               AND T.Message_date > T1.Message_date
                               AND T.Message_date < T2.Message_date )          
 	GROUP BY Year(T1.Message_date) * 100 + Month(T1.Message_date)
      	ORDER BY Avg_Delay DESC
END
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_ResponseTimePerApp]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_ResponseTimePerApp]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_ResponseTimePerApp]
	TO [davor.dumeljic]
GO
