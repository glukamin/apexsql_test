SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[LawLibrary_Users_Authenticate] 
	@Username nvarchar(25),
	@Password nvarchar(50)
AS
BEGIN
	
	/*
	Authenticates an user.	
	*/

	SET NOCOUNT ON

	SELECT 
		* 
	FROM 
		tblAuthor 
	WHERE 
		Username = @Username AND 
		Password = @Password AND
		Active = 1 
END


GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_Authenticate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_Authenticate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LawLibrary_Users_Authenticate]
	TO [davor.dumeljic]
GO
