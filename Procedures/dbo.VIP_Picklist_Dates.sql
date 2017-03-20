SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_Picklist_Dates]	
AS
BEGIN
	SELECT Name, Value FROM
	(
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
	ON [dbo].[VIP_Picklist_Dates]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates]
	TO [davor.dumeljic]
GO
