SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/04/2007
-- Description:	Get user Details
-- =============================================
CREATE VIEW dbo.uv_OTL_BrowseByMember
AS
SELECT      TOP 100 PERCENT dbo.OTL_Templates.UserId, 
	      dbo.OTL_Users.FirstName + ' ' + dbo.OTL_Users.LastName + ' (' + CAST(COUNT(*) AS nvarchar(50)) + ')' AS Poster

FROM         dbo.OTL_Templates INNER JOIN
                   dbo.OTL_Users ON dbo.OTL_Templates.UserId = dbo.OTL_Users.Id

GROUP BY dbo.OTL_Templates.UserId, dbo.OTL_Users.FirstName, dbo.OTL_Users.LastName

ORDER BY COUNT(*) DESC











GO
