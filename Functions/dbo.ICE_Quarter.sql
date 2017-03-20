SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dragan Radivojevic
-- Create date: 05/12/2009
-- Description:	Retrieves quarter of the year
-- =============================================
CREATE FUNCTION [dbo].[ICE_Quarter]
(
	@Date datetime
)
RETURNS int
AS
BEGIN
	IF Month(@Date) = 11 OR Month(@Date) = 12 OR Month(@Date) = 1
		RETURN 1
	IF Month(@Date) = 2 OR Month(@Date) = 3 OR Month(@Date) = 4 
		RETURN 2
	IF Month(@Date) = 5 OR Month(@Date) = 6 OR Month(@Date) = 7
		RETURN 3
	RETURN 4
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_Quarter]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_Quarter]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_Quarter]
	TO [davor.dumeljic]
GO
