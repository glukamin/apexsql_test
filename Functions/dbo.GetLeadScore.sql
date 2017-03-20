SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetLeadScore]
(
    @LeadID int,
    @DateFrom datetime,
    @DateTo datetime
)
RETURNS int
AS 
BEGIN
    DECLARE @Web_Score int
    DECLARE @Country_Score int
    DECLARE @Visits_Score int
    DECLARE @Email_Score int
    DECLARE @AuthorID int
    DECLARE @Country nvarchar(50)
    DECLARE @LeadEmail nvarchar(100)
    DECLARE @MC_Score int
    DECLARE @Product_Score int

    SELECT @AuthorID = S.Author_ID,
    @Country = S.Country,
    @LeadEmail = s.Email,
    @Product_Score = (
	   case S.First_Downloaded_Product_ID
	   when 183236 /* Log */ then 6
	   when 300100681 /* Recover */ then 5
	   when 141573 /* Audit */ then 4
	   when 167831 /* Diff */ then 4
	   when 204978 /* Univ Studio */ then 4
	   when 300267612 /* Data Diff */ then 3
	   when 202696 /* Doc */ then 3
	   else 0
	   end )
    FROM ICE_SalesLeads S WITH (nolock) WHERE SalesLeadId = @LeadID
        
    SELECT @Web_Score = isnull(SUM(ISNULL(PS.Score, 1)), 0),
     @Visits_Score = isnull((COUNT(PS.Score)-1)*5, 0)
    FROM ICE_Page_Visits PV WITH (nolock)
    INNER JOIN ICE_Web_Visitors WV WITH (nolock) on PV.TrackingID = WV.Web_Visitor_ID
    FULL JOIN ICE_Page_Score PS on PV.Short_URL = PS.Page
    WHERE Wv.RegisterID = @AuthorID AND PV.VisitTime BETWEEN @DateFrom AND @DateTo


    SELECT @Country_Score = 
	   case @Country
	   WHEN 'USA' THEN 20	
	   WHEN 'UNITED STATES' THEN 20	
	   ELSE 0
	   end

    if @Country_Score is null	  
	   SET @Country_Score = 0  

    If @Country_Score is null	  
	   SET @Country_Score = 0    

    If @Product_Score is null
	   SET @Product_Score = 0

    SET @LeadEmail = SUBSTRING(@LeadEmail,CHARINDEX('@',@LeadEmail,1) + 1 ,LEN(@LeadEmail) - CHARINDEX('@',@LeadEmail,1) + 1)

    select @Email_Score = case dbo.IsFreeEmail(@LeadEmail)
	   WHEN 0 THEN 20
	   ELSE 0
	   end
    
    if @Email_Score is null
	   SET @Email_Score = 0

    SELECT @MC_Score = dbo.ICE_LeadEmailActivityScore(@LeadID, @DateFrom, @DateTo)    

    return  @Email_Score + @Web_Score + @Country_Score + @MC_Score + @Visits_Score + @Product_Score

END 
GO
GRANT EXECUTE
	ON [dbo].[GetLeadScore]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[GetLeadScore]
	TO [davor.dumeljic]
GO
