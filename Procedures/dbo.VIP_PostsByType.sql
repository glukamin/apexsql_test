SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ivan Vasic
-- Create date: 01/26/2009
-- Description:	Posts by Type – Feature requests vs Bug reports
-- =============================================
CREATE PROCEDURE [dbo].[VIP_PostsByType] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Forum_Name, SUM(No_of_Posts) as Posts from tblForum where Forum_Name = 'Feature Requests' or Forum_Name = 'Bugs' 
	group by Forum_Name
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByType]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByType]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByType]
	TO [davor.dumeljic]
GO
