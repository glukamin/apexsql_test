SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.VIP_Picklist_Top_10_20_50	
AS
BEGIN
	SELECT 'Top 10' as Name, 10 as Value
	UNION
	SELECT 'Top 20', 20
	UNION
	SELECT 'Top 50', 50	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Top_10_20_50]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Top_10_20_50]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Picklist_Top_10_20_50]
	TO [davor.dumeljic]
GO
