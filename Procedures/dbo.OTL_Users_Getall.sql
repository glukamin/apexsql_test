SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	Get Authentical User Detail
-- =============================================
CREATE PROCEDURE [dbo].[OTL_Users_Getall] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

             SELECT * FROM tblAuthor 
END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Users_Getall]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Users_Getall]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Users_Getall]
	TO [davor.dumeljic]
GO
