SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_GetVisitedPagesByEmail
(
    @Email nvarchar(100)
)
AS
BEGIN
    SELECT V.Short_URL, V.VisitTime
    FROM ICE_Page_Visits V
    INNER JOIN ICE_Web_Visitors W on V.TrackingID = W.Web_Visitor_ID
    INNER JOIN ICE_SalesLeads S on W.RegisterID = S.Author_ID
    WHERE S.Email like '%' + @Email + '%'
    ORDER BY V.VisitTime DESC
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetVisitedPagesByEmail]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetVisitedPagesByEmail]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetVisitedPagesByEmail]
	TO [davor.dumeljic]
GO
