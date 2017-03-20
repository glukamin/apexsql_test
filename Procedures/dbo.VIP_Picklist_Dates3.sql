SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:	Dragan Radivojevic
-- Create date: 07/23/2009
-- Description:	Retrieves a picklist of dates used for some reports
-- =============================================
CREATE PROCEDURE  [dbo].[VIP_Picklist_Dates3]	
AS
BEGIN
	SELECT Name, Value FROM
	(
		SELECT 'This Month' as Name, dbo.VIP_DateSubstract(GETDATE() ,0 ,0 , DATEPART(dd, GETDATE())-1) as Value, 0 as Ord
		UNION
		SELECT 'Last 30 days' as Name, dbo.VIP_DateSubstract(GETDATE(),0,0,30) as Value, 1 as Ord
		UNION
		SELECT 'Last 90 days' as Name, dbo.VIP_DateSubstract(GETDATE(),0,0,90)  as Value, 2 as Ord
		UNION
		SELECT 'Last year' as Name, dbo.VIP_DateSubstract(GETDATE(),1,0,0) as Value, 3 as Ord
		UNION
		SELECT 'All time' as Name, dbo.VIP_DateSubstract(GETDATE(),10,0,0) as Value, 4 as Ord
	) as T
	ORDER BY T.Ord
END


GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates3]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates3]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates3]
	TO [davor.dumeljic]
GO
