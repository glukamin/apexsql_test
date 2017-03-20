SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_GetLeadActivity]
(
@Sales_Lead_ID int
)
AS
BEGIN
    SELECT top 500 Z.Field1, Z.Field2
    FROM
    (
    SELECT P.OrderNum as OrderNum,
    P.Short_URL as Field1,
    CONVERT(nvarchar(100), P.VisitTime) as Field2
    FROM
    (
	   SELECT top 400 V.Short_URL, V.VisitTime, ROW_NUMBER() OVER (ORDER BY V.VisitTime DESC) as OrderNum
	   FROM ICE_Page_Visits V WITH(NOLOCK)
	   INNER JOIN ICE_Web_Visitors W WITH(NOLOCK) on V.TrackingID = W.Web_Visitor_ID
	   WHERE W.RegisterID = (SELECT TOP 1 Author_ID FROM ICE_SalesLeads WHERE SalesLeadId = @Sales_Lead_ID)
	   ORDER BY V.VisitTime desc
    ) P

    UNION ALL
    SELECT -300 as OrderNum,
    'Product: ' as Field1,
    CONVERT(nvarchar(100),Product_Name) as Field2
    FROM ICE_SalesLeads
    INNER JOIN ICE_Products on Product_ID = First_Downloaded_Product_ID
    WHERE SalesLeadId = @Sales_Lead_ID

    UNION ALL
    SELECT -299 as OrderNum,
    'Country: ' as Field1,
    CONVERT(nvarchar(100),Country) as Field2
    FROM ICE_SalesLeads
    WHERE SalesLeadId = @Sales_Lead_ID

    UNION ALL
    SELECT -298 as OrderNum,
    'Emial: ' as Field1,
    CONVERT(nvarchar(100),Email) as Field2
    FROM ICE_SalesLeads
    WHERE SalesLeadId = @Sales_Lead_ID

    UNION ALL
    SELECT -297 as OrderNum,
    'Number of visits: ' as Field1,
    (
	   SELECT CONVERT(nvarchar(100), COUNT(*))
	   FROM
	   (
		  SELECT DISTINCT DAY(V.VisitTime) as DayOfVisit
		  FROM ICE_Page_Visits V WITH(NOLOCK)
		  INNER JOIN ICE_Web_Visitors W WITH(NOLOCK) on V.TrackingID = W.Web_Visitor_ID
		  WHERE W.RegisterID = (SELECT TOP 1 Author_ID FROM ICE_SalesLeads WHERE SalesLeadId = @Sales_Lead_ID)
	   ) G
    ) as Field2

    UNION ALL    
    select 
    ROW_NUMBER() OVER (ORDER BY Action_Date DESC) - 100 as OrderNum,
    'Email action: ' + [Action] + '; Campaign: ' + Campaign as Field1, 
    CONVERT(nvarchar(100), Action_Date) as Field2   
    from ICE_MC_Lead_Activities
    where Lead_ID = @Sales_Lead_ID


    ) Z
    Order by Z.OrderNum, Z.Field1
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLeadActivity]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLeadActivity]
	TO [davor.dumeljic]
GO
