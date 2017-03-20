SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_LeadWebVisitsScore3]
(
    @Sales_Lead_ID int
)
returns int
as
begin
    DECLARE @Visits_Score int
    DECLARE @AuthorID int

    SELECT @AuthorID = S.Author_ID
    FROM ICE_SalesLeads S WHERE SalesLeadId = @Sales_Lead_ID

    select @Visits_Score = COUNT(P.Visit_Date) 
    FROM
    (
	   SELECT distinct CONVERT(date, VisitTime) as Visit_Date
	   FROM ICE_Page_Visits PV
	   INNER JOIN ICE_Web_Visitors WV on PV.TrackingID = WV.Web_Visitor_ID
	   --FULL JOIN ICE_Page_Score PS on PV.Short_URL = PS.Page
	   WHERE Wv.RegisterID = @AuthorID
	   --group by CONVERT(date, VisitTime)    
    ) P 

    /*This is multiplied by 5 because lead gets 5 points per visit*/
    if @Visits_Score > 0
	   SET @Visits_Score = (@Visits_Score - 1) * 5 
    
    if @Visits_Score is null
	   SET @Visits_Score = 0
        
    return @Visits_Score
end
GO
