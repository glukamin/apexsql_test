SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:-      Pankaj Sutradhar
-- Create date: 09/05/2007
-- Description:	Get  User Detail by its id
-- =============================================
CREATE PROCEDURE [dbo].[OTL_Users_GetUserById] 
	@Id int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM uv_OTl_UserDetails WHERE Author_ID=@Id 

END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Users_GetUserById]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Users_GetUserById]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Users_GetUserById]
	TO [davor.dumeljic]
GO
