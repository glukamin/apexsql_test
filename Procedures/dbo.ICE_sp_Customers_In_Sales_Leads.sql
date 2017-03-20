SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Customers_In_Sales_Leads]
(
 @StartDate datetime ,
 @EndDate datetime )
AS
BEGIN
      DECLARE @TotalSalesLeads float
      DECLARE @CustomersInLeads float

      SET @TotalSalesLeads = (SELECT dbo.ICE_NumberOfLeads(@StartDate, @EndDate))

      SET @CustomersInLeads = ( 
					   SELECT COUNT(*) 
					   FROM 
					   (
						  SELECT S.Email
						  FROM ICE_SalesLeads S
						  inner join ICE_Customers C on S.Email = C.Email
						  where S.Date_Added BETWEEN @StartDate and @EndDate
						  and S.Date_Added < C.Create_Date

						  union

						  SELECT S.Email
						  FROM ICE_SalesLeads S
						  inner join ICE_Contacts Cn on S.Email = Cn.Email_Ship
						  where S.Date_Added BETWEEN @StartDate and @EndDate
						  and S.Date_Added < Cn.Create_Date
					   ) P )

      SELECT
          @TotalSalesLeads AS [Total_Sales_Leads],
          @CustomersInLeads AS [Existing_Customers] ,
          ROUND(@CustomersInLeads / @TotalSalesLeads * 100 , 2) AS [Customers_%]
END	  


GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Customers_In_Sales_Leads]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Customers_In_Sales_Leads]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Customers_In_Sales_Leads]
	TO [davor.dumeljic]
GO
