SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_Sales_Lead_Subscriptions
(
 @StartDate datetime ,
 @EndDate datetime )
AS
BEGIN
      DECLARE @TotalSalesLeads float
      DECLARE @SubscribedLeads float

      SET @TotalSalesLeads = ( SELECT
                                   count(*)
                               FROM
                                   ICE_SalesLeads S INNER JOIN tblAuthor A
                                   ON S.Author_ID = A.Author_ID
                               WHERE
                                   A.Join_date BETWEEN @StartDate AND @EndDate AND A.Active = 1 )

      SET @SubscribedLeads = ( SELECT
                                   Count(*)
                               FROM
                                   ICE_SalesLeads S INNER JOIN tblAuthor A
                                   ON S.Author_Id = A.Author_ID INNER JOIN apexsql.Newsletter N
                                   ON S.Email = N.UserEmail
                               WHERE
                                   A.Active = 1 AND A.Join_date BETWEEN @StartDate AND @EndDate )

      SELECT
          @TotalSalesLeads as [Total_Sales_Leads] ,
          @SubscribedLeads as [Subscribed_Leads] ,
          ROUND(@SubscribedLeads / @TotalSalesLeads * 100 , 2) AS [Subscribed_%]
END	  
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Lead_Subscriptions]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Lead_Subscriptions]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Lead_Subscriptions]
	TO [davor.dumeljic]
GO
