SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_LeadWebActivityScore3]
(
    @Sales_Lead_ID int
)
returns int
as
begin    
    DECLARE @Web_Score int
    DECLARE @AuthorID int

    SELECT @AuthorID = S.Author_ID
    FROM ICE_SalesLeads S WHERE SalesLeadId = @Sales_Lead_ID

    SELECT @Web_Score = SUM(ISNULL(PS.Score, 1))
    FROM ICE_Page_Visits PV
    INNER JOIN ICE_Web_Visitors WV on PV.TrackingID = WV.Web_Visitor_ID
    FULL JOIN ICE_Page_Score PS on PV.Short_URL = PS.Page
    WHERE Wv.RegisterID = @AuthorID

    if @Web_Score is null
	   SET @Web_Score = 0
    
    return @Web_Score
end
GO
