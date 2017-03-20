SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetLeadScoreAsText]
(
    @LeadID int,
    @DateFrom datetime,
    @DateTo datetime
)
RETURNS nvarchar(2000)
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
    FROM ICE_SalesLeads S WHERE SalesLeadId = @LeadID    

    If @Product_Score is null
	   SET @Product_Score = 0

    select @Web_Score = dbo.ICE_LeadWebActivityScore(@LeadID, @DateFrom, @DateTo)
    select @Visits_Score = dbo.ICE_LeadWebVisitsScore(@LeadID, @DateFrom, @DateTo)

    SELECT @Country_Score = 
	   case @Country
	   WHEN 'USA' THEN 20	   
	   ELSE 0
	   end

    if @Country_Score is null	  
	   SET @Country_Score = 0  

    If @Country_Score is null	  
	   set @Country_Score = 0    

    SET @LeadEmail = SUBSTRING(@LeadEmail,CHARINDEX('@',@LeadEmail,1) + 1 ,LEN(@LeadEmail) - CHARINDEX('@',@LeadEmail,1) + 1)

    select @Email_Score = case dbo.IsFreeEmail(@LeadEmail)
	   WHEN 0 THEN 20
	   ELSE 0
	   end
    
    if @Email_Score is null
	   set @Email_Score = 0    

    
    SELECT @MC_Score = dbo.ICE_LeadEmailActivityScore(@LeadID, @DateFrom, @DateTo)    

    return 'Email: ' + CONVERT(nvarchar(5), @Email_Score) + 
	   '; Website: ' + CONVERT(nvarchar(5), @Web_Score) + 
	   '; Country: ' + CONVERT(nvarchar(5), @Country_Score) + 
	   '; Number Of Visits: ' + CONVERT(nvarchar(5), @Visits_Score) + 
	   '; MailChimp: ' + CONVERT(nvarchar(5), @MC_Score) + 
	   '; Product: ' + CONVERT(nvarchar(5), @Product_Score)

END 
GO
GRANT EXECUTE
	ON [dbo].[GetLeadScoreAsText]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[GetLeadScoreAsText]
	TO [davor.dumeljic]
GO
