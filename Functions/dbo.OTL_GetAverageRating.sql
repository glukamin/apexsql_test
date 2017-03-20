SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/03/2007
-- Description: Returns average rating o the template of given Id
-- =============================================
CREATE FUNCTION [dbo].[OTL_GetAverageRating]
(
@Id int
)  
returns float
AS 
BEGIN 
	DECLARE @avg_Rating float
	Select @avg_Rating=AVG(Rating) FROM OTL_Ratings WHERE TemplateId=@Id
	return @avg_Rating
END




GO
GRANT EXECUTE
	ON [dbo].[OTL_GetAverageRating]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetAverageRating]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetAverageRating]
	TO [davor.dumeljic]
GO
