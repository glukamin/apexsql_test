SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[VIP_Picklist_Dates2]
AS
BEGIN
	SELECT Name, Value FROM
	(
		SELECT 'All time' as Name, dbo.VIP_DateSubstract(GETDATE(),10,0,0) as Value, 3 as Ord
		UNION		
		SELECT 'In last 1 year' as Name, dbo.VIP_DateSubstract(GETDATE(),1,0,0) as Value, 1 as Ord		
	) as T
	ORDER BY T.Ord
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Dates2]
	TO [davor.dumeljic]
GO
