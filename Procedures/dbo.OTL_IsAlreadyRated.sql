SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:-    Pankaj Sutradhar
-- Create date: 09/07/2007
-- Description:	check the rating of template across the user and returns count
-- =============================================
CREATE PROCEDURE [dbo].[OTL_IsAlreadyRated] 
(
	@UserId int,
	@TemplateId int,
	@count int output
)
AS
	
	SET @count=(SELECT COUNT(*) FROM OTL_Ratings WHERE UserId=@UserId AND TemplateId=@TemplateId)
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsAlreadyRated]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsAlreadyRated]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_IsAlreadyRated]
	TO [davor.dumeljic]
GO
