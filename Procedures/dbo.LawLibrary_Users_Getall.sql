SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LawLibrary_Users_Getall] 
AS
BEGIN
	/*
	Gets all users.
	*/

	SET NOCOUNT ON
	SELECT 
		* 
	FROM 
		tblAuthor 
END

GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_Getall]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_Getall]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_Getall]
	TO [davor.dumeljic]
GO
