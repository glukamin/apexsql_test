SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create function dbo.ICE_LeadEmailActivityScore
(
    @Sales_Lead_ID int,
    @DateFrom datetime,
    @DateTo datetime
)
returns int
as
begin
    DECLARE @MC_Score int
    SELECT @MC_Score = SUM(P.Action_Point)
    FROM
    (
	   -- 5 is a score for opened email and 7 is a score for click in an email...
	   SELECT 
	   CASE [Action]
		  WHEN 'open' THEN 5
		  ELSE 7
	   END AS [Action_Point]

	   from ICE_MC_Lead_Activities 
	   WHERE Lead_ID = @Sales_Lead_ID
	   AND Action_Date between @DateFrom and @DateTo
	   -- CONVERT(varchar(20), DATEPART(HOUR, Action_Date)/3*3 
	   --this part makes it that only one actioin for every 3 hours is taken into account
	   group by CONVERT(datetime, CONVERT(varchar(20), CONVERT(date, Action_Date))+ ' ' + CONVERT(varchar(20), DATEPART(HOUR, Action_Date)/3*3) + ':00:00'),
	   [Action], Campaign
    ) P

    IF @MC_Score is null
	   SET @MC_Score = 0
    
    RETURN @MC_Score

end
GO
GRANT EXECUTE
	ON [dbo].[ICE_LeadEmailActivityScore]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_LeadEmailActivityScore]
	TO [davor.dumeljic]
GO
